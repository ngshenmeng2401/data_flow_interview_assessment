import 'package:data_flow_interview_assessment/generated/l10n.dart';
import 'package:data_flow_interview_assessment/screens/home_screen.dart';
import 'package:data_flow_interview_assessment/screens/tab_content_screen.dart';
import 'package:data_flow_interview_assessment/screens/tabs/discover_tab/discover_article.dart';
import 'package:data_flow_interview_assessment/screens/tabs/home_tab/widgets/home_asset_image.dart';
import 'package:data_flow_interview_assessment/screens/tabs/inbox_tab/inbox_tab.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AppRouter {
  static const String home = '/';
  static const String discoverArticle = 'discoverArticle';
  static const String inboxNotice = 'inboxNotice';

  final GoRouter router = GoRouter(
    initialLocation: home,
    routes: <RouteBase>[
      GoRoute(
        path: home,
        builder: (BuildContext context, GoRouterState state) =>
            const HomeScreen(),
        routes: <RouteBase>[
          GoRoute(
            path: 'discover/:id',
            name: discoverArticle,
            builder: (BuildContext context, GoRouterState state) {
              final Lang lang = Lang.of(context);
              final DiscoverArticle? article = DiscoverArticle.collection(lang)
                  .where((DiscoverArticle item) => item.id == state.pathParameters['id'])
                  .firstOrNull;
              return TabContentScreen(
                sectionTitle: lang.discover_title,
                title: article?.title ?? lang.discover_title,
                body: article?.body ?? lang.article_unavailable,
                heroImage: article == null ? null : const HomeAssetImage(
                  path: DiscoverArticle.imageAsset,
                  aspectRatio: 2,
                  fit: BoxFit.cover,
                ),
              );
            },
          ),
          GoRoute(
            path: 'inbox/:id',
            name: inboxNotice,
            builder: (BuildContext context, GoRouterState state) {
              final Lang lang = Lang.of(context);
              final List<InboxNotice> notices = <InboxNotice>[
                ...InboxNotice.recent(lang),
                ...InboxNotice.history(lang),
              ];
              final InboxNotice? notice = notices
                  .where((InboxNotice item) => item.id == state.pathParameters['id'])
                  .firstOrNull;
              return TabContentScreen(
                sectionTitle: lang.inbox_title,
                title: notice?.title ?? lang.inbox_title,
                body: notice?.body ?? lang.notice_unavailable,
              );
            },
          ),
        ],
      ),
    ],
  );
}