import 'dart:developer' as developer;

import 'package:data_flow_interview_assessment/constants/dimensions.dart';
import 'package:data_flow_interview_assessment/generated/l10n.dart';
import 'package:data_flow_interview_assessment/screens/tabs/home_tab/home_tab_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:url_launcher/url_launcher.dart';

class HomeBranchMap extends StatefulWidget {
  const HomeBranchMap({super.key, required this.branches});

  final List<HomeBranchData> branches;

  @override
  State<HomeBranchMap> createState() => _HomeBranchMapState();
}

class _HomeBranchMapState extends State<HomeBranchMap> {
  static const String _tileUrl = 'https://tile.openstreetmap.org/{z}/{x}/{y}.png';
  static const String _tileClientName = 'com.dataflow.interviewassessment';

  final ValueNotifier<bool> _hasTileError = ValueNotifier<bool>(false);

  @override
  void dispose() {
    _hasTileError.dispose();
    super.dispose();
  }

  void _onTileError(TileImage tile, Object error, StackTrace? stackTrace) {
    if (!mounted || _hasTileError.value) {
      return;
    }

    developer.log('Unable to load OpenStreetMap tile ${tile.coordinates} from tile.openstreetmap.org', name: 'HomeBranchMap', error: error, stackTrace: stackTrace);
    _hasTileError.value = true;
  }

  Future<void> _openAttributionAsync() async {
    try {
      await launchUrl(Uri.https('www.openstreetmap.org', '/copyright'), mode: LaunchMode.externalApplication);
    } on Exception {
      // The credit stays visible if an external browser is unavailable.
    }
  }

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final Color background = theme.colorScheme.surfaceContainerHighest;
    final List<Marker> markers = <Marker>[
      for (final HomeBranchData branch in widget.branches)
        Marker(
          point: LatLng(branch.latitude, branch.longitude),
          width: kSpacing * 2,
          height: kSpacing * 2,
          child: Icon(Icons.location_on, color: theme.colorScheme.primary, semanticLabel: branch.name),
        ),
    ];

    return AspectRatio(
      aspectRatio: 2,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(kBorderRadius),
        child: ValueListenableBuilder<bool>(
          valueListenable: _hasTileError,
          builder: (BuildContext context, bool hasTileError, Widget? child) {
            if (hasTileError || markers.isEmpty) {
              return ColoredBox(
                color: background,
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.all(kPadding),
                    child: Text(Lang.of(context).maps_open_failed, textAlign: TextAlign.center, style: theme.textTheme.bodyMedium),
                  ),
                ),
              );
            }

            final LatLng firstPoint = markers.first.point;
            final LatLng lastPoint = markers.last.point;

            return FlutterMap(
              options: MapOptions(
                initialCenter: LatLng((firstPoint.latitude + lastPoint.latitude) / 2, (firstPoint.longitude + lastPoint.longitude) / 2),
                initialZoom: 11.5,
                interactionOptions: const InteractionOptions(flags: InteractiveFlag.drag | InteractiveFlag.pinchMove | InteractiveFlag.pinchZoom | InteractiveFlag.doubleTapZoom | InteractiveFlag.scrollWheelZoom),
                // backgroundColor: background,
              ),
              children: <Widget>[
                TileLayer(
                    urlTemplate: _tileUrl,
                    userAgentPackageName: _tileClientName,
                    maxNativeZoom: 18,
                    errorTileCallback: _onTileError
                ),
                MarkerLayer(markers: markers),
                SimpleAttributionWidget(source: const Text('OpenStreetMap contributors'), onTap: _openAttributionAsync),
              ],
            );
          },
        ),
      ),
    );
  }
}
