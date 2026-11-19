// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class Lang {
  Lang();

  static Lang? _current;

  static Lang get current {
    assert(
      _current != null,
      'No instance of Lang was loaded. Try to initialize the Lang delegate before accessing Lang.current.',
    );
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<Lang> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = Lang();
      Lang._current = instance;

      return instance;
    });
  }

  static Lang of(BuildContext context) {
    final instance = Lang.maybeOf(context);
    assert(
      instance != null,
      'No instance of Lang present in the widget tree. Did you add Lang.delegate in localizationsDelegates?',
    );
    return instance!;
  }

  static Lang? maybeOf(BuildContext context) {
    return Localizations.of<Lang>(context, Lang);
  }

  /// `Data Flows`
  String get app_title {
    return Intl.message('Data Flows', name: 'app_title', desc: '', args: []);
  }

  /// `Home`
  String get home_title {
    return Intl.message('Home', name: 'home_title', desc: '', args: []);
  }

  /// `Mall`
  String get mall_title {
    return Intl.message('Mall', name: 'mall_title', desc: '', args: []);
  }

  /// `Search Salon`
  String get search_salon_title {
    return Intl.message(
      'Search Salon',
      name: 'search_salon_title',
      desc: '',
      args: [],
    );
  }

  /// `Search services`
  String get search_services {
    return Intl.message(
      'Search services',
      name: 'search_services',
      desc: '',
      args: [],
    );
  }

  /// `No services found.`
  String get no_services_found {
    return Intl.message(
      'No services found.',
      name: 'no_services_found',
      desc: '',
      args: [],
    );
  }

  /// `Guest`
  String get guest_title {
    return Intl.message('Guest', name: 'guest_title', desc: '', args: []);
  }

  /// `Discounted products only`
  String get discounted_products_only {
    return Intl.message(
      'Discounted products only',
      name: 'discounted_products_only',
      desc: '',
      args: [],
    );
  }

  /// `No products found.`
  String get no_products_found {
    return Intl.message(
      'No products found.',
      name: 'no_products_found',
      desc: '',
      args: [],
    );
  }

  /// `Discover`
  String get discover_title {
    return Intl.message('Discover', name: 'discover_title', desc: '', args: []);
  }

  /// `Inbox`
  String get inbox_title {
    return Intl.message('Inbox', name: 'inbox_title', desc: '', args: []);
  }

  /// `Account`
  String get account_title {
    return Intl.message('Account', name: 'account_title', desc: '', args: []);
  }

  /// `This feature is not implemented yet.`
  String get feature_not_implemented {
    return Intl.message(
      'This feature is not implemented yet.',
      name: 'feature_not_implemented',
      desc: '',
      args: [],
    );
  }

  /// `Logo`
  String get logo_title {
    return Intl.message('Logo', name: 'logo_title', desc: '', args: []);
  }

  /// `Next Appointment`
  String get next_appointment_title {
    return Intl.message(
      'Next Appointment',
      name: 'next_appointment_title',
      desc: '',
      args: [],
    );
  }

  /// `Credit`
  String get credit_title {
    return Intl.message('Credit', name: 'credit_title', desc: '', args: []);
  }

  /// `Points`
  String get points_title {
    return Intl.message('Points', name: 'points_title', desc: '', args: []);
  }

  /// `Package`
  String get package_title {
    return Intl.message('Package', name: 'package_title', desc: '', args: []);
  }

  /// `SHOP`
  String get shop_title {
    return Intl.message('SHOP', name: 'shop_title', desc: '', args: []);
  }

  /// `SERVICES`
  String get services_title {
    return Intl.message('SERVICES', name: 'services_title', desc: '', args: []);
  }

  /// `POSTS`
  String get posts_title {
    return Intl.message('POSTS', name: 'posts_title', desc: '', args: []);
  }

  /// `Indoor Plants`
  String get indoor_plants_title {
    return Intl.message(
      'Indoor Plants',
      name: 'indoor_plants_title',
      desc: '',
      args: [],
    );
  }

  /// `Outdoor Plants`
  String get outdoor_plants_title {
    return Intl.message(
      'Outdoor Plants',
      name: 'outdoor_plants_title',
      desc: '',
      args: [],
    );
  }

  /// `Succulents`
  String get succulents_title {
    return Intl.message(
      'Succulents',
      name: 'succulents_title',
      desc: '',
      args: [],
    );
  }

  /// `Pots`
  String get pots_title {
    return Intl.message('Pots', name: 'pots_title', desc: '', args: []);
  }

  /// `Plant Care`
  String get plant_care_title {
    return Intl.message(
      'Plant Care',
      name: 'plant_care_title',
      desc: '',
      args: [],
    );
  }

  /// `New Services`
  String get new_services_title {
    return Intl.message(
      'New Services',
      name: 'new_services_title',
      desc: '',
      args: [],
    );
  }

  /// `Recommended based on your preference`
  String get recommended_for_you {
    return Intl.message(
      'Recommended based on your preference',
      name: 'recommended_for_you',
      desc: '',
      args: [],
    );
  }

  /// `View All`
  String get view_all_title {
    return Intl.message('View All', name: 'view_all_title', desc: '', args: []);
  }

  /// `Recommended`
  String get recommended_title {
    return Intl.message(
      'Recommended',
      name: 'recommended_title',
      desc: '',
      args: [],
    );
  }

  /// `Shop Plants`
  String get shop_plants_title {
    return Intl.message(
      'Shop Plants',
      name: 'shop_plants_title',
      desc: '',
      args: [],
    );
  }

  /// `Trending Discoveries`
  String get trending_discoveries_title {
    return Intl.message(
      'Trending Discoveries',
      name: 'trending_discoveries_title',
      desc: '',
      args: [],
    );
  }

  /// `Location`
  String get location_title {
    return Intl.message('Location', name: 'location_title', desc: '', args: []);
  }

  /// `Opening Hours`
  String get opening_hours_title {
    return Intl.message(
      'Opening Hours',
      name: 'opening_hours_title',
      desc: '',
      args: [],
    );
  }

  /// `Unable to open maps. Please try again.`
  String get maps_open_failed {
    return Intl.message(
      'Unable to open maps. Please try again.',
      name: 'maps_open_failed',
      desc: '',
      args: [],
    );
  }

  /// `All`
  String get all_title {
    return Intl.message('All', name: 'all_title', desc: '', args: []);
  }

  /// `Styling`
  String get styling_title {
    return Intl.message('Styling', name: 'styling_title', desc: '', args: []);
  }

  /// `Featured`
  String get featured_title {
    return Intl.message('Featured', name: 'featured_title', desc: '', args: []);
  }

  /// `Low-light plants for apartments`
  String get low_light_plants_title {
    return Intl.message(
      'Low-light plants for apartments',
      name: 'low_light_plants_title',
      desc: '',
      args: [],
    );
  }

  /// `Try a ZZ plant, snake plant, or pothos in a room with a window but little direct sun. Low light still means daylight. If you cannot read comfortably there during the day, move the pot closer to a window.\n\nPlants in dim spots often use water slowly. Check the potting mix before watering, and empty any water that collects in the saucer.`
  String get low_light_plants_article {
    return Intl.message(
      'Try a ZZ plant, snake plant, or pothos in a room with a window but little direct sun. Low light still means daylight. If you cannot read comfortably there during the day, move the pot closer to a window.\n\nPlants in dim spots often use water slowly. Check the potting mix before watering, and empty any water that collects in the saucer.',
      name: 'low_light_plants_article',
      desc: '',
      args: [],
    );
  }

  /// `How to tell when to water`
  String get watering_plants_title {
    return Intl.message(
      'How to tell when to water',
      name: 'watering_plants_title',
      desc: '',
      args: [],
    );
  }

  /// `Start by checking the potting mix with your finger. Many foliage plants are ready for water when the top layer feels dry. Let a succulent dry more thoroughly between waterings.\n\nWater evenly until it drains from the bottom, then empty the saucer. Check more often during hot spells and less often when the plant is growing slowly.`
  String get watering_plants_article {
    return Intl.message(
      'Start by checking the potting mix with your finger. Many foliage plants are ready for water when the top layer feels dry. Let a succulent dry more thoroughly between waterings.\n\nWater evenly until it drains from the bottom, then empty the saucer. Check more often during hot spells and less often when the plant is growing slowly.',
      name: 'watering_plants_article',
      desc: '',
      args: [],
    );
  }

  /// `Style a small balcony with plants`
  String get balcony_styling_title {
    return Intl.message(
      'Style a small balcony with plants',
      name: 'balcony_styling_title',
      desc: '',
      args: [],
    );
  }

  /// `Watch where the sun falls before picking plants. A balcony with hot afternoon sun needs different plants from one shaded all day. Note where wind hits hardest as well.\n\nGroup pots of different heights in one corner and keep the walkway clear. Choose stable containers with drainage, and secure anything you place near the railing.`
  String get balcony_styling_article {
    return Intl.message(
      'Watch where the sun falls before picking plants. A balcony with hot afternoon sun needs different plants from one shaded all day. Note where wind hits hardest as well.\n\nGroup pots of different heights in one corner and keep the walkway clear. Choose stable containers with drainage, and secure anything you place near the railing.',
      name: 'balcony_styling_article',
      desc: '',
      args: [],
    );
  }

  /// `Arrange plants on shelves`
  String get styling_plant_shelves_title {
    return Intl.message(
      'Arrange plants on shelves',
      name: 'styling_plant_shelves_title',
      desc: '',
      args: [],
    );
  }

  /// `Put light-loving plants on the shelf with the brightest indirect light. Let a trailing pothos spill over one end and balance it with an upright plant on the other.\n\nUse saucers or waterproof trays to protect the shelf. Leave enough room to lift out each pot for watering, and keep heavier pots lower down.`
  String get styling_plant_shelves_article {
    return Intl.message(
      'Put light-loving plants on the shelf with the brightest indirect light. Let a trailing pothos spill over one end and balance it with an upright plant on the other.\n\nUse saucers or waterproof trays to protect the shelf. Leave enough room to lift out each pot for watering, and keep heavier pots lower down.',
      name: 'styling_plant_shelves_article',
      desc: '',
      args: [],
    );
  }

  /// `Recent`
  String get recent_title {
    return Intl.message('Recent', name: 'recent_title', desc: '', args: []);
  }

  /// `History`
  String get history_title {
    return Intl.message('History', name: 'history_title', desc: '', args: []);
  }

  /// `Explore plant care and styling`
  String get inbox_discover_title {
    return Intl.message(
      'Explore plant care and styling',
      name: 'inbox_discover_title',
      desc: '',
      args: [],
    );
  }

  /// `Find articles on watering, light, balconies, and shelves.`
  String get inbox_discover_preview {
    return Intl.message(
      'Find articles on watering, light, balconies, and shelves.',
      name: 'inbox_discover_preview',
      desc: '',
      args: [],
    );
  }

  /// `Open Discover and choose Plant Care for tips on watering and light, or Styling for balcony and shelf ideas. Tap any article to read it in full.`
  String get inbox_discover_message {
    return Intl.message(
      'Open Discover and choose Plant Care for tips on watering and light, or Styling for balcony and shelf ideas. Tap any article to read it in full.',
      name: 'inbox_discover_message',
      desc: '',
      args: [],
    );
  }

  /// `Browse plants and services in Mall`
  String get inbox_mall_title {
    return Intl.message(
      'Browse plants and services in Mall',
      name: 'inbox_mall_title',
      desc: '',
      args: [],
    );
  }

  /// `Explore the Mall and check Home for recommended services.`
  String get inbox_mall_preview {
    return Intl.message(
      'Explore the Mall and check Home for recommended services.',
      name: 'inbox_mall_preview',
      desc: '',
      args: [],
    );
  }

  /// `Open Mall to search and filter the product list. For service suggestions, go to Home and scroll to New Services.`
  String get inbox_mall_message {
    return Intl.message(
      'Open Mall to search and filter the product list. For service suggestions, go to Home and scroll to New Services.',
      name: 'inbox_mall_message',
      desc: '',
      args: [],
    );
  }

  /// `Find our branches and directions`
  String get inbox_branches_title {
    return Intl.message(
      'Find our branches and directions',
      name: 'inbox_branches_title',
      desc: '',
      args: [],
    );
  }

  /// `Branch details are in the Location section on Home.`
  String get inbox_branches_preview {
    return Intl.message(
      'Branch details are in the Location section on Home.',
      name: 'inbox_branches_preview',
      desc: '',
      args: [],
    );
  }

  /// `On Home, scroll to Location to find the Sunway Pyramid and The Gardens Mall branches. Tap a branch address to open it in your maps app.`
  String get inbox_branches_message {
    return Intl.message(
      'On Home, scroll to Location to find the Sunway Pyramid and The Gardens Mall branches. Tap a branch address to open it in your maps app.',
      name: 'inbox_branches_message',
      desc: '',
      args: [],
    );
  }

  /// `General`
  String get general_title {
    return Intl.message('General', name: 'general_title', desc: '', args: []);
  }

  /// `Language`
  String get language_title {
    return Intl.message('Language', name: 'language_title', desc: '', args: []);
  }

  /// `Help Centre`
  String get help_centre_title {
    return Intl.message(
      'Help Centre',
      name: 'help_centre_title',
      desc: '',
      args: [],
    );
  }

  /// `Privacy Policy`
  String get privacy_policy_title {
    return Intl.message(
      'Privacy Policy',
      name: 'privacy_policy_title',
      desc: '',
      args: [],
    );
  }

  /// `Terms of Service`
  String get terms_of_service_title {
    return Intl.message(
      'Terms of Service',
      name: 'terms_of_service_title',
      desc: '',
      args: [],
    );
  }

  /// `This article is unavailable.`
  String get article_unavailable {
    return Intl.message(
      'This article is unavailable.',
      name: 'article_unavailable',
      desc: '',
      args: [],
    );
  }

  /// `This notice is unavailable.`
  String get notice_unavailable {
    return Intl.message(
      'This notice is unavailable.',
      name: 'notice_unavailable',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<Lang> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en', countryCode: 'US'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<Lang> load(Locale locale) => Lang.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
