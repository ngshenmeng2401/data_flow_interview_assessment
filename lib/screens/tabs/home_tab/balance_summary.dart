part of 'home_tab.dart';

class _BalanceSummary extends StatelessWidget {
  final String credit;
  final String points;
  final String packages;

  const _BalanceSummary({
    required this.credit,
    required this.points,
    required this.packages,
  });

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final Lang lang = Lang.of(context);
    final List<String> labels = <String>[
      lang.credit_title, lang.points_title, lang.package_title,
    ];
    final List<String> values = <String>[credit, points, packages];
    return DecoratedBox(
      decoration: BoxDecoration(
        color: theme.colorScheme.surface,
        borderRadius: BorderRadius.circular(kBorderRadius),
        boxShadow: const <BoxShadow>[
          BoxShadow(color: AppThemeConfig.buttonShadow, blurRadius: 5),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: kPadding),
        child: IntrinsicHeight(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              for (int index = 0; index < labels.length; index++) ...<Widget>[
                if (index > 0)
                  VerticalDivider(
                    color: theme.colorScheme.outline,
                    width: 1,
                  ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: kSpacing / 2),
                    child: Column(
                      children: <Widget>[
                        Text(
                          values[index],
                          style: theme.textTheme.titleMedium?.copyWith(
                            color: theme.colorScheme.primary,
                          ),
                          textAlign: TextAlign.center,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                        const SizedBox(height: kSpacing / 2),
                        Text(
                          labels[index],
                          style: theme.textTheme.bodySmall,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}
