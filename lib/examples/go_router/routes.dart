import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';

import '../screens/checkout_screen.dart';
import '../screens/details_screen.dart';
import '../screens/error_screen.dart';
import '../screens/home_screen.dart';
import '../screens/settings_screen.dart';
import 'scaffold_with_bottom_bar.dart';

part 'home_shell_branch.dart';

part 'settings_shell_branch.dart';

@immutable
class AppRouter {
  static final _rootNavigatorKey =
      GlobalKey<NavigatorState>(debugLabel: 'root');

  static GoRouter routes = GoRouter(
    navigatorKey: _rootNavigatorKey,
    debugLogDiagnostics: true,
    initialLocation: '/home',
    // refreshListenable: ,
    errorBuilder: (BuildContext context, GoRouterState state) {
      return const ErrorScreen();
    },

    routes: [
      StatefulShellRoute.indexedStack(
        builder: (context, state, child) {
          return ScaffoldWithBottomBar(
            navigationShell: child,
          );
        },
        branches: [
          HomeShellBranch(),
          SettingsShellBranch(),
        ],
      ),
      GoRoute(
        path: '/checkout',
        name: 'checkout',
        builder: (BuildContext context, GoRouterState state) {
          return const CheckoutScreen();
        },
      ),
    ],
  );
}
