part of 'home_tab.dart';

class _CategoryStrip extends StatelessWidget {
  final List<_HomeCategoryData> categories;

  const _CategoryStrip({required this.categories});

  @override
  Widget build(BuildContext context) {
    // TODO dummy data / flow
    // Enable category navigation once its destinations are defined.
    return SingleChildScrollView(
      key: const PageStorageKey<String>('home_categories_scroll'),
      scrollDirection: Axis.horizontal,
      physics: const BouncingScrollPhysics(),
      padding: const EdgeInsets.symmetric(horizontal: kPadding),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          for (int index = 0; index < categories.length; index++) ...<Widget>[
            if (index > 0) const SizedBox(width: kSpacing),
            SizedBox(
              width: 80,
              child: Column(
                children: <Widget>[
                  ClipOval(
                    child: Image.asset(
                      'assets/icons/Button - Icon ${categories[index].assetIndex}.png',
                      width: 64,
                      height: 64,
                      fit: BoxFit.contain,
                      excludeFromSemantics: true,
                    ),
                  ),
                  const SizedBox(height: kSpacing / 2),
                  Text(
                    categories[index].label,
                    style: Theme.of(context).textTheme.bodySmall,
                    textAlign: TextAlign.center,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
          ],
        ],
      ),
    );
  }
}
