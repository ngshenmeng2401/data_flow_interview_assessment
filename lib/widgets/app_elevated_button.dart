import 'package:data_flow_interview_assessment/constants/dimensions.dart';
import 'package:data_flow_interview_assessment/utils/app_theme_config.dart';
import 'package:flutter/material.dart';

class AppElevatedButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final Widget child;
  final Color? backgroundColor;
  final double borderRadius;
  final EdgeInsetsGeometry? padding;
  final BorderSide side;
  final Color? shadowColor;
  final double shadowBlurRadius;
  final Offset shadowOffset;

  const AppElevatedButton({
    this.onPressed,
    required this.child,
    this.backgroundColor,
    this.borderRadius = kActionButtonBorderRadius,
    this.padding,
    this.side = BorderSide.none,
    this.shadowColor,
    this.shadowBlurRadius = 5,
    this.shadowOffset = Offset.zero,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final ColorScheme colorScheme = Theme.of(context).colorScheme;
    return DecoratedBox(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(borderRadius),
        boxShadow: <BoxShadow>[
          if (onPressed != null)
            BoxShadow(
              color: shadowColor ?? AppThemeConfig.buttonShadow,
              blurRadius: shadowBlurRadius,
              offset: shadowOffset,
            ),
        ],
      ),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRadius),
            side: side,
          ),
          backgroundColor: backgroundColor ?? colorScheme.secondary,
          foregroundColor: colorScheme.onSecondary,
          padding: padding,
        ),
        onPressed: onPressed,
        child: child,
      ),
    );
  }
}