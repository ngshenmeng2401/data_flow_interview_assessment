part of '../home_tab.dart';

class _HomeHeader extends StatelessWidget {
  final _HomeAppointmentData data;
  final String credit;
  final String points;
  final String packages;

  const _HomeHeader({
    required this.data,
    required this.credit,
    required this.points,
    required this.packages,
  });

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final Lang lang = Lang.of(context);
    final String locale = Localizations.localeOf(context).toString();
    final Color detailColor = Color.lerp(
      theme.colorScheme.primary,
      theme.colorScheme.onPrimary,
      0.65,
    )!;
    return ColoredBox(
      color: theme.colorScheme.primary,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(kPadding, kPadding, kPadding, 18),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            // TODO need user revisit / complete
            // Replace the localized Logo text with the real logo artwork.
            Text(
              lang.logo_title.toUpperCase(),
              style: theme.textTheme.headlineLarge?.copyWith(
                color: theme.colorScheme.onPrimary,
                fontSize: 40,
                height: 1,
                fontWeight: FontWeight.w500,
              ),
              textAlign: TextAlign.center,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            const SizedBox(height: 4),
            Row(
              children: <Widget>[
                Expanded(child: Divider(color: detailColor, thickness: 0.5, height: 8)),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: kSpacing),
                  child: Text(
                    lang.next_appointment_title.toUpperCase(),
                    style: theme.textTheme.labelSmall?.copyWith(
                      color: detailColor,
                      fontSize: 7,
                      height: 8 / 7,
                      fontWeight: FontWeight.w700,
                      letterSpacing: 1.5,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                Expanded(child: Divider(color: detailColor, thickness: 0.5, height: 8)),
              ],
            ),
            Row(
              children: <Widget>[
                Flexible(
                  flex: 5,
                  child: _HomeAppointmentDetail(
                    iconPath: 'assets/icons/Icon - Calender.png',
                    text: DateFormat('dd MMM yyyy', locale).format(data.date),
                    color: detailColor,
                  ),
                ),
                const SizedBox(width: kSpacing / 2),
                Flexible(
                  flex: 4,
                  child: _HomeAppointmentDetail(
                    iconPath: 'assets/icons/Icon - Clock.png',
                    text: DateFormat.jm(locale).format(data.date),
                    color: detailColor,
                  ),
                ),
                const SizedBox(width: kSpacing / 2),
                Expanded(
                  flex: 7,
                  child: _HomeAppointmentDetail(
                    iconPath: 'assets/icons/Icon - Location.png',
                    text: data.address,
                    color: detailColor,
                  ),
                ),
                // TODO dummy data / flow
                // Enable appointment details when its destination is defined.
                SizedBox(
                  width: 48,
                  height: 48,
                  child: Center(
                    child: DecoratedBox(
                      decoration: BoxDecoration(
                        color: theme.colorScheme.secondary,
                        shape: BoxShape.circle,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(4),
                        child: Image.asset(
                          'assets/icons/Icon - Arrow.png',
                          width: 14,
                          height: 14,
                          color: detailColor,
                          fit: BoxFit.contain,
                          excludeFromSemantics: true,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            _BalanceSummary(credit: credit, points: points, packages: packages),
          ],
        ),
      ),
    );
  }
}

class _HomeAppointmentDetail extends StatelessWidget {
  final String iconPath;
  final String text;
  final Color color;

  const _HomeAppointmentDetail({
    required this.iconPath,
    required this.text,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Image.asset(
          iconPath,
          width: 12,
          height: 12,
          color: Theme.of(context).colorScheme.secondary,
          fit: BoxFit.contain,
          excludeFromSemantics: true,
        ),
        const SizedBox(width: 3),
        Flexible(
          child: Text(
            text,
            style: Theme.of(context).textTheme.bodySmall?.copyWith(
              color: color,
              fontSize: 11,
              height: 1.2,
            ),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ],
    );
  }
}

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
        borderRadius: BorderRadius.circular(kCircularButtonBorderRadius),
      ),
      child: IntrinsicHeight(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            for (int index = 0; index < labels.length; index++) ...<Widget>[
              if (index > 0)
                VerticalDivider(
                  color: theme.colorScheme.outline.withValues(alpha: 0.3),
                  width: 1,
                  thickness: 1,
                ),
              Expanded(
                child: ConstrainedBox(
                  constraints: const BoxConstraints(minHeight: 40),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: kSpacing / 2,
                      vertical: 6,
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          labels[index].toUpperCase(),
                          style: theme.textTheme.labelSmall?.copyWith(
                            color: theme.colorScheme.secondary,
                            fontSize: 9,
                            height: 1.2,
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                        Text(
                          values[index],
                          style: theme.textTheme.titleMedium?.copyWith(
                            color: theme.colorScheme.primary,
                            fontSize: 12,
                            height: 1.2,
                            fontWeight: FontWeight.w700,
                          ),
                          textAlign: TextAlign.center,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}
