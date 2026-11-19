part of 'home_tab.dart';

// TODO dummy data / flow
// Replace this local sample content with approved Home data when available.
// TODO translate
// Translate sample payload text when its production data contract is defined.
class _HomeSampleData {
  static final _HomeAppointmentData appointment = _HomeAppointmentData(
    date: DateTime(2020, 10, 14, 12, 30),
    address: '123 Plant Street, 1/1',
  );
  static const double credit = 100.0;
  static const int points = 10;
  static const int packages = 1;
  static const List<_HomeServiceData> services = <_HomeServiceData>[
    _HomeServiceData(label: 'Lorem Ipsum', title: 'Lorem ipsum dolor sit amet consectetur', price: 10),
    _HomeServiceData(label: 'Lorem Ipsum', title: 'Lorem ipsum dolor sit amet consectetur', price: 10),
    _HomeServiceData(label: 'Lorem Ipsum', title: 'Lorem ipsum dolor sit amet consectetur', price: 10),
  ];
  static const List<_HomeDiscoveryData> discoveries = <_HomeDiscoveryData>[
    _HomeDiscoveryData(label: 'Lorem Ipsum', body: 'Lorem ipsum dolor sit amet consectetur adipiscing elit'),
    _HomeDiscoveryData(label: 'Lorem Ipsum', body: 'Lorem ipsum dolor sit amet consectetur adipiscing elit. Lorem ipsum dolor sit amet'),
    _HomeDiscoveryData(label: 'Lorem Ipsum', body: 'Lorem ipsum dolor sit amet consectetur adipiscing elit'),
    _HomeDiscoveryData(label: 'Lorem Ipsum', body: 'Lorem ipsum dolor sit amet consectetur adipiscing elit. Lorem ipsum dolor sit amet'),
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
  final String label;
  final String title;
  final double price;

  const _HomeServiceData({required this.label, required this.title, required this.price});
}

class _HomeDiscoveryData {
  final String label;
  final String body;

  const _HomeDiscoveryData({required this.label, required this.body});
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
