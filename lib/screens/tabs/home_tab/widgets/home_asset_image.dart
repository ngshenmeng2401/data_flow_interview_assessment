part of '../home_tab.dart';

class _HomeAssetImage extends StatelessWidget {
  final String path;
  final double aspectRatio;
  final BoxFit fit;
  final String? semanticLabel;

  const _HomeAssetImage({
    required this.path,
    this.aspectRatio = 1,
    this.fit = BoxFit.contain,
    this.semanticLabel,
  });

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: aspectRatio,
      child: Image.asset(
        path,
        fit: fit,
        semanticLabel: semanticLabel,
        excludeFromSemantics: semanticLabel == null,
        errorBuilder: (
          BuildContext context,
          Object error,
          StackTrace? stackTrace,
        ) {
          return Image.asset(
            'assets/images/img_placeholder.png',
            fit: BoxFit.contain,
            semanticLabel: semanticLabel,
            excludeFromSemantics: semanticLabel == null,
          );
        },
      ),
    );
  }
}
