import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ScaffoldWithBottomBar extends StatelessWidget {
  /// Constructs an [ScaffoldWithNavBar].
  const ScaffoldWithBottomBar({
    required this.navigationShell,
    Key? key,
  }) : super(key: key ?? const ValueKey<String>('ScaffoldWithNavBar'));

  /// The navigation shell and container for the branch Navigators.
  final StatefulNavigationShell navigationShell;

  // #docregion configuration-custom-shell
  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (didPop, result) {
        log("Screens: GoRouter onPopInvokedWithResult");
        final currentNavigatorState =
            navigationShell.shellRouteContext.navigatorKey.currentState;
        if (currentNavigatorState?.canPop() ?? false) {
          return;
        }
        if (navigationShell.currentIndex > 0) {
          // If we are not on the first tab, switch back to the first tab
          navigationShell.goBranch(0); // Switch to home tab
          return;
        }
      },
      child: Scaffold(
        // The StatefulNavigationShell from the associated StatefulShellRoute is
        // directly passed as the body of the Scaffold.
        body: navigationShell,
        bottomNavigationBar: BottomNavigationBar(
          // Here, the items of BottomNavigationBar are hard coded. In a real
          // world scenario, the items would most likely be generated from the
          // branches of the shell route, which can be fetched using
          // `navigationShell.route.branches`.
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
            BottomNavigationBarItem(
                icon: Icon(Icons.settings), label: 'Settings'),
          ],
          currentIndex: navigationShell.currentIndex,
          // Navigate to the current location of the branch at the provided index
          // when tapping an item in the BottomNavigationBar.
          onTap: (int index) => navigationShell.goBranch(index),
        ),
      ),
    );
  }
}
