part of '../home_tab.dart';

class _DiscoveryCard extends StatelessWidget {
  final _HomeDiscoveryData data;

  const _DiscoveryCard({required this.data});

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    // TODO dummy data / flow
    // Enable discovery details when its destination is defined.
    return ClipRRect(
      borderRadius: BorderRadius.circular(4),
      child: ColoredBox(
        color: theme.colorScheme.surface,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            _HomeAssetImage(
              path: 'assets/images/Image.jpg',
              aspectRatio: 1,
              // Crop the same local photo to the discovery card's varying height.
              // The reference now uses square artwork; text determines card height.
              fit: BoxFit.contain,
              semanticLabel: data.body,
            ),
            Padding(
              padding: const EdgeInsets.all(kSpacing),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    data.label,
                    textScaler: TextScaler.noScaling,
                    style: theme.textTheme.bodySmall?.copyWith(
                      color: theme.colorScheme.onSurfaceVariant,
                      fontSize: 11,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 4),
                  Text(
                    data.body,
                    textScaler: TextScaler.noScaling,
                    style: theme.textTheme.titleSmall?.copyWith(
                      color: theme.colorScheme.onSurface,
                      fontSize: 13,
                      fontWeight: FontWeight.w700,
                      height: 1.35,
                    ),
                    maxLines: 6,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
