import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../constants.dart';

class DetailsScreen extends StatefulWidget {
  final String label;

  const DetailsScreen(this.label, {super.key});

  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  int number = 0;

  @override
  void initState() {
    super.initState();
    log("Screens: ${widget.label} Details Screen Initialized");
  }

  @override
  void dispose() {
    super.dispose();
    log("Screens: ${widget.label} Details Screen disposed");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("${widget.label} Details"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(child: Text("Data: $number")),
          ElevatedButton(
            onPressed: () {
              setState(() {
                number++;
              });
            },
            child: const Text("Increment"),
          ),
          ElevatedButton(
            onPressed: () {
              if (usingGoRouter) {
                context.pushNamed('checkout');
              } else {
                Navigator.of(context, rootNavigator: true)
                    .pushNamed('/checkout');
              }
            },
            child: const Text("Checkout"),
          ),
        ],
      ),
    );
  }
}
