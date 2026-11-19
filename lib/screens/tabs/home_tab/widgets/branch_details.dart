part of '../home_tab.dart';

class _BranchDetails extends StatelessWidget {
  final _HomeBranchData data;
  final VoidCallback onAddressTap;

  const _BranchDetails({required this.data, required this.onAddressTap});

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
            style: theme.textTheme.titleSmall?.copyWith(
              color: theme.colorScheme.primary,
              fontSize: 13,
              fontWeight: FontWeight.w700,
            ),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          InkWell(
            onTap: onAddressTap,
            child: ConstrainedBox(
              constraints: const BoxConstraints(minHeight: 48),
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: kSpacing / 2),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(left: 4, top: 2),
                      child: Image.asset(
                        'assets/icons/Icon - Location.png',
                        width: 13,
                        height: 13,
                        color: theme.colorScheme.primary,
                        fit: BoxFit.contain,
                        excludeFromSemantics: true,
                      ),
                    ),
                    const SizedBox(width: kSpacing),
                    Expanded(
                      child: Text(
                        data.address,
                        style: theme.textTheme.bodySmall?.copyWith(
                          color: context.appThemeColors.blueTextAccent,
                          fontSize: 13,
                          height: 1.35,
                          decoration: TextDecoration.underline,
                          decorationColor: context.appThemeColors.blueTextAccent,
                        ),
                        maxLines: 4,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(left: 4, top: 2),
                child: Image.asset(
                  'assets/icons/Icon - Clock.png',
                  width: 13,
                  height: 13,
                  color: theme.colorScheme.primary,
                  fit: BoxFit.contain,
                  excludeFromSemantics: true,
                ),
              ),
              const SizedBox(width: kSpacing),
              Expanded(
                child: Text(
                  data.openingHours,
                  style: theme.textTheme.bodySmall?.copyWith(
                    fontSize: 13,
                    height: 1.35,
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
