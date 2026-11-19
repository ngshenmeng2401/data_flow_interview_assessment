import 'package:data_flow_interview_assessment/constants/dimensions.dart';
import 'package:data_flow_interview_assessment/constants/enums.dart';
import 'package:data_flow_interview_assessment/generated/l10n.dart';
import 'package:data_flow_interview_assessment/screens/tabs/discover_tab/discover_article.dart';
import 'package:data_flow_interview_assessment/screens/tabs/home_tab/widgets/home_asset_image.dart';
import 'package:flutter/material.dart';

class DiscoverTab extends StatefulWidget {
  final ValueChanged<String> onArticlePressed;

  const DiscoverTab({super.key, required this.onArticlePressed});

  @override
  State<DiscoverTab> createState() => _DiscoverTabState();
}

class _DiscoverTabState extends State<DiscoverTab>
    with AutomaticKeepAliveClientMixin<DiscoverTab> {
  final ValueNotifier<DiscoverFilter> _filter =
      ValueNotifier<DiscoverFilter>(DiscoverFilter.all);

  @override
  bool get wantKeepAlive => true;

  @override
  void dispose() {
    _filter.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    final Lang lang = Lang.of(context);
    final ThemeData theme = Theme.of(context);
    final List<DiscoverArticle> articles = DiscoverArticle.collection(lang);

    return ListView(
      key: const PageStorageKey<String>('discover_scroll'),
      physics: const ClampingScrollPhysics(),
      padding: const EdgeInsets.fromLTRB(kPadding, kPadding, kPadding, kPadding * 2),
      children: <Widget>[
        Text(lang.discover_title, style: theme.textTheme.headlineSmall?.copyWith(
          color: theme.colorScheme.primary,
        )),
        const SizedBox(height: kPadding),
        ValueListenableBuilder<DiscoverFilter>(
          valueListenable: _filter,
          builder: (BuildContext context, DiscoverFilter filter, Widget? child) {
            final bool showFeatured = filter == DiscoverFilter.all;
            final Iterable<DiscoverArticle> results = showFeatured
                ? articles.skip(1)
                : articles.where((DiscoverArticle article) => article.category == filter);
            return Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              spacing: kSpacing,
              children: <Widget>[
                Wrap(
                  spacing: kSpacing,
                  runSpacing: kSpacing / 2,
                  children: <Widget>[
                    for (final DiscoverFilter option in DiscoverFilter.values)
                      ChoiceChip(
                        label: Text(
                          discoverFilterLabel(lang, option),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                        selected: filter == option,
                        materialTapTargetSize: MaterialTapTargetSize.padded,
                        onSelected: (bool selected) {
                          if (selected) {
                            _filter.value = option;
                          }
                        },
                      ),
                  ],
                ),
                if (showFeatured) ...<Widget>[
                  Text(lang.featured_title, style: theme.textTheme.titleMedium),
                  _articleCard(articles.first, featured: true),
                ],
                for (final DiscoverArticle article in results)
                  _articleCard(article),
              ],
            );
          },
        ),
      ],
    );
  }

  Widget _articleCard(DiscoverArticle article, {bool featured = false}) {
    final ThemeData theme = Theme.of(context);
    final Lang lang = Lang.of(context);
    return Card(
      margin: EdgeInsets.zero,
      color: theme.colorScheme.surface,
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        onTap: () => widget.onArticlePressed(article.id),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            if (featured)
              const HomeAssetImage(
                path: DiscoverArticle.imageAsset,
                aspectRatio: 2,
                fit: BoxFit.cover,
              ),
            ListTile(
              leading: featured ? null : const SizedBox.square(
                dimension: kPadding * 3,
                child: HomeAssetImage(path: DiscoverArticle.imageAsset),
              ),
              title: Text(article.title, maxLines: 2, overflow: TextOverflow.ellipsis),
              subtitle: Text(
                discoverFilterLabel(lang, article.category),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              trailing: const Icon(Icons.chevron_right),
            ),
          ],
        ),
      ),
    );
  }
}
