part of '../home_tab.dart';

class _DiscoveryCard extends StatelessWidget {
  final _HomeDiscoveryData data;

  const _DiscoveryCard({required this.data});

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    // TODO dummy data / flow
    // Enable discovery details when its destination is defined.
    return _HomeContentCard(
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
