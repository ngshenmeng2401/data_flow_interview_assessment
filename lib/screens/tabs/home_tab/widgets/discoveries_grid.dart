part of '../home_tab.dart';

class _DiscoveriesGrid extends StatelessWidget {
  final List<_HomeDiscoveryData> items;

  const _DiscoveriesGrid({required this.items});

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
                  _DiscoveryCard(data: items[index]),
                ],
              ],
            ),
          ),
        ],
      ],
    );
  }
}
