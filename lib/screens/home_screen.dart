import 'package:data_flow_interview_assessment/constants/dimensions.dart';
import 'package:data_flow_interview_assessment/generated/l10n.dart';
import 'package:data_flow_interview_assessment/screens/tabs/home_tab/home_tab.dart';
import 'package:data_flow_interview_assessment/screens/tabs/mall_tab/mall_tab.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final PageController _pageController = PageController();
  final RxInt _selectedIndex = 0.obs;

  @override
  void dispose() {
    _pageController.dispose();
    _selectedIndex.close();
    super.dispose();
  }

  void _selectTab(int index) {
    if (index == _selectedIndex.value || !_pageController.hasClients) {
      return;
    }
    _pageController.jumpToPage(index);
    _selectedIndex.value = index;
  }

  @override
  Widget build(BuildContext context) {
    final Lang lang = Lang.of(context);
    final Widget scaffold = Scaffold(
      body: SafeArea(
        bottom: false,
        child: PageView(
          controller: _pageController,
          physics: const NeverScrollableScrollPhysics(),
          children: <Widget>[
            const HomeTab(),
            MallTab(onBack: () => _selectTab(0)),
            _PlaceholderTab(title: lang.discover_title),
            _PlaceholderTab(title: lang.inbox_title),
            _PlaceholderTab(title: lang.account_title),
          ],
        ),
      ),
      bottomNavigationBar: Obx(
        () => BottomNavigationBar(
          currentIndex: _selectedIndex.value,
          onTap: _selectTab,
          items: <BottomNavigationBarItem>[
            _navigationItem(context, lang.home_title, 'Home'),
            _navigationItem(context, lang.mall_title, 'Mall'),
            _navigationItem(context, lang.discover_title, 'Discover'),
            _navigationItem(context, lang.inbox_title, 'Inbox'),
            _navigationItem(context, lang.account_title, 'Account'),
          ],
        ),
      ),
    );
    return Obx(
      () => PopScope<Object?>(
        canPop: _selectedIndex.value == 0,
        onPopInvokedWithResult: (bool didPop, Object? result) {
          if (!didPop && _selectedIndex.value != 0) {
            _selectTab(0);
          }
        },
        child: scaffold,
      ),
    );
  }

  BottomNavigationBarItem _navigationItem(
    BuildContext context,
    String label,
    String assetName,
  ) {
    final BottomNavigationBarThemeData theme =
        Theme.of(context).bottomNavigationBarTheme;
    return BottomNavigationBarItem(
      label: label,
      icon: Image.asset(
        'assets/icons/Nav Icon - $assetName.png',
        width: theme.unselectedIconTheme?.size,
        height: theme.unselectedIconTheme?.size,
        color: theme.unselectedItemColor,
        fit: BoxFit.contain,
        excludeFromSemantics: true,
      ),
      activeIcon: Image.asset(
        'assets/icons/Nav Icon - $assetName.png',
        width: theme.selectedIconTheme?.size,
        height: theme.selectedIconTheme?.size,
        color: theme.selectedItemColor,
        fit: BoxFit.contain,
        excludeFromSemantics: true,
      ),
    );
  }
}

class _PlaceholderTab extends StatelessWidget {
  final String title;

  const _PlaceholderTab({required this.title});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const ClampingScrollPhysics(),
      padding: const EdgeInsets.all(kPadding),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            title,
            style: Theme.of(context).textTheme.titleLarge,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          const SizedBox(height: kSpacing),
          Text(
            Lang.of(context).feature_not_implemented,
            style: Theme.of(context).textTheme.bodyMedium,
            maxLines: 3,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }
}