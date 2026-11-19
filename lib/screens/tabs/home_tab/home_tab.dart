import 'dart:developer' as developer;
import 'package:data_flow_interview_assessment/constants/dimensions.dart';
import 'package:data_flow_interview_assessment/constants/enums.dart';
import 'package:data_flow_interview_assessment/generated/l10n.dart';
import 'package:data_flow_interview_assessment/screens/tabs/discover_tab/discover_article.dart';
import 'package:data_flow_interview_assessment/screens/tabs/home_tab/home_tab_data.dart';
import 'package:data_flow_interview_assessment/screens/tabs/home_tab/widgets/branch_details.dart';
import 'package:data_flow_interview_assessment/screens/tabs/home_tab/widgets/category_strip.dart';
import 'package:data_flow_interview_assessment/screens/tabs/home_tab/widgets/discoveries_grid.dart';
import 'package:data_flow_interview_assessment/screens/tabs/home_tab/widgets/home_asset_image.dart';
import 'package:data_flow_interview_assessment/screens/tabs/home_tab/widgets/home_branch_map.dart';
import 'package:data_flow_interview_assessment/screens/tabs/home_tab/widgets/home_header.dart';
import 'package:data_flow_interview_assessment/screens/tabs/home_tab/widgets/home_section_heading.dart';
import 'package:data_flow_interview_assessment/screens/tabs/home_tab/widgets/service_card.dart';
import 'package:data_flow_interview_assessment/screens/tabs/home_tab/widgets/shop_plants_strip.dart';
import 'package:data_flow_interview_assessment/utils/app_theme_config.dart';
import 'package:data_flow_interview_assessment/widgets/app_elevated_button.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:url_launcher/url_launcher.dart';

class HomeTab extends StatefulWidget {
  final VoidCallback onShopPressed;
  final ValueChanged<PlantCategory> onCategoryPressed;
  final VoidCallback onDiscoverPressed;
  final ValueChanged<String> onArticlePressed;

  const HomeTab({
    super.key,
    required this.onShopPressed,
    required this.onCategoryPressed,
    required this.onDiscoverPressed,
    required this.onArticlePressed,
  });

  @override
  State<HomeTab> createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> with AutomaticKeepAliveClientMixin<HomeTab> {
  final GlobalKey _newServicesKey = GlobalKey();

  @override
  bool get wantKeepAlive => true;

  void _scrollToServices() {
    final BuildContext? headingContext = _newServicesKey.currentContext;
    if (headingContext == null) {
      return;
    }
    Scrollable.ensureVisible(
      headingContext,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }

  Future<void> _openBranchMapsAsync(HomeBranchData branch) async {
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
    final List<HomeCategoryData> categories = <HomeCategoryData>[HomeCategoryData(category: PlantCategory.indoor, label: lang.indoor_plants_title, assetIndex: 1), HomeCategoryData(category: PlantCategory.outdoor, label: lang.outdoor_plants_title, assetIndex: 2), HomeCategoryData(category: PlantCategory.succulents, label: lang.succulents_title, assetIndex: 3), HomeCategoryData(category: PlantCategory.pots, label: lang.pots_title, assetIndex: 4), HomeCategoryData(category: PlantCategory.plantCare, label: lang.plant_care_title, assetIndex: 5)];

    return ColoredBox(
      color: theme.colorScheme.surface,
      child: SingleChildScrollView(
        key: const PageStorageKey<String>('home_tab_scroll'),
        physics: const ClampingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            HomeHeader(
              data: HomeSampleData.appointment,
              credit: NumberFormat.currency(locale: locale, symbol: 'RM', decimalDigits: 2).format(HomeSampleData.credit),
              points: NumberFormat.decimalPattern(locale).format(HomeSampleData.points),
              packages: NumberFormat.decimalPattern(locale).format(HomeSampleData.packages),
            ),
            const HomeAssetImage(
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
                        for (final (String label, VoidCallback onPressed) in <(String, VoidCallback)>[
                          (lang.shop_title, widget.onShopPressed),
                          (lang.services_title, _scrollToServices),
                          (lang.posts_title, widget.onDiscoverPressed),
                        ])
                          SizedBox(
                            width: buttonWidth < 96 ? constraints.maxWidth : buttonWidth,
                            child: AppElevatedButton(onPressed: onPressed, child: Text(label, maxLines: 1, overflow: TextOverflow.ellipsis)),
                          ),
                      ],
                    ),
                  );
                },
              ),
            ),
            CategoryStrip(categories: categories, onCategoryPressed: widget.onCategoryPressed),
            SizedBox(height: kPadding),
            ColoredBox(
              color: theme.scaffoldBackgroundColor,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  HomeSectionHeading(key: _newServicesKey, title: lang.new_services_title, subtitle: lang.recommended_for_you, showViewAll: true, serviceStyle: true),
                  Builder(
                    builder: (BuildContext context) {
                      final ServiceCardLayout layout = ServiceCardLayout.measure(context, HomeSampleData.services);
                      return SizedBox(
                        height: layout.height,
                        child: ListView.separated(
                          key: const PageStorageKey<String>('home_services_scroll'),
                          primary: false,
                          scrollDirection: Axis.horizontal,
                          physics: const BouncingScrollPhysics(),
                          padding: const EdgeInsets.symmetric(horizontal: kPadding * 1.5),
                          itemCount: HomeSampleData.services.length,
                          separatorBuilder: (BuildContext context, int index) => const SizedBox(width: kSpacing / 2),
                          itemBuilder: (BuildContext context, int index) {
                            return SizedBox(
                              width: ServiceCardLayout.width,
                              child: ServiceCard(data: HomeSampleData.services[index], layout: layout),
                            );
                          },
                        ),
                      );
                    },
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: kSpacing * 2),
                    child: ShopPlantsStrip(categories: categories, onCategoryPressed: widget.onCategoryPressed),
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
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: kPadding),
                    child: Align(
                      alignment: AlignmentDirectional.centerEnd,
                      child: TextButton(
                        onPressed: widget.onDiscoverPressed,
                        style: TextButton.styleFrom(
                          foregroundColor: theme.colorScheme.onPrimary,
                          minimumSize: const Size(48, 48),
                        ),
                        child: Text(lang.view_all_title, maxLines: 1, overflow: TextOverflow.ellipsis),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(kPadding, 0, kPadding, kPadding),
                    child: DiscoveriesGrid(
                      items: DiscoverArticle.collection(lang),
                      onArticlePressed: widget.onArticlePressed,
                    ),
                  ),
                ],
              ),
            ),
            HomeSectionHeading(title: lang.location_title),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: kPadding),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  // TODO need user revisit / complete
                  // Replace this placeholder with the real static map artwork.
                  HomeBranchMap(branches: HomeSampleData.branches, onBranchPressed: _openBranchMapsAsync),
                  for (final HomeBranchData branch in HomeSampleData.branches) ...{BranchDetails(data: branch, onAddressTap: () => _openBranchMapsAsync(branch))},
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
