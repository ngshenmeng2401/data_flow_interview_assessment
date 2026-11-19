part of '../home_tab.dart';

class _DiscoveryCard extends StatelessWidget {
  final _HomeDiscoveryData data;

  const _DiscoveryCard({required this.data});

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    // TODO dummy data / flow
    // Enable discovery details when its destination is defined.
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        ClipRRect(
          borderRadius: BorderRadius.circular(kBorderRadius),
          child: _HomeAssetImage(
            path: 'assets/images/Image.jpg',
            aspectRatio: data.aspectRatio,
            // Crop the same local photo to the discovery card's varying height.
            fit: BoxFit.cover,
            semanticLabel: data.title,
          ),
        ),
        const SizedBox(height: kSpacing / 2),
        Text(
          data.title,
          textScaler: TextScaler.noScaling,
          style: theme.textTheme.titleSmall?.copyWith(
            color: theme.colorScheme.primary,
          ),
          maxLines: 3,
          overflow: TextOverflow.ellipsis,
        ),
        const SizedBox(height: kSpacing / 2),
        Text(
          data.description,
          textScaler: TextScaler.noScaling,
          style: theme.textTheme.bodySmall,
          maxLines: 4,
          overflow: TextOverflow.ellipsis,
        ),
      ],
    );
  }
}
