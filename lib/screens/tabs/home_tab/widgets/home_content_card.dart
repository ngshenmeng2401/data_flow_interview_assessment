import 'package:data_flow_interview_assessment/screens/tabs/home_tab/widgets/home_asset_image.dart';
import 'package:flutter/material.dart';

class HomeContentCard extends StatelessWidget {
  final String imagePath;
  final String imageSemanticLabel;
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

  const HomeContentCard({
    required this.imagePath,
    required this.imageSemanticLabel,
    required this.label,
    required this.body,
    required this.labelStyle,
    required this.bodyStyle,
    required this.contentPadding,
    required this.labelBodySpacing,
    required this.bodyMaxLines,
    this.textScaler,
    this.border,
    this.footer,
    this.footerSpacing = 0,
    this.imageBorderRadius = BorderRadius.zero,
    this.clipBehavior = Clip.antiAlias,
  });

  @override
  Widget build(BuildContext context) {
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
            child: HomeAssetImage(
              path: imagePath,
              aspectRatio: 1,
              fit: BoxFit.contain,
              semanticLabel: imageSemanticLabel,
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
