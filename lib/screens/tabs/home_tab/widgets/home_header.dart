part of '../home_tab.dart';

class _HomeHeader extends StatelessWidget {
  final _HomeAppointmentData data;

  const _HomeHeader({required this.data});

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final Lang lang = Lang.of(context);
    final String locale = Localizations.localeOf(context).toString();
    return ColoredBox(
      color: theme.colorScheme.primary,
      child: Padding(
        padding: const EdgeInsets.all(kPadding),
        child: DefaultTextStyle.merge(
          style: TextStyle(color: theme.colorScheme.onPrimary),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              // TODO need user revisit / complete
              // Replace the localized Logo text with the real logo artwork.
              Text(
                lang.logo_title,
                style: theme.textTheme.headlineLarge?.copyWith(
                  color: theme.colorScheme.onPrimary,
                ),
                textAlign: TextAlign.center,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              const SizedBox(height: kSpacing * 2),
              Text(
                lang.next_appointment_title,
                style: theme.textTheme.titleSmall?.copyWith(
                  color: theme.colorScheme.onPrimary,
                ),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              const SizedBox(height: kSpacing),
              Wrap(
                spacing: kSpacing * 2,
                runSpacing: kSpacing,
                children: <Widget>[
                  _HomeIconText(
                    iconPath: 'assets/icons/Icon - Calender.png',
                    text: DateFormat.yMMMd(locale).format(data.date),
                    color: theme.colorScheme.onPrimary,
                  ),
                  _HomeIconText(
                    iconPath: 'assets/icons/Icon - Clock.png',
                    text: DateFormat.jm(locale).format(data.date),
                    color: theme.colorScheme.onPrimary,
                  ),
                ],
              ),
              const SizedBox(height: kSpacing),
              Row(
                children: <Widget>[
                  Expanded(
                    child: _HomeIconText(
                      iconPath: 'assets/icons/Icon - Location.png',
                      text: data.address,
                      color: theme.colorScheme.onPrimary,
                      maxLines: 3,
                      expandText: true,
                    ),
                  ),
                  // TODO dummy data / flow
                  // Enable appointment details when its destination is defined.
                  SizedBox(
                    width: 48,
                    height: 48,
                    child: Center(
                      child: _HomeIcon(
                        path: 'assets/icons/Icon - Arrow.png',
                        color: theme.colorScheme.onPrimary,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
