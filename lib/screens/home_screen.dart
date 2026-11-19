import 'package:data_flow_interview_assessment/app_router.dart';
import 'package:data_flow_interview_assessment/generated/l10n.dart';
import 'package:data_flow_interview_assessment/screens/tabs/account_tab/account_tab.dart';
import 'package:data_flow_interview_assessment/screens/tabs/discover_tab/discover_tab.dart';
import 'package:data_flow_interview_assessment/screens/tabs/home_tab/home_tab.dart';
import 'package:data_flow_interview_assessment/screens/tabs/inbox_tab/inbox_tab.dart';
import 'package:data_flow_interview_assessment/screens/tabs/mall_tab/mall_tab.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';

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

  void _openArticle(String id) {
    context.pushNamed<void>(
      AppRouter.discoverArticle,
      pathParameters: <String, String>{'id': id},
    );
  }

  void _openNotice(String id) {
    context.pushNamed<void>(
      AppRouter.inboxNotice,
      pathParameters: <String, String>{'id': id},
    );
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
            HomeTab(
              onDiscoverPressed: () => _selectTab(2),
              onArticlePressed: _openArticle,
            ),
            MallTab(onBack: () => _selectTab(0)),
            DiscoverTab(onArticlePressed: _openArticle),
            InboxTab(onNoticePressed: _openNotice),
            const AccountTab(),
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
