part of '../home_tab.dart';

class _HomeIconText extends StatelessWidget {
  final String iconPath;
  final String text;
  final Color? color;
  final int maxLines;
  final bool expandText;

  const _HomeIconText({
    required this.iconPath,
    required this.text,
    this.color,
    this.maxLines = 1,
    this.expandText = false,
  });

  @override
  Widget build(BuildContext context) {
    final Widget label = Text(
      text,
      style: Theme.of(context).textTheme.bodySmall?.copyWith(color: color),
      maxLines: maxLines,
      overflow: TextOverflow.ellipsis,
    );
    return Row(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        _HomeIcon(path: iconPath, color: color),
        const SizedBox(width: kSpacing / 2),
        _label(label),
      ],
    );
  }

  Widget _label(Widget label) {
    if (expandText) {
      return Expanded(child: label);
    }
    return Flexible(child: label);
  }
}
