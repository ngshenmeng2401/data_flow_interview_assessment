import 'package:data_flow_interview_assessment/constants/dimensions.dart';
import 'package:data_flow_interview_assessment/screens/tabs/home_tab/home_tab_data.dart';
import 'package:data_flow_interview_assessment/screens/tabs/home_tab/widgets/home_content_card.dart';
import 'package:flutter/material.dart';

class DiscoveryCard extends StatelessWidget {
  final HomeDiscoveryData data;

  const DiscoveryCard({required this.data});

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    // TODO dummy data / flow
    // Enable discovery details when its destination is defined.
    return HomeContentCard(
      // Crop the same local photo to the discovery card's varying height.
      // The reference now uses square artwork; text determines card height.
      imagePath: 'assets/images/Image.jpg',
      imageSemanticLabel: data.body,
      label: data.label,
      body: data.body,
      labelStyle: theme.textTheme.bodySmall?.copyWith(
        color: theme.colorScheme.onSurfaceVariant,
        fontSize: 11,
      ),
      bodyStyle: theme.textTheme.titleSmall?.copyWith(
        color: theme.colorScheme.onSurface,
        fontSize: 13,
        fontWeight: FontWeight.w700,
        height: 1.35,
      ),
      contentPadding: const EdgeInsets.all(kSpacing),
      labelBodySpacing: 4,
      bodyMaxLines: 6,
      textScaler: TextScaler.noScaling,
    );
  }
}
