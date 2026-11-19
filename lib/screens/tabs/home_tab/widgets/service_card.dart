part of '../home_tab.dart';

class _ServiceCard extends StatelessWidget {
  final _HomeServiceData data;
  final _ServiceCardLayout layout;

  const _ServiceCard({required this.data, required this.layout});

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final String locale = Localizations.localeOf(context).toString();
    // TODO dummy data / flow
    // Enable service details when its destination is defined.
    return Container(
      decoration: BoxDecoration(
        color: theme.colorScheme.surface,
        border: Border.all(color: theme.colorScheme.outline.withValues(alpha: 0.3), width: _ServiceCardLayout.borderWidth),
        borderRadius: BorderRadius.circular(4),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          ClipRRect(
            borderRadius: const BorderRadius.vertical(top: Radius.circular(3)),
            child: _HomeAssetImage(
              path: 'assets/images/Image.jpg',
              semanticLabel: data.title,
            ),
          ),
          Padding(
            padding: _ServiceCardLayout.contentPadding,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  data.label,
                  style: layout.labelStyle,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: kSpacing / 2),
                Text(
                  data.title,
                  style: layout.titleStyle,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: kSpacing / 2),
                Text(
                  NumberFormat.currency(locale: locale, symbol: 'RM ', decimalDigits: 2)
                      .format(data.price),
                  style: layout.priceStyle,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _ServiceCardLayout {
  static const double width = 160;
  static const double borderWidth = 1;
  static const EdgeInsets contentPadding = EdgeInsets.fromLTRB(10, 12, 10, 18);

  final TextStyle labelStyle;
  final TextStyle titleStyle;
  final TextStyle priceStyle;
  final double height;

  const _ServiceCardLayout({
    required this.labelStyle,
    required this.titleStyle,
    required this.priceStyle,
    required this.height,
  });

  factory _ServiceCardLayout.measure(BuildContext context, List<_HomeServiceData> items) {
    final ThemeData theme = Theme.of(context);
    final TextStyle labelStyle = theme.textTheme.labelSmall!.copyWith(
      color: theme.colorScheme.onSurfaceVariant,
      fontSize: 11,
    );
    final TextStyle titleStyle = theme.textTheme.titleSmall!.copyWith(
      fontSize: 13,
      fontWeight: FontWeight.w700,
      height: 1.35,
    );
    final TextStyle priceStyle = theme.textTheme.bodyMedium!.copyWith(
      color: context.appThemeColors.greenTextAccent,
      fontSize: 13,
      fontWeight: FontWeight.w500,
    );
    final Locale locale = Localizations.localeOf(context);
    final NumberFormat priceFormat = NumberFormat.currency(locale: locale.toString(), symbol: 'RM ', decimalDigits: 2);
    double maximumHeight = 0;
    for (final _HomeServiceData item in items) {
      final double textHeight = _measureText(context, item.label, labelStyle, 1) +
          _measureText(context, '${item.title}\n${item.title}', titleStyle, 2) +
          _measureText(context, priceFormat.format(item.price), priceStyle, 1);
      final double cardHeight = borderWidth * 2 + (width - borderWidth * 2) +
          contentPadding.vertical + kSpacing + textHeight;
      if (cardHeight > maximumHeight) {
        maximumHeight = cardHeight;
      }
    }
    return _ServiceCardLayout(
      labelStyle: labelStyle,
      titleStyle: titleStyle,
      priceStyle: priceStyle,
      height: maximumHeight.ceilToDouble(),
    );
  }

  static double _measureText(BuildContext context, String text, TextStyle style, int maxLines) {
    final TextPainter painter = TextPainter(
      text: TextSpan(text: text, style: style),
      textDirection: Directionality.of(context),
      textScaler: MediaQuery.textScalerOf(context),
      locale: Localizations.localeOf(context),
      maxLines: maxLines,
      ellipsis: '…',
    );
    painter.layout(maxWidth: width - borderWidth * 2 - contentPadding.horizontal);
    final double height = painter.height;
    painter.dispose();
    return height;
  }
}
