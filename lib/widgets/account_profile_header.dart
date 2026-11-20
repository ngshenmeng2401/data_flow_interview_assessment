import 'package:data_flow_interview_assessment/constants/dimensions.dart';
import 'package:flutter/material.dart';

class AccountProfileHeader extends StatelessWidget {
  final String? displayName;
  final String? email;

  const AccountProfileHeader({super.key, this.displayName, this.email});

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final String name = displayName?.trim() ?? '';
    final String emailAddress = email?.trim() ?? '';

    final ColorScheme colors = theme.colorScheme;
    return DecoratedBox(
      decoration: BoxDecoration(
        color: colors.primary,
        borderRadius: BorderRadius.circular(kBorderRadius),
      ),
      child: Padding(
        padding: const EdgeInsets.all(kPadding),
        child: Column(
          children: <Widget>[
            DecoratedBox(
              decoration: BoxDecoration(
                color: colors.surface,
                shape: BoxShape.circle,
                border: Border.all(color: colors.primary.withValues(alpha: 0.35)),
              ),
              child: Padding(
                padding: const EdgeInsets.all(kSpacing / 3),
                child: CircleAvatar(
                  radius: kPadding * 2,
                  backgroundColor: colors.surfaceContainerHighest,
                  backgroundImage: const AssetImage('assets/icons/ic_avatar.png'),
                ),
              ),
            ),
            const SizedBox(height: kSpacing),
            Text(
              // TODO translate
              name.isEmpty ? 'Guest' : name,
              style: theme.textTheme.titleMedium?.copyWith(color: colors.onPrimary),
              textAlign: TextAlign.center,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            if (emailAddress.isNotEmpty)
              Text(
                emailAddress,
                style: theme.textTheme.bodyMedium?.copyWith(color: colors.onPrimary),
                textAlign: TextAlign.center,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
          ],
        ),
      ),
    );
  }
}
