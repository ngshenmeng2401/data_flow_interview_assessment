import 'package:data_flow_interview_assessment/constants/dimensions.dart';
import 'package:data_flow_interview_assessment/generated/l10n.dart';
import 'package:flutter/material.dart';

class InboxNotice {
  final String id;
  final String title;
  final String preview;
  final String body;
  final IconData icon;

  const InboxNotice({
    required this.id,
    required this.title,
    required this.preview,
    required this.body,
    required this.icon,
  });

  static List<InboxNotice> recent(Lang lang) => <InboxNotice>[
    InboxNotice(
      id: 'discover',
      title: lang.inbox_discover_title,
      preview: lang.inbox_discover_preview,
      body: lang.inbox_discover_message,
      icon: Icons.eco_outlined,
    ),
    InboxNotice(
      id: 'mall',
      title: lang.inbox_mall_title,
      preview: lang.inbox_mall_preview,
      body: lang.inbox_mall_message,
      icon: Icons.storefront_outlined,
    ),
  ];

  static List<InboxNotice> history(Lang lang) => <InboxNotice>[
    InboxNotice(
      id: 'branches',
      title: lang.inbox_branches_title,
      preview: lang.inbox_branches_preview,
      body: lang.inbox_branches_message,
      icon: Icons.place_outlined,
    ),
  ];
}

class InboxTab extends StatelessWidget {
  final ValueChanged<String> onNoticePressed;

  const InboxTab({super.key, required this.onNoticePressed});

  @override
  Widget build(BuildContext context) {
    final Lang lang = Lang.of(context);
    final ThemeData theme = Theme.of(context);
    return DefaultTabController(
      length: 2,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(kPadding),
            child: Text(lang.inbox_title, style: theme.textTheme.headlineSmall?.copyWith(
              color: theme.colorScheme.primary,
            )),
          ),
          Material(
            color: theme.colorScheme.surface,
            child: TabBar(
              tabs: <Widget>[
                Tab(text: lang.recent_title),
                Tab(text: lang.history_title),
              ],
            ),
          ),
          Expanded(
            child: TabBarView(
              physics: const NeverScrollableScrollPhysics(),
              children: <Widget>[
                _notices(context, InboxNotice.recent(lang)),
                _notices(context, InboxNotice.history(lang)),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _notices(BuildContext context, List<InboxNotice> notices) {
    final ThemeData theme = Theme.of(context);
    return ListView.separated(
      physics: const ClampingScrollPhysics(),
      padding: const EdgeInsets.fromLTRB(kPadding, kPadding, kPadding, kPadding * 2),
      itemCount: notices.length,
      separatorBuilder: (BuildContext context, int index) => const SizedBox(height: kSpacing),
      itemBuilder: (BuildContext context, int index) {
        final InboxNotice notice = notices[index];
        return Card(
          margin: EdgeInsets.zero,
          color: theme.colorScheme.surface,
          clipBehavior: Clip.antiAlias,
          child: ListTile(
            leading: Icon(notice.icon, color: theme.colorScheme.primary),
            title: Text(notice.title, maxLines: 2, overflow: TextOverflow.ellipsis),
            subtitle: Text(notice.preview, maxLines: 3, overflow: TextOverflow.ellipsis),
            trailing: const Icon(Icons.chevron_right),
            onTap: () => onNoticePressed(notice.id),
          ),
        );
      },
    );
  }
}
