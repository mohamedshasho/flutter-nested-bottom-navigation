import 'dart:developer';

import 'package:flutter/material.dart';

import 'constants.dart';
import 'examples/go_router/routes.dart';
import 'examples/navigation/navigator_app_router.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    log("Screens: runApp");
    //TODO: TabBarView, or PageView with AutomaticKeepAliveClientMixin
    final theme = ThemeData(
      useMaterial3: true,
      pageTransitionsTheme: const PageTransitionsTheme(
        builders: <TargetPlatform, PageTransitionsBuilder>{
          TargetPlatform.android: CupertinoPageTransitionsBuilder(),
          TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
        },
      ),
    );
    return usingGoRouter
        ? MaterialApp.router(
            routerConfig: AppRouter.routes,
            debugShowCheckedModeBanner: false,
            theme: theme,
          )
        : MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: theme,
            initialRoute: '/',
            onGenerateRoute: NavigatorAppRouter.generateRoute,
          );
  }
}
