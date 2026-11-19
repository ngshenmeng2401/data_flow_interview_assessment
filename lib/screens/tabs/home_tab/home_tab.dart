import 'package:data_flow_interview_assessment/constants/dimensions.dart';
import 'package:data_flow_interview_assessment/generated/l10n.dart';
import 'package:data_flow_interview_assessment/utils/app_theme_config.dart';
import 'package:data_flow_interview_assessment/widgets/app_elevated_button.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

part 'home_tab_data.dart';
part 'home_header.dart';
part 'balance_summary.dart';
part 'category_strip.dart';
part 'home_section_heading.dart';
part 'service_card.dart';
part 'shop_plants_strip.dart';
part 'discoveries_grid.dart';
part 'discovery_card.dart';
part 'branch_details.dart';
part 'home_icon_text.dart';
part 'home_icon.dart';
part 'home_asset_image.dart';

class HomeTab extends StatefulWidget {
  const HomeTab({super.key});

  @override
  State<HomeTab> createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> with AutomaticKeepAliveClientMixin<HomeTab> {
  @override
  bool get wantKeepAlive => true;

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
            _HomeHeader(data: _HomeSampleData.appointment),
            Padding(
              padding: const EdgeInsets.all(kPadding),
              child: _BalanceSummary(
                credit: NumberFormat.currency(locale: locale, symbol: 'RM ', decimalDigits: 2).format(_HomeSampleData.credit),
                points: NumberFormat.decimalPattern(locale).format(_HomeSampleData.points),
                packages: NumberFormat.decimalPattern(locale).format(_HomeSampleData.packages),
              ),
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
            _HomeSectionHeading(title: lang.new_services_title, subtitle: lang.recommended_for_you, showViewAll: true),
            LayoutBuilder(
              builder: (BuildContext context, BoxConstraints constraints) {
                final double cardWidth = ((constraints.maxWidth - kPadding * 2) * 0.6).clamp(180.0, 280.0).toDouble();
                return SingleChildScrollView(
                  key: const PageStorageKey<String>('home_services_scroll'),
                  scrollDirection: Axis.horizontal,
                  physics: const BouncingScrollPhysics(),
                  padding: const EdgeInsets.symmetric(horizontal: kPadding),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      for (int index = 0; index < _HomeSampleData.services.length; index++) ...<Widget>[
                        if (index > 0) ...{const SizedBox(width: kSpacing)},
                        SizedBox(
                          width: cardWidth,
                          child: _ServiceCard(data: _HomeSampleData.services[index]),
                        ),
                      ],
                    ],
                  ),
                );
              },
            ),
            Padding(
              padding: const EdgeInsets.only(top: kSpacing * 2),
              child: _ShopPlantsStrip(categories: categories),
            ),
            Padding(
              padding: const EdgeInsets.only(top: kSpacing * 2, bottom: kSpacing),
              child: _HomeAssetImage(path: 'assets/images/Trending Discoveries.jpg', aspectRatio: 876 / 346, semanticLabel: lang.trending_discoveries_title),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: kPadding),
              child: _DiscoveriesGrid(items: _HomeSampleData.discoveries),
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
                  for (final _HomeBranchData branch in _HomeSampleData.branches) ...{_BranchDetails(data: branch)},
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
