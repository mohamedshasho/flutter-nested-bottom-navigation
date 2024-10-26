import 'package:flutter/material.dart';

class NestedOneStack extends StatefulWidget {
  const NestedOneStack({super.key});

  @override
  State<NestedOneStack> createState() => _NestedOneStackState();
}

class _NestedOneStackState extends State<NestedOneStack> {
  final navigatorKey = GlobalKey<NavigatorState>(debugLabel: 'root');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Navigator(
        key: navigatorKey,
        onGenerateRoute: (route) => _buildPageRoute(const HomePage()),
      ),
      bottomNavigationBar: CustomBottomNavigationBar(navigatorKey),
    );
  }

  // Common method for creating the PageRoute with SlideTransition
  PageRouteBuilder _buildPageRoute(Widget page) {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => page,
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        const begin = Offset(-1.0, 0.0); // Slide in from the left
        const end = Offset.zero;
        const curve = Curves.ease;

        var tween =
            Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
        return SlideTransition(
          position: animation.drive(tween),
          child: child,
        );
      },
    );
  }
}

class CustomBottomNavigationBar extends StatelessWidget {
  final GlobalKey<NavigatorState> navigatorKey;

  const CustomBottomNavigationBar(this.navigatorKey, {super.key});

  void _push(Widget page) {
    navigatorKey.currentState!.push(PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => page,
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        const begin = Offset(-1.0, 0.0); // Slide in from the left
        const end = Offset.zero;
        const curve = Curves.ease;

        var tween =
            Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
        return SlideTransition(
          position: animation.drive(tween),
          child: child,
        );
      },
      transitionDuration: const Duration(milliseconds: 200),
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blue,
      child: ButtonBar(
        alignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          ElevatedButton(
            child: const Text("Home"),
            onPressed: () {
              _push(const HomePage());
            },
          ),
          ElevatedButton(
            child: const Text("Setting"),
            onPressed: () {
              _push(const SettingPage());
            },
          ),
        ],
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          const Text("Home Page"),
          ElevatedButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text("Back"),
          ),
        ],
      ),
    );
  }
}

class SettingPage extends StatelessWidget {
  const SettingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          const Text("Setting Page"),
          ElevatedButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text("Back"),
          ),
        ],
      ),
    );
  }
}
