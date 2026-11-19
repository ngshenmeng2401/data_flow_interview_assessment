import 'package:data_flow_interview_assessment/constants/dimensions.dart';
import 'package:data_flow_interview_assessment/screens/tabs/home_tab/home_tab_data.dart';
import 'package:data_flow_interview_assessment/screens/tabs/home_tab/widgets/home_asset_image.dart';
import 'package:data_flow_interview_assessment/utils/app_theme_config.dart';
import 'package:data_flow_interview_assessment/widgets/content_card.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ServiceCard extends StatelessWidget {
  final HomeServiceData data;
  final ServiceCardLayout layout;

  const ServiceCard({required this.data, required this.layout});

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final String locale = Localizations.localeOf(context).toString();
    // TODO dummy data / flow
    // Enable service details when its destination is defined.
    return ContentCard(
      image: HomeAssetImage(
        path: 'assets/images/Image.jpg',
        semanticLabel: data.title,
      ),
      label: data.label,
      body: data.title,
      labelStyle: layout.labelStyle,
      bodyStyle: layout.titleStyle,
      contentPadding: ServiceCardLayout.contentPadding,
      labelBodySpacing: kSpacing / 2,
      bodyMaxLines: 2,
      border: Border.all(
        color: theme.colorScheme.outline.withValues(alpha: 0.3),
        width: ServiceCardLayout.borderWidth,
      ),
      imageBorderRadius: const BorderRadius.vertical(top: Radius.circular(3)),
      clipBehavior: Clip.none,
      footerSpacing: kSpacing / 2,
      footer: Text(
        NumberFormat.currency(locale: locale, symbol: 'RM ', decimalDigits: 2).format(data.price),
        style: layout.priceStyle,
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
      ),
    );
  }
}

class ServiceCardLayout {
  static const double width = 160;
  static const double borderWidth = 1;
  static const EdgeInsets contentPadding = EdgeInsets.fromLTRB(10, 12, 10, 18);

  final TextStyle labelStyle;
  final TextStyle titleStyle;
  final TextStyle priceStyle;
  final double height;

  const ServiceCardLayout({
    required this.labelStyle,
    required this.titleStyle,
    required this.priceStyle,
    required this.height,
  });

  factory ServiceCardLayout.measure(
    BuildContext context,
    List<HomeServiceData> items, {
    double cardWidth = width,
  }) {
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
    for (final HomeServiceData item in items) {
      final double textWidth = cardWidth - borderWidth * 2 - contentPadding.horizontal;
      final double textHeight = _measureText(context, item.label, labelStyle, 1, textWidth) +
          _measureText(context, '${item.title}\n${item.title}', titleStyle, 2, textWidth) +
          _measureText(context, priceFormat.format(item.price), priceStyle, 1, textWidth);
      final double cardHeight = cardWidth +
          contentPadding.vertical + kSpacing + textHeight;
      if (cardHeight > maximumHeight) {
        maximumHeight = cardHeight;
      }
    }
    return ServiceCardLayout(
      labelStyle: labelStyle,
      titleStyle: titleStyle,
      priceStyle: priceStyle,
      height: maximumHeight.ceilToDouble(),
    );
  }

  static double _measureText(BuildContext context, String text, TextStyle style, int maxLines, double maxWidth) {
    final TextPainter painter = TextPainter(
      text: TextSpan(text: text, style: style),
      textDirection: Directionality.of(context),
      textScaler: MediaQuery.textScalerOf(context),
      locale: Localizations.localeOf(context),
      maxLines: maxLines,
      ellipsis: '…',
    );
    painter.layout(maxWidth: maxWidth);
    final double height = painter.height;
    painter.dispose();
    return height;
  }
}
