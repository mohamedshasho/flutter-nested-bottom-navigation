import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../constants.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    log("Screens: Home Screen Initialized");
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Center(
            child: Text("Home Screen"),
          ),
          ElevatedButton(
            child: const  Text("Go to Details"),
            onPressed: () {
              if (usingGoRouter) {
                context.goNamed('home-details');
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
