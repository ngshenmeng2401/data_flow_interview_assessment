import 'package:data_flow_interview_assessment/constants/dimensions.dart';
import 'package:data_flow_interview_assessment/generated/l10n.dart';
import 'package:data_flow_interview_assessment/screens/tabs/home_tab/home_tab_data.dart';
import 'package:data_flow_interview_assessment/widgets/balance_summary.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class HomeHeader extends StatelessWidget {
  final HomeAppointmentData data;

  const HomeHeader({
    required this.data,
  });

  void _showAppointmentDetails(BuildContext context) {
    showModalBottomSheet<void>(
      context: context,
      builder: (BuildContext context) {
        final String locale = Localizations.localeOf(context).toString();
        return SafeArea(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(kPadding),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Text(
                  Lang.of(context).next_appointment_title,
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                ListTile(
                  leading: const Icon(Icons.calendar_today),
                  title: Text(DateFormat.yMMMMd(locale).format(data.date)),
                ),
                ListTile(
                  leading: const Icon(Icons.access_time),
                  title: Text(DateFormat.jm(locale).format(data.date)),
                ),
                ListTile(
                  leading: const Icon(Icons.location_on_outlined),
                  title: Text(data.address),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

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
                  child: IconButton(
                    tooltip: lang.next_appointment_title,
                    onPressed: () => _showAppointmentDetails(context),
                    icon: DecoratedBox(
                      decoration: BoxDecoration(
                        color: theme.colorScheme.secondary,
                        shape: BoxShape.circle,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(4),
                        child: Icon(
                          Icons.chevron_right,
                          size: 14,
                          color: detailColor,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            BalanceSummary.sample(context),
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
