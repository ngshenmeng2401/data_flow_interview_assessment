part of 'home_tab.dart';

class _HomeSectionHeading extends StatelessWidget {
  final String title;
  final String? subtitle;
  final bool showViewAll;

  const _HomeSectionHeading({
    required this.title,
    this.subtitle,
    this.showViewAll = false,
  });

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.fromLTRB(
        kPadding, kSpacing * 2, kPadding, kSpacing,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  title,
                  style: theme.textTheme.titleLarge?.copyWith(
                    color: theme.colorScheme.primary,
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                if (subtitle != null)
                  Padding(
                    padding: const EdgeInsets.only(top: kSpacing / 2),
                    child: Text(
                      subtitle!,
                      style: theme.textTheme.bodySmall,
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
              ],
            ),
          ),
          if (showViewAll)
            Padding(
              padding: const EdgeInsets.only(left: kSpacing),
              // TODO dummy data / flow
              // Enable View All when its destination is defined.
              child: TextButton(
                onPressed: null,
                style: TextButton.styleFrom(
                  minimumSize: const Size(48, 48),
                ),
                child: Text(
                  Lang.of(context).view_all_title,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ),
        ],
      ),
    );
  }
}
