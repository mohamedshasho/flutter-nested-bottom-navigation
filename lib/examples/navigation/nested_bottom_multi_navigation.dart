import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../screens/details_screen.dart';
import '../screens/error_screen.dart';
import '../screens/home_screen.dart';
import '../screens/settings_screen.dart';

class BaseNavigation extends StatefulWidget {
  const BaseNavigation({super.key});

  @override
  State<StatefulWidget> createState() => _BaseNavigation();
}

class _BaseNavigation extends State<BaseNavigation>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;
  int _selectedIndex = 0;

  final _homeNavigatorKey = GlobalKey<NavigatorState>();

  final _settingsNavigatorKey = GlobalKey<NavigatorState>();

  void _selectTab(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  void _onWillPop() async {
    NavigatorState currentNavigator = _selectedIndex == 0
        ? _homeNavigatorKey.currentState!
        : _settingsNavigatorKey.currentState!;

    if (currentNavigator.canPop()) {
      currentNavigator.pop();
    } else if (_selectedIndex != 0) {
      setState(() {
        _selectedIndex = 0;
      });
    } else {
      SystemNavigator.pop();
    }
  }

  
  @override
  Widget build(BuildContext context) {
    super.build(context);
    log("Screens: _BaseNavigation");
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (didPop, result) {
        log("Screens: onPopInvokedWithResult");
        _onWillPop();
      },
      child: Scaffold(
        body: IndexedStack(
          index: _selectedIndex,
          children: [
            HomeDestination(
              _homeNavigatorKey,
              key: const PageStorageKey(0),
            ),
            SettingsDestination(
              _settingsNavigatorKey,
              key: const PageStorageKey(1),
            ),
          ],
        ),
        bottomNavigationBar: BottomNavigation(
          currentIndex: _selectedIndex,
          onSelectTab: _selectTab,
        ),
      ),
    );
  }
}

class HomeDestination extends StatelessWidget {
  final GlobalKey<NavigatorState> navigatorKey;

  const HomeDestination(this.navigatorKey, {super.key});

  @override
  Widget build(BuildContext context) {
    return Navigator(
      key: navigatorKey,
      initialRoute: '/',
      onGenerateRoute: (settings) {
        switch (settings.name) {
          case '/':
            return MaterialPageRoute(
              builder: (_) => const HomeScreen(),
            );
          case '/details':
            return MaterialPageRoute(
              builder: (_) => const DetailsScreen("Home"),
            );
          default:
            return MaterialPageRoute(
              builder: (_) => const ErrorScreen(),
            );
        }
      },
    );
  }
}

class SettingsDestination extends StatelessWidget {
  final GlobalKey<NavigatorState> navigatorKey;

  const SettingsDestination(this.navigatorKey, {super.key});

  @override
  Widget build(BuildContext context) {
    return Navigator(
      key: navigatorKey,
      initialRoute: '/',
      onGenerateRoute: (settings) {
        switch (settings.name) {
          case '/':
            return MaterialPageRoute(
              builder: (_) => const SettingsScreen(),
            );
          case '/details':
            return MaterialPageRoute(
              builder: (_) => const DetailsScreen("Settings"),
            );
          default:
            return MaterialPageRoute(
              builder: (_) => const ErrorScreen(),
            );
        }
      },
    );
  }
}

class BottomNavigation extends StatelessWidget {
  const BottomNavigation(
      {super.key, required this.currentIndex, required this.onSelectTab});

  final int currentIndex;
  final ValueChanged<int> onSelectTab;

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      items: [
        _buildItem(0),
        _buildItem(1),
      ],
      onTap: onSelectTab,
      currentIndex: currentIndex,
      selectedItemColor: Colors.green,
    );
  }

  BottomNavigationBarItem _buildItem(int index) {
    return BottomNavigationBarItem(
      icon: Icon(
        Icons.layers,
        color: _colorTabMatching(index),
      ),
      label: index == 0 ? "Home" : "Settings",
    );
  }

  Color _colorTabMatching(int index) {
    return currentIndex == index ? Colors.red : Colors.grey;
  }
}
