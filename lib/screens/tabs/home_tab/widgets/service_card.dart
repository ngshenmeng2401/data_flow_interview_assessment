part of '../home_tab.dart';

class _ServiceCard extends StatelessWidget {
  final _HomeServiceData data;

  const _ServiceCard({required this.data});

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final String locale = Localizations.localeOf(context).toString();
    // TODO dummy data / flow
    // Enable service details when its destination is defined.
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        ClipRRect(
          borderRadius: BorderRadius.circular(kBorderRadius),
          child: _HomeAssetImage(
            path: 'assets/images/Image.jpg',
            semanticLabel: data.title,
          ),
        ),
        const SizedBox(height: kSpacing / 2),
        Text(
          Lang.of(context).recommended_title,
          style: theme.textTheme.labelSmall?.copyWith(
            color: context.appThemeColors.greenTextAccent,
          ),
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
        const SizedBox(height: kSpacing / 2),
        Text(
          data.title,
          style: theme.textTheme.titleSmall,
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
        ),
        const SizedBox(height: kSpacing / 2),
        Text(
          NumberFormat.currency(locale: locale, symbol: 'RM ', decimalDigits: 2)
              .format(data.price),
          style: theme.textTheme.bodyMedium?.copyWith(
            color: theme.colorScheme.primary,
          ),
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
      ],
    );
  }
}
