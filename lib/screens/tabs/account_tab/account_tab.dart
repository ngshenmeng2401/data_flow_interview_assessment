import 'package:data_flow_interview_assessment/constants/dimensions.dart';
import 'package:data_flow_interview_assessment/generated/l10n.dart';
import 'package:data_flow_interview_assessment/widgets/account_profile_header.dart';
import 'package:flutter/material.dart';

class AccountTab extends StatelessWidget {
  const AccountTab({super.key});

  @override
  Widget build(BuildContext context) {
    final Lang lang = Lang.of(context);
    final ThemeData theme = Theme.of(context);
    final List<(IconData, String)> actions = <(IconData, String)>[
      (Icons.language, lang.language_title),
      (Icons.help_outline, lang.help_centre_title),
      (Icons.privacy_tip_outlined, lang.privacy_policy_title),
      (Icons.description_outlined, lang.terms_of_service_title),
    ];

    return ListView(
      physics: const ClampingScrollPhysics(),
      padding: const EdgeInsets.fromLTRB(kPadding, kPadding, kPadding, kPadding * 2),
      children: <Widget>[
        Text(lang.account_title, style: theme.textTheme.headlineSmall?.copyWith(
          color: theme.colorScheme.primary,
        )),
        const SizedBox(height: kPadding),
        const AccountProfileHeader(),
        const SizedBox(height: kPadding),
        Text(lang.general_title, style: theme.textTheme.titleMedium),
        const SizedBox(height: kSpacing),
        Card(
          margin: EdgeInsets.zero,
          color: theme.colorScheme.surface,
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(kBorderRadius),
            side: BorderSide(color: theme.colorScheme.outlineVariant),
          ),
          child: Column(
            children: <Widget>[
              for (final (int index, (IconData icon, String label)) in actions.indexed) ...<Widget>[
                if (index > 0)
                  Divider(
                    height: 1,
                    indent: kPadding,
                    endIndent: kPadding,
                    color: theme.colorScheme.outlineVariant,
                  ),
                ListTile(
                  enabled: false,
                  leading: Icon(icon),
                  title: Text(label, maxLines: 1, overflow: TextOverflow.ellipsis),
                  trailing: const Icon(Icons.chevron_right),
                ),
              ],
            ],
          ),
        ),
      ],
    );
  }
}
