import 'package:data_flow_interview_assessment/constants/dimensions.dart';
import 'package:data_flow_interview_assessment/constants/enums.dart';
import 'package:data_flow_interview_assessment/generated/l10n.dart';
import 'package:data_flow_interview_assessment/utils/app_theme_config.dart';
import 'package:data_flow_interview_assessment/widgets/content_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class MallTab extends StatefulWidget {
  final VoidCallback onBack;

  final PlantCategory? category;

  const MallTab({super.key, required this.onBack, this.category});

  @override
  State<MallTab> createState() => _MallTabState();
}

class _MallTabState extends State<MallTab> {
  static const double _imageAspectRatio = 0.96;
  static const double _cardContentHeight = 116;

  final RxString _query = ''.obs;
  final RxBool _discountedOnly = false.obs;

  @override
  void dispose() {
    _query.close();
    _discountedOnly.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final Lang lang = Lang.of(context);
    // TODO dummy data / flow
    final List<_MallProduct> catalog = <_MallProduct>[
      _MallProduct('Peace Lily', lang.indoor_plants_title, PlantCategory.indoor, 100),
      _MallProduct('Moth Orchid', lang.indoor_plants_title, PlantCategory.indoor, 50, originalPrice: 100),
      _MallProduct('Snake Plant', lang.indoor_plants_title, PlantCategory.indoor, 100),
      _MallProduct('Jade Plant', lang.succulents_title, PlantCategory.succulents, 50, originalPrice: 100),
      _MallProduct('Aloe Vera', lang.succulents_title, PlantCategory.succulents, 100),
      _MallProduct('Mini Rose', lang.outdoor_plants_title, PlantCategory.outdoor, 50, originalPrice: 100),
    ];
    final String locale = Localizations.localeOf(context).toString();
    final NumberFormat priceFormat = NumberFormat.currency(
      locale: locale,
      symbol: 'RM ',
      decimalDigits: 2,
    );
    final String discountLabel = NumberFormat.percentPattern(locale).format(0.5);

    return Column(
      children: <Widget>[
        _buildHeader(context, lang),
        Expanded(
          child: Obx(() {
            final String query = _query.value;
            final bool discountedOnly = _discountedOnly.value;
            final List<_MallProduct> products = catalog.where((_MallProduct product) {
              final bool matchesQuery = product.title.toLowerCase().contains(query) ||
                  product.label.toLowerCase().contains(query);
              final bool matchesCategory = widget.category == null || product.category == widget.category;
              return matchesCategory && matchesQuery && (!discountedOnly || product.originalPrice != null);
            }).toList();

            if (products.isEmpty) {
              return Center(
                child: Padding(
                  padding: const EdgeInsets.all(kPadding),
                  child: Text(lang.no_products_found, textAlign: TextAlign.center),
                ),
              );
            }

            return LayoutBuilder(
              builder: (BuildContext context, BoxConstraints constraints) {
                final double itemWidth = (constraints.maxWidth - kPadding * 2 - kSpacing) / 2;
                return GridView.builder(
                  physics: const ClampingScrollPhysics(),
                  padding: const EdgeInsets.fromLTRB(kPadding, kPadding, kPadding, kPadding * 2),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: kSpacing,
                    mainAxisSpacing: kSpacing,
                    mainAxisExtent: itemWidth / _imageAspectRatio + _cardContentHeight,
                  ),
                  itemCount: products.length,
                  itemBuilder: (BuildContext context, int index) {
                    return _buildProductCard(theme, products[index], priceFormat, discountLabel);
                  },
                );
              },
            );
          }),
        ),
      ],
    );
  }

  Widget _buildHeader(BuildContext context, Lang lang) {
    final ThemeData theme = Theme.of(context);
    final ColorScheme colors = theme.colorScheme;
    return Material(
      color: colors.surface,
      child: Padding(
        padding: const EdgeInsetsDirectional.fromSTEB(0, kSpacing / 2, kPadding, kSpacing / 2),
        child: Row(
          children: <Widget>[
            IconButton(
              tooltip: MaterialLocalizations.of(context).backButtonTooltip,
              icon: const BackButtonIcon(),
              color: colors.primary,
              onPressed: widget.onBack,
            ),
            Expanded(
              child: Material(
                color: colors.surface,
                elevation: 2,
                shape: const StadiumBorder(),
                child: TextField(
                  onChanged: (String value) => _query.value = value.trim().toLowerCase(),
                  textInputAction: TextInputAction.search,
                  decoration: InputDecoration(
                    hintText: lang.search_salon_title,
                    border: InputBorder.none,
                    enabledBorder: InputBorder.none,
                    focusedBorder: InputBorder.none,
                    filled: false,
                    contentPadding: const EdgeInsets.symmetric(vertical: kSpacing),
                    prefixIcon: Center(
                      widthFactor: 1,
                      child: Image.asset(
                        'assets/icons/Icon - Search.png',
                        width: 20,
                        excludeFromSemantics: true,
                      ),
                    ),
                    suffixIcon: Obx(() {
                      final bool selected = _discountedOnly.value;
                      return IconButton(
                        tooltip: lang.discounted_products_only,
                        isSelected: selected,
                        style: IconButton.styleFrom(
                          backgroundColor: selected ? colors.primary : colors.surface,
                        ),
                        icon: Image.asset(
                          'assets/icons/Icon - Filter.png',
                          width: 22,
                          color: selected ? colors.onPrimary : colors.onSurfaceVariant,
                          excludeFromSemantics: true,
                        ),
                        onPressed: () => _discountedOnly.value = !selected,
                      );
                    }),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildProductCard(
    ThemeData theme,
    _MallProduct product,
    NumberFormat priceFormat,
    String discountLabel,
  ) {
    final ColorScheme colors = theme.colorScheme;
    final double? originalPrice = product.originalPrice;
    return ContentCard(
      image: AspectRatio(
        aspectRatio: _imageAspectRatio,
        child: Image.asset(
          'assets/images/Image.jpg',
          fit: BoxFit.cover,
          excludeFromSemantics: true,
          errorBuilder: (BuildContext context, Object error, StackTrace? stackTrace) {
            return Image.asset(
              'assets/images/img_placeholder.png',
              fit: BoxFit.contain,
              excludeFromSemantics: true,
            );
          },
        ),
      ),
      imageOverlay: originalPrice == null
          ? null
          : Padding(
              padding: const EdgeInsets.all(kSpacing / 2),
              child: Image.asset(
                'assets/images/fifty_percent.png',
                width: 46,
                height: 46,
                semanticLabel: discountLabel,
              ),
            ),
      imageBorderRadius: BorderRadius.circular(4),
      label: product.label,
      body: product.title,
      labelStyle: theme.textTheme.bodySmall?.copyWith(color: colors.onSurfaceVariant),
      bodyStyle: theme.textTheme.titleSmall?.copyWith(fontWeight: FontWeight.w700),
      contentPadding: const EdgeInsets.fromLTRB(kSpacing / 2, kSpacing, kSpacing / 2, 0),
      labelBodySpacing: 4,
      bodyMaxLines: 2,
      textScaler: TextScaler.noScaling,
      footerSpacing: kSpacing / 2,
      footer: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          if (originalPrice != null)
            Text(
              priceFormat.format(originalPrice),
              style: theme.textTheme.bodySmall?.copyWith(
                color: colors.onSurfaceVariant,
                decoration: TextDecoration.lineThrough,
              ),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              textScaler: TextScaler.noScaling,
            ),
          Text(
            priceFormat.format(product.price),
            style: theme.textTheme.bodyMedium?.copyWith(
              color: theme.extension<AppThemeColors>()?.greenTextAccent ?? colors.primary,
              fontWeight: FontWeight.w500,
            ),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            textScaler: TextScaler.noScaling,
          ),
        ],
      ),
    );
  }
}

class _MallProduct {
  final String title;
  final String label;
  final PlantCategory category;
  final double price;
  final double? originalPrice;

  const _MallProduct(this.title, this.label, this.category, this.price, {this.originalPrice});
}
