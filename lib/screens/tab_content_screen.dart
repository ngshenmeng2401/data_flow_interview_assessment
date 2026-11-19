import 'package:data_flow_interview_assessment/constants/dimensions.dart';
import 'package:flutter/material.dart';

class TabContentScreen extends StatelessWidget {
  final String sectionTitle;
  final String title;
  final String body;
  final Widget? heroImage;

  const TabContentScreen({
    super.key,
    required this.sectionTitle,
    required this.title,
    required this.body,
    this.heroImage,
  });

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(title: Text(sectionTitle, maxLines: 1, overflow: TextOverflow.ellipsis)),
      body: SafeArea(
        top: false,
        child: ListView(
          physics: const ClampingScrollPhysics(),
          padding: const EdgeInsets.fromLTRB(kPadding, kPadding, kPadding, kPadding * 2),
          children: <Widget>[
            if (heroImage case final Widget image)
              Padding(padding: const EdgeInsets.only(bottom: kPadding), child: image),
            Text(title, style: theme.textTheme.headlineSmall?.copyWith(
              color: theme.colorScheme.primary,
            )),
            const SizedBox(height: kSpacing),
            Text(body, style: theme.textTheme.bodyLarge),
          ],
        ),
      ),
    );
  }
}
