import 'package:data_flow_interview_assessment/constants/enums.dart';
import 'package:data_flow_interview_assessment/generated/l10n.dart';

class DiscoverArticle {
  final String id;
  final DiscoverFilter category;
  final String title;
  final String body;

  static const String imageAsset = 'assets/images/Image.jpg';

  const DiscoverArticle({
    required this.id,
    required this.category,
    required this.title,
    required this.body,
  });

  static List<DiscoverArticle> collection(Lang lang) => <DiscoverArticle>[
    DiscoverArticle(
      id: 'low-light',
      category: DiscoverFilter.plantCare,
      title: lang.low_light_plants_title,
      body: lang.low_light_plants_article,
    ),
    DiscoverArticle(
      id: 'watering',
      category: DiscoverFilter.plantCare,
      title: lang.watering_plants_title,
      body: lang.watering_plants_article,
    ),
    DiscoverArticle(
      id: 'balcony',
      category: DiscoverFilter.styling,
      title: lang.balcony_styling_title,
      body: lang.balcony_styling_article,
    ),
    DiscoverArticle(
      id: 'shelves',
      category: DiscoverFilter.styling,
      title: lang.styling_plant_shelves_title,
      body: lang.styling_plant_shelves_article,
    ),
  ];
}

String discoverFilterLabel(Lang lang, DiscoverFilter filter) => switch (filter) {
  DiscoverFilter.all => lang.all_title,
  DiscoverFilter.plantCare => lang.plant_care_title,
  DiscoverFilter.styling => lang.styling_title,
};
