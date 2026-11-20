import 'package:data_flow_interview_assessment/constants/enums.dart';

// TODO dummy data / flow
// Replace this local sample content with approved Home data when available.
// TODO translate
// Translate sample payload text when its production data contract is defined.
class HomeSampleData {
  static final HomeAppointmentData appointment = HomeAppointmentData(
    date: DateTime(2020, 10, 14, 12, 30),
    address: '123 Plant Street, 1/1',
  );
  static const List<HomeServiceData> services = <HomeServiceData>[
    HomeServiceData(label: 'Lorem Ipsum', title: 'Lorem ipsum dolor sit amet consectetur', price: 10),
    HomeServiceData(label: 'Lorem Ipsum', title: 'Lorem ipsum dolor sit amet consectetur', price: 10),
    HomeServiceData(label: 'Lorem Ipsum', title: 'Lorem ipsum dolor sit amet consectetur', price: 10),
  ];
  static const List<HomeBranchData> branches = <HomeBranchData>[
    HomeBranchData(
      name: 'Sunway Pyramid',
      latitude: 3.07251,
      longitude: 101.60708,
      address: '10 Floor, Lorem Ipsum Mall,\nJalan ss23 Lorem, Selangor, Malaysia',
      openingHours: '10am - 10pm',
    ),
    HomeBranchData(
      name: 'The Gardens Mall',
      latitude: 3.11854,
      longitude: 101.67602,
      address: '10 Floor, Lorem Ipsum Mall,\nJalan ss23 Lorem, Selangor, Malaysia',
      openingHours: '10am - 10pm',
    ),
  ];
}

class HomeAppointmentData {
  final DateTime date;
  final String address;

  const HomeAppointmentData({required this.date, required this.address});
}

class HomeCategoryData {
  final PlantCategory category;
  final String label;
  final int assetIndex;

  const HomeCategoryData({required this.category, required this.label, required this.assetIndex});
}

class HomeServiceData {
  final String label;
  final String title;
  final double price;

  const HomeServiceData({required this.label, required this.title, required this.price});
}

class HomeBranchData {
  final double latitude;
  final double longitude;
  final String name;
  final String address;
  final String openingHours;

  const HomeBranchData({
    required this.latitude,
    required this.longitude,
    required this.name,
    required this.address,
    required this.openingHours,
  });
}
