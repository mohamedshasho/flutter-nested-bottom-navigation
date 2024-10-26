import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../constants.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    log("Screens: Settings Screen Initialized");
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Center(
            child: Text("Settings Screen"),
          ),
          ElevatedButton(
            child: const Text("Go to Details"),
            onPressed: () {
              if (usingGoRouter) {
                context.goNamed('details');
              } else {
                Navigator.pushNamed(context, '/details');
              }
            },
          )
        ],
      ),
    );
  }
}
