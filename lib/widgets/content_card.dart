import 'package:flutter/material.dart';

class ContentCard extends StatelessWidget {
  final Widget image;
  final Widget? imageOverlay;
  final String label;
  final String body;
  final TextStyle? labelStyle;
  final TextStyle? bodyStyle;
  final EdgeInsets contentPadding;
  final double labelBodySpacing;
  final int bodyMaxLines;
  final TextScaler? textScaler;
  final BoxBorder? border;
  final Widget? footer;
  final double footerSpacing;
  final BorderRadius imageBorderRadius;
  final Clip clipBehavior;

  const ContentCard({
    required this.image,
    required this.label,
    required this.body,
    required this.labelStyle,
    required this.bodyStyle,
    required this.contentPadding,
    required this.labelBodySpacing,
    required this.bodyMaxLines,
    this.imageOverlay,
    this.textScaler,
    this.border,
    this.footer,
    this.footerSpacing = 0,
    this.imageBorderRadius = BorderRadius.zero,
    this.clipBehavior = Clip.antiAlias,
  });

  @override
  Widget build(BuildContext context) {
    final Widget? overlay = imageOverlay;
    return Container(
      clipBehavior: clipBehavior,
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
        border: border,
        borderRadius: BorderRadius.circular(4),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          ClipRRect(
            borderRadius: imageBorderRadius,
            child: overlay == null
                ? image
                : Stack(
                    children: <Widget>[
                      image,
                      Positioned(top: 0, right: 0, child: overlay),
                    ],
                  ),
          ),
          Padding(
            padding: contentPadding,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  label,
                  style: labelStyle,
                  textScaler: textScaler,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                SizedBox(height: labelBodySpacing),
                Text(
                  body,
                  style: bodyStyle,
                  textScaler: textScaler,
                  maxLines: bodyMaxLines,
                  overflow: TextOverflow.ellipsis,
                ),
                if (footer != null) ...<Widget>[
                  SizedBox(height: footerSpacing),
                  footer!,
                ],
              ],
            ),
          ),
        ],
      ),
    );
  }
}
