import 'package:flutter/material.dart';

import '../screens/checkout_screen.dart';
import '../screens/error_screen.dart';
import 'nested_bottom_multi_navigation.dart';

class NavigatorAppRouter {
  NavigatorAppRouter._();
  static Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(
          builder: (_) => const BaseNavigation(),
        );
      case '/checkout':
        return MaterialPageRoute(
          builder: (_) => const CheckoutScreen(),
        );
      default:
        return MaterialPageRoute(
          builder: (_) => const ErrorScreen(),
        );
    }
  }
}
