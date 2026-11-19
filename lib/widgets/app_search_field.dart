import 'package:data_flow_interview_assessment/constants/dimensions.dart';
import 'package:flutter/material.dart';

class AppSearchField extends StatelessWidget {
  final String hintText;
  final ValueChanged<String> onChanged;
  final Widget? trailing;

  const AppSearchField({
    super.key,
    required this.hintText,
    required this.onChanged,
    this.trailing,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Theme.of(context).colorScheme.surface,
      elevation: 2,
      shape: const StadiumBorder(),
      child: TextField(
        onChanged: onChanged,
        textInputAction: TextInputAction.search,
        decoration: InputDecoration(
          hintText: hintText,
          border: InputBorder.none,
          enabledBorder: InputBorder.none,
          focusedBorder: InputBorder.none,
          filled: false,
          contentPadding: const EdgeInsets.symmetric(vertical: kSpacing),
          prefixIcon: Center(
            widthFactor: 1,
            child: Image.asset(
              'assets/icons/Icon - Search.png',
              width: 20,
              excludeFromSemantics: true,
            ),
          ),
          suffixIcon: trailing,
        ),
      ),
    );
  }
}
