part of 'home_tab.dart';

class _ShopPlantsStrip extends StatelessWidget {
  final List<_HomeCategoryData> categories;

  const _ShopPlantsStrip({required this.categories});

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    return ColoredBox(
      color: theme.scaffoldBackgroundColor,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: kPadding),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Center(
              child: Image.asset(
                'assets/images/Shop Plants - Icon Main.png',
                width: 160,
                fit: BoxFit.contain,
                semanticLabel: Lang.of(context).shop_plants_title,
              ),
            ),
            const SizedBox(height: kSpacing),
            // TODO dummy data / flow
            // Enable category selection after its filtering behavior is defined.
            SingleChildScrollView(
              key: const PageStorageKey<String>('home_shop_plants_scroll'),
              scrollDirection: Axis.horizontal,
              physics: const BouncingScrollPhysics(),
              padding: const EdgeInsets.symmetric(horizontal: kPadding),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  for (int index = 0; index < categories.length; index++)
                    Semantics(
                      selected: index == 0,
                      child: SizedBox(
                        width: 88,
                        child: Column(
                          children: <Widget>[
                            Image.asset(
                              'assets/icons/Shop Plants - Icon ${categories[index].assetIndex}.png',
                              width: 48,
                              height: 48,
                              fit: BoxFit.contain,
                              excludeFromSemantics: true,
                            ),
                            const SizedBox(height: kSpacing / 2),
                            Text(
                              categories[index].label,
                              textAlign: TextAlign.center,
                              style: theme.textTheme.bodySmall?.copyWith(
                                color: theme.colorScheme.primary,
                              ),
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                            ),
                            const SizedBox(height: kSpacing / 2),
                            SizedBox(
                              height: 2,
                              width: 48,
                              child: ColoredBox(
                                color: index == 0
                                    ? theme.colorScheme.primary
                                    : theme.scaffoldBackgroundColor,
                              ),
                            ),
                          ],
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
}
