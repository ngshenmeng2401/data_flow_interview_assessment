import 'package:data_flow_interview_assessment/constants/dimensions.dart';
import 'package:data_flow_interview_assessment/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class BalanceSummary extends StatelessWidget {
  final String credit;
  final String points;
  final String packages;

  const BalanceSummary({
    super.key,
    required this.credit,
    required this.points,
    required this.packages,
  });

  // TODO dummy data / flow
  factory BalanceSummary.sample(BuildContext context) {
    final String locale = Localizations.localeOf(context).toString();
    final NumberFormat currencyFormat = NumberFormat.currency(
      locale: locale,
      symbol: 'RM',
      decimalDigits: 2,
    );
    final NumberFormat countFormat = NumberFormat.decimalPattern(locale);
    return BalanceSummary(
      credit: currencyFormat.format(100.0),
      points: countFormat.format(10),
      packages: countFormat.format(1),
    );
  }

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final Lang lang = Lang.of(context);
    final List<String> labels = <String>[
      lang.credit_title,
      lang.points_title,
      lang.package_title,
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
