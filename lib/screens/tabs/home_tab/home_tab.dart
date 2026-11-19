import 'dart:developer' as developer;

import 'package:data_flow_interview_assessment/constants/dimensions.dart';
import 'package:data_flow_interview_assessment/generated/l10n.dart';
import 'package:data_flow_interview_assessment/utils/app_theme_config.dart';
import 'package:data_flow_interview_assessment/widgets/app_elevated_button.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:url_launcher/url_launcher.dart';

part 'home_tab_data.dart';
part 'widgets/home_header.dart';
part 'widgets/category_strip.dart';
part 'widgets/home_section_heading.dart';
part 'widgets/service_card.dart';
part 'widgets/home_content_card.dart';
part 'widgets/shop_plants_strip.dart';
part 'widgets/discoveries_grid.dart';
part 'widgets/discovery_card.dart';
part 'widgets/branch_details.dart';
part 'widgets/home_icon_text.dart';
part 'widgets/home_icon.dart';
part 'widgets/home_asset_image.dart';

class HomeTab extends StatefulWidget {
  const HomeTab({super.key});

  @override
  State<HomeTab> createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> with AutomaticKeepAliveClientMixin<HomeTab> {
  @override
  bool get wantKeepAlive => true;

  Future<void> _openBranchMapsAsync(_HomeBranchData branch) async {
    try {
      final Uri uri = Uri.https('www.google.com', '/maps/search/', <String, String>{
        'api': '1',
        'query': '${branch.name}, Malaysia',
      });
      final bool launched = await launchUrl(uri, mode: LaunchMode.externalApplication);
      if (!launched) {
        throw StateError('External maps launch failed');
      }
    } catch (error, stackTrace) {
      developer.log('Unable to open branch maps', name: 'HomeTab', error: error, stackTrace: stackTrace);
      if (!mounted) {
        return;
      }
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(Lang.of(context).maps_open_failed)),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    final Lang lang = Lang.of(context);
    final ThemeData theme = Theme.of(context);
    final String locale = Localizations.localeOf(context).toString();
    final List<_HomeCategoryData> categories = <_HomeCategoryData>[_HomeCategoryData(label: lang.indoor_plants_title, assetIndex: 1), _HomeCategoryData(label: lang.outdoor_plants_title, assetIndex: 2), _HomeCategoryData(label: lang.succulents_title, assetIndex: 3), _HomeCategoryData(label: lang.pots_title, assetIndex: 4), _HomeCategoryData(label: lang.plant_care_title, assetIndex: 5)];

    return ColoredBox(
      color: theme.colorScheme.surface,
      child: SingleChildScrollView(
        key: const PageStorageKey<String>('home_tab_scroll'),
        physics: const ClampingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            _HomeHeader(
              data: _HomeSampleData.appointment,
              credit: NumberFormat.currency(locale: locale, symbol: 'RM', decimalDigits: 2).format(_HomeSampleData.credit),
              points: NumberFormat.decimalPattern(locale).format(_HomeSampleData.points),
              packages: NumberFormat.decimalPattern(locale).format(_HomeSampleData.packages),
            ),
            const _HomeAssetImage(
              path: 'assets/images/Home Banner.jpg',
              // The supplied banner is 828 by 500; preserve its full artwork.
              aspectRatio: 828 / 500,
            ),
            Padding(
              padding: const EdgeInsets.all(kPadding),
              child: LayoutBuilder(
                builder: (BuildContext context, BoxConstraints constraints) {
                  final double buttonWidth = (constraints.maxWidth - kSpacing * 2) / 3;
                  // TODO dummy data / flow
                  // Enable these actions after their destinations are defined.
                  return ElevatedButtonTheme(
                    data: ElevatedButtonThemeData(
                      style: theme.elevatedButtonTheme.style?.copyWith(backgroundColor: WidgetStatePropertyAll<Color>(theme.colorScheme.secondary), foregroundColor: WidgetStatePropertyAll<Color>(theme.colorScheme.onSecondary)),
                    ),
                    child: Wrap(
                      spacing: kSpacing,
                      runSpacing: kSpacing,
                      children: <Widget>[
                        for (final String label in <String>[lang.shop_title, lang.services_title, lang.posts_title])
                          SizedBox(
                            width: buttonWidth < 96 ? constraints.maxWidth : buttonWidth,
                            child: AppElevatedButton(onPressed: null, child: Text(label, maxLines: 1, overflow: TextOverflow.ellipsis)),
                          ),
                      ],
                    ),
                  );
                },
              ),
            ),
            _CategoryStrip(categories: categories),
            SizedBox(height: kPadding),
            ColoredBox(
              color: theme.scaffoldBackgroundColor,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  _HomeSectionHeading(title: lang.new_services_title, subtitle: lang.recommended_for_you, showViewAll: true, serviceStyle: true),
                  Builder(
                    builder: (BuildContext context) {
                      final _ServiceCardLayout layout = _ServiceCardLayout.measure(context, _HomeSampleData.services);
                      return SizedBox(
                        height: layout.height,
                        child: ListView.separated(
                          key: const PageStorageKey<String>('home_services_scroll'),
                          primary: false,
                          scrollDirection: Axis.horizontal,
                          physics: const BouncingScrollPhysics(),
                          padding: const EdgeInsets.symmetric(horizontal: kPadding * 1.5),
                          itemCount: _HomeSampleData.services.length,
                          separatorBuilder: (BuildContext context, int index) => const SizedBox(width: kSpacing / 2),
                          itemBuilder: (BuildContext context, int index) {
                            return SizedBox(
                              width: _ServiceCardLayout.width,
                              child: _ServiceCard(data: _HomeSampleData.services[index], layout: layout),
                            );
                          },
                        ),
                      );
                    },
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: kSpacing * 2),
                    child: _ShopPlantsStrip(categories: categories),
                  ),
                ],
              ),
            ),
            ColoredBox(
              color: context.appThemeColors.deepGreen,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  LayoutBuilder(
                    builder: (BuildContext context, BoxConstraints constraints) {
                      // Crop the artwork's 24 px outer margins without changing the asset.
                      final double scale = constraints.maxWidth / 828;
                      return AspectRatio(
                        aspectRatio: 828 / 298,
                        child: ClipRect(
                          child: OverflowBox(
                            minWidth: 876 * scale,
                            maxWidth: 876 * scale,
                            minHeight: 346 * scale,
                            maxHeight: 346 * scale,
                            child: Image.asset(
                              'assets/images/Trending Discoveries.jpg',
                              width: 876 * scale,
                              height: 346 * scale,
                              fit: BoxFit.contain,
                              semanticLabel: lang.trending_discoveries_title,
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                  const Padding(
                    padding: EdgeInsets.fromLTRB(kPadding, 0, kPadding, kPadding),
                    child: _DiscoveriesGrid(items: _HomeSampleData.discoveries),
                  ),
                ],
              ),
            ),
            _HomeSectionHeading(title: lang.location_title),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: kPadding),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  // TODO need user revisit / complete
                  // Replace this placeholder with the real static map artwork.
                  _HomeAssetImage(path: 'assets/images/img_placeholder.png', aspectRatio: 2, semanticLabel: lang.location_title),
                  for (final _HomeBranchData branch in _HomeSampleData.branches) ...{_BranchDetails(data: branch, onAddressTap: () => _openBranchMapsAsync(branch))},
                ],
              ),
            ),
            const SizedBox(height: kPadding * 2),
          ],
        ),
      ),
    );
  }
}
