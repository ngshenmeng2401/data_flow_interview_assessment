import 'package:data_flow_interview_assessment/constants/dimensions.dart';
import 'package:data_flow_interview_assessment/generated/l10n.dart';
import 'package:flutter/material.dart';

class HomeSectionHeading extends StatelessWidget {
  final String title;
  final String? subtitle;
  final bool showViewAll;
  final bool serviceStyle;
  final VoidCallback? onViewAllPressed;

  const HomeSectionHeading({
    super.key,
    required this.title,
    this.subtitle,
    this.showViewAll = false,
    this.serviceStyle = false,
    this.onViewAllPressed,
  });

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    return Padding(
      padding: serviceStyle ? const EdgeInsets.fromLTRB(kPadding * 1.5, kSpacing * 2, 0, kSpacing / 2) : const EdgeInsets.fromLTRB(
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
                  serviceStyle ? title.toUpperCase() : title,
                  style: serviceStyle ? theme.textTheme.titleSmall?.copyWith(
                    color: theme.colorScheme.onSurface,
                    fontSize: 14,
                    fontWeight: FontWeight.w700,
                  ) : theme.textTheme.titleLarge?.copyWith(
                    color: theme.colorScheme.primary,
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                if (subtitle != null)
                  Padding(
                    padding: EdgeInsets.only(top: serviceStyle ? 0 : kSpacing / 2),
                    child: Text(
                      subtitle!,
                      style: serviceStyle ? theme.textTheme.bodySmall?.copyWith(fontSize: 11) : theme.textTheme.bodySmall,
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
              ],
            ),
          ),
          if (showViewAll)
            Padding(
              padding: EdgeInsetsDirectional.only(
                start: kSpacing,
                end: serviceStyle ? kSpacing : 0,
              ),
              // TODO dummy data / flow
              // Enable View All when its destination is defined.
              child: TextButton(
                onPressed: onViewAllPressed,
                style: TextButton.styleFrom(
                  minimumSize: const Size(48, 48),
                  padding: serviceStyle ? const EdgeInsets.symmetric(horizontal: kSpacing / 2, vertical: 2) : null,
                  alignment: serviceStyle ? Alignment.topCenter : null,
                  disabledForegroundColor: serviceStyle ? theme.colorScheme.onSurfaceVariant : null,
                  textStyle: serviceStyle ? theme.textTheme.bodySmall?.copyWith(fontSize: 10) : null,
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
