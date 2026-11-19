part of 'home_tab.dart';

// TODO dummy data / flow
// Replace this local sample content with approved Home data when available.
// TODO translate
// Translate sample payload text when its production data contract is defined.
class _HomeSampleData {
  static final _HomeAppointmentData appointment = _HomeAppointmentData(
    date: DateTime(2026, 12, 5, 10, 30),
    address: 'Sample Garden Studio, Kuala Lumpur',
  );
  static const double credit = 150.0;
  static const int points = 1200;
  static const int packages = 3;
  static const List<_HomeServiceData> services = <_HomeServiceData>[
    _HomeServiceData(title: 'Plant styling consultation', price: 80),
    _HomeServiceData(title: 'Repotting and plant care', price: 45),
    _HomeServiceData(title: 'Home garden consultation', price: 120),
  ];
  static const List<_HomeDiscoveryData> discoveries = <_HomeDiscoveryData>[
    _HomeDiscoveryData(
      title: 'A little green for your favourite corner',
      description: 'Discover simple ways to bring plants into your space.',
      aspectRatio: 0.8,
    ),
    _HomeDiscoveryData(
      title: 'Find your next indoor plant',
      description: 'A small addition that makes a room feel alive.',
      aspectRatio: 1.2,
    ),
    _HomeDiscoveryData(
      title: 'Make room for growing things',
      description: 'Explore everyday inspiration for your home garden.',
      aspectRatio: 1.1,
    ),
    _HomeDiscoveryData(
      title: 'Care for your plants, one day at a time',
      description: 'Give your favourite greenery a little extra attention.',
      aspectRatio: 0.85,
    ),
  ];
  static const List<_HomeBranchData> branches = <_HomeBranchData>[
    _HomeBranchData(
      name: 'Sample Garden Studio',
      address: '12, Jalan Kebun, 50000 Kuala Lumpur, Malaysia',
      openingHours: 'Monday - Sunday, 10:00 AM - 7:00 PM',
    ),
    _HomeBranchData(
      name: 'Sample Plant Corner',
      address: '8, Jalan Taman, 46000 Petaling Jaya, Selangor, Malaysia',
      openingHours: 'Tuesday - Sunday, 10:00 AM - 6:00 PM',
    ),
  ];
}

class _HomeAppointmentData {
  final DateTime date;
  final String address;

  const _HomeAppointmentData({required this.date, required this.address});
}

class _HomeCategoryData {
  final String label;
  final int assetIndex;

  const _HomeCategoryData({required this.label, required this.assetIndex});
}

class _HomeServiceData {
  final String title;
  final double price;

  const _HomeServiceData({required this.title, required this.price});
}

class _HomeDiscoveryData {
  final String title;
  final String description;
  final double aspectRatio;

  const _HomeDiscoveryData({
    required this.title,
    required this.description,
    required this.aspectRatio,
  });
}

class _HomeBranchData {
  final String name;
  final String address;
  final String openingHours;

  const _HomeBranchData({
    required this.name,
    required this.address,
    required this.openingHours,
  });
}
