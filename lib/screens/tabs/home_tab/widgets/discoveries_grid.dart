import 'package:data_flow_interview_assessment/constants/dimensions.dart';
import 'package:data_flow_interview_assessment/screens/tabs/home_tab/home_tab_data.dart';
import 'package:data_flow_interview_assessment/screens/tabs/home_tab/widgets/discovery_card.dart';
import 'package:flutter/material.dart';

class DiscoveriesGrid extends StatelessWidget {
  final List<HomeDiscoveryData> items;

  const DiscoveriesGrid({required this.items});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        for (int column = 0; column < 2; column++) ...<Widget>[
          if (column > 0) const SizedBox(width: kPadding / 2),
          Expanded(
            child: Column(
              children: <Widget>[
                for (int index = column; index < items.length; index += 2) ...<Widget>[
                  if (index > column) const SizedBox(height: kPadding / 2),
                  DiscoveryCard(data: items[index]),
                ],
              ],
            ),
          ),
        ],
      ],
    );
  }
}
