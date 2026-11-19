import 'package:data_flow_interview_assessment/constants/dimensions.dart';
import 'package:data_flow_interview_assessment/constants/enums.dart';
import 'package:data_flow_interview_assessment/generated/l10n.dart';
import 'package:data_flow_interview_assessment/screens/tabs/home_tab/home_tab_data.dart';
import 'package:flutter/material.dart';

class ShopPlantsStrip extends StatefulWidget {
  final List<HomeCategoryData> categories;

  final ValueChanged<PlantCategory> onCategoryPressed;

  const ShopPlantsStrip({required this.categories, required this.onCategoryPressed});

  @override
  State<ShopPlantsStrip> createState() => _ShopPlantsStripState();
}

class _ShopPlantsStripState extends State<ShopPlantsStrip> {
  final ScrollController _scrollController = ScrollController();
  final ValueNotifier<(bool, bool)> _fades = ValueNotifier<(bool, bool)>((false, false));
  bool _boundaryUpdateScheduled = false;

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_scheduleBoundaryUpdate);
    _scheduleBoundaryUpdate();
  }

  @override
  void didUpdateWidget(covariant ShopPlantsStrip oldWidget) {
    super.didUpdateWidget(oldWidget);
    _scheduleBoundaryUpdate();
  }

  @override
  void dispose() {
    _scrollController.removeListener(_scheduleBoundaryUpdate);
    _scrollController.dispose();
    _fades.dispose();
    super.dispose();
  }

  void _scheduleBoundaryUpdate() {
    if (_boundaryUpdateScheduled) {
      return;
    }
    _boundaryUpdateScheduled = true;
    WidgetsBinding.instance.addPostFrameCallback((Duration timeStamp) {
      _boundaryUpdateScheduled = false;
      if (!mounted) {
        return;
      }
      _updateBoundaries();
    });
  }

  void _updateBoundaries() {
    if (!_scrollController.hasClients || !_scrollController.position.hasContentDimensions) {
      return;
    }
    final ScrollPosition position = _scrollController.position;
    _fades.value = (
      position.pixels > position.minScrollExtent + 0.5,
      position.pixels < position.maxScrollExtent - 0.5,
    );
  }

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    return ColoredBox(
      color: theme.scaffoldBackgroundColor,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(kPadding * 1.5, 0, kPadding, kPadding),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            // TODO dummy data / flow
            // Enable category selection after its filtering behavior is defined.
            Row(
              children: <Widget>[
                Image.asset(
                  'assets/images/Shop Plants - Icon Main.png',
                  width: 70,
                  fit: BoxFit.contain,
                  semanticLabel: Lang.of(context).shop_plants_title,
                ),
                const SizedBox(width: kSpacing),
                Expanded(
                  child: SizedBox(
                    height: 54,
                    child: Stack(
                      fit: StackFit.expand,
                      children: <Widget>[
                        NotificationListener<ScrollMetricsNotification>(
                          onNotification: (ScrollMetricsNotification notification) {
                            _scheduleBoundaryUpdate();
                            return false;
                          },
                          child: ListView.separated(
                            key: const PageStorageKey<String>('home_shop_plants_scroll'),
                            controller: _scrollController,
                            primary: false,
                            scrollDirection: Axis.horizontal,
                            physics: const BouncingScrollPhysics(),
                            padding: EdgeInsets.zero,
                            itemCount: widget.categories.length,
                            separatorBuilder: (BuildContext context, int index) => const SizedBox(width: kSpacing),
                            itemBuilder: (BuildContext context, int index) {
                              final HomeCategoryData category = widget.categories[index];
                              return SizedBox(
                                width: 54,
                                height: 54,
                                child: IconButton(
                                  tooltip: category.label,
                                  onPressed: () => widget.onCategoryPressed(category.category),
                                  padding: const EdgeInsets.all(kSpacing),
                                  style: IconButton.styleFrom(
                                    backgroundColor: theme.colorScheme.surface,
                                    shape: const CircleBorder(),
                                  ),
                                  icon: Image.asset(
                                    'assets/icons/Shop Plants - Icon ${category.assetIndex}.png',
                                    fit: BoxFit.contain,
                                    excludeFromSemantics: true,
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                        ValueListenableBuilder<(bool, bool)>(
                          valueListenable: _fades,
                          builder: (BuildContext context, (bool, bool) fades, Widget? child) {
                            return IgnorePointer(
                              child: Stack(
                                children: <Widget>[
                                  if (fades.$1) _buildFade(theme.scaffoldBackgroundColor, true),
                                  if (fades.$2) _buildFade(theme.scaffoldBackgroundColor, false),
                                ],
                              ),
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: kSpacing),
            SizedBox(
              height: 6,
              child: Stack(
                alignment: Alignment.centerLeft,
                children: <Widget>[
                  Container(
                    height: 2,
                    color: theme.colorScheme.secondary.withValues(alpha: 0.5),
                  ),
                  Positioned(
                    left: 58,
                    child: Container(
                      width: 42,
                      height: 6,
                      decoration: BoxDecoration(
                        color: theme.colorScheme.primary,
                        borderRadius: BorderRadius.circular(kBorderRadius),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildFade(Color background, bool leading) {
    return PositionedDirectional(
      start: leading ? 0 : null,
      end: leading ? null : 0,
      top: 0,
      bottom: 0,
      width: 24,
      child: DecoratedBox(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: leading ? AlignmentDirectional.centerStart : AlignmentDirectional.centerEnd,
            end: leading ? AlignmentDirectional.centerEnd : AlignmentDirectional.centerStart,
            colors: <Color>[background, background.withValues(alpha: 0)],
          ),
        ),
      ),
    );
  }
}
