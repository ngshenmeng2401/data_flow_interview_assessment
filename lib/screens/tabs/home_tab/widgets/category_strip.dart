import 'package:data_flow_interview_assessment/constants/dimensions.dart';
import 'package:data_flow_interview_assessment/constants/enums.dart';
import 'package:data_flow_interview_assessment/screens/tabs/home_tab/home_tab_data.dart';
import 'package:flutter/material.dart';

class CategoryStrip extends StatelessWidget {
  final List<HomeCategoryData> categories;

  final ValueChanged<PlantCategory> onCategoryPressed;

  const CategoryStrip({required this.categories, required this.onCategoryPressed});

  @override
  Widget build(BuildContext context) {
    // TODO dummy data / flow
    // Enable category navigation once its destinations are defined.
    return SingleChildScrollView(
      key: const PageStorageKey<String>('home_categories_scroll'),
      scrollDirection: Axis.horizontal,
      physics: const BouncingScrollPhysics(),
      padding: const EdgeInsets.symmetric(horizontal: kPadding),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          for (int index = 0; index < categories.length; index++) ...<Widget>[
            if (index > 0) const SizedBox(width: kSpacing),
            SizedBox(
              width: 80,
              child: IconButton(
                tooltip: categories[index].label,
                onPressed: () => onCategoryPressed(categories[index].category),
                padding: EdgeInsets.zero,
                icon: ClipOval(
                  child: Image.asset(
                    'assets/icons/Button - Icon ${categories[index].assetIndex}.png',
                    width: 64,
                    height: 64,
                    fit: BoxFit.contain,
                    excludeFromSemantics: true,
                  ),
                ),
              ),
            ),
          ],
        ],
      ),
    );
  }
}
