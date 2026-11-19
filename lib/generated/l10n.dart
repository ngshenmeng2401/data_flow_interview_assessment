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
