part of 'home_tab.dart';

class _BranchDetails extends StatelessWidget {
  final _HomeBranchData data;

  const _BranchDetails({required this.data});

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.only(top: kSpacing * 2),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            data.name,
            style: theme.textTheme.titleMedium?.copyWith(
              color: theme.colorScheme.primary,
            ),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
          const SizedBox(height: kSpacing),
          _HomeIconText(
            iconPath: 'assets/icons/Icon - Location.png',
            text: data.address,
            maxLines: 5,
            expandText: true,
          ),
          const SizedBox(height: kSpacing),
          Text(
            Lang.of(context).opening_hours_title,
            style: theme.textTheme.titleSmall,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          const SizedBox(height: kSpacing / 2),
          _HomeIconText(
            iconPath: 'assets/icons/Icon - Clock.png',
            text: data.openingHours,
            maxLines: 3,
            expandText: true,
          ),
        ],
      ),
    );
  }
}
