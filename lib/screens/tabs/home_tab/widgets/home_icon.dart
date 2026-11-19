import 'package:flutter/material.dart';

class HomeIcon extends StatelessWidget {
  final String path;
  final Color? color;

  const HomeIcon({required this.path, this.color});

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      path,
      width: 18,
      height: 18,
      color: color ?? Theme.of(context).colorScheme.primary,
      fit: BoxFit.contain,
      excludeFromSemantics: true,
    );
  }
}
