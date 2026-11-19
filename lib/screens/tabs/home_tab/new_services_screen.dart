import 'package:data_flow_interview_assessment/constants/dimensions.dart';
import 'package:data_flow_interview_assessment/generated/l10n.dart';
import 'package:data_flow_interview_assessment/screens/tabs/home_tab/home_tab_data.dart';
import 'package:data_flow_interview_assessment/screens/tabs/home_tab/widgets/service_card.dart';
import 'package:data_flow_interview_assessment/widgets/app_search_field.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NewServicesScreen extends StatefulWidget {
  const NewServicesScreen({super.key});

  @override
  State<NewServicesScreen> createState() => _NewServicesScreenState();
}

class _NewServicesScreenState extends State<NewServicesScreen> {
  final RxString _query = ''.obs;

  @override
  void dispose() {
    _query.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final Lang lang = Lang.of(context);
    return Scaffold(
      appBar: AppBar(title: Text(lang.new_services_title)),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(kPadding),
              child: AppSearchField(
                // TODO translate
                hintText: 'Search services',
                onChanged: (String value) => _query.value = value.trim().toLowerCase(),
              ),
            ),
            Expanded(
              child: Obx(() {
                final String query = _query.value;
                final List<HomeServiceData> services = HomeSampleData.services.where(
                  (HomeServiceData service) =>
                      service.title.toLowerCase().contains(query) ||
                      service.label.toLowerCase().contains(query),
                ).toList();

                if (services.isEmpty) {
                  return Center(
                    child: Padding(
                      padding: const EdgeInsets.all(kPadding),
                      // TODO translate
                      child: Text('No services found.', textAlign: TextAlign.center),
                    ),
                  );
                }

                return MediaQuery.withNoTextScaling(
                  child: LayoutBuilder(
                    builder: (BuildContext context, BoxConstraints constraints) {
                      final double availableWidth = constraints.maxWidth - kPadding * 2;
                      final int columns = availableWidth >= ServiceCardLayout.width * 2 + kSpacing ? 2 : 1;
                      final double cardWidth = (availableWidth - kSpacing * (columns - 1)) / columns;
                      final ServiceCardLayout layout = ServiceCardLayout.measure(
                        context,
                        services,
                        cardWidth: cardWidth,
                      );
                      return GridView.builder(
                        physics: const ClampingScrollPhysics(),
                        padding: const EdgeInsets.fromLTRB(kPadding, 0, kPadding, kPadding),
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: columns,
                          crossAxisSpacing: kSpacing,
                          mainAxisSpacing: kSpacing,
                          mainAxisExtent: layout.height,
                        ),
                        itemCount: services.length,
                        itemBuilder: (BuildContext context, int index) {
                          return ServiceCard(data: services[index], layout: layout);
                        },
                      );
                    },
                  ),
                );
              }),
            ),
          ],
        ),
      ),
    );
  }
}
