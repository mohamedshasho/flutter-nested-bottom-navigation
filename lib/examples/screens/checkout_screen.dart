import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../constants.dart';

class CheckoutScreen extends StatefulWidget {
  const CheckoutScreen({super.key});

  @override
  State<CheckoutScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<CheckoutScreen> {
  @override
  void initState() {
    super.initState();
    log("Screens: Checkout Screen Initialized");
  }

  @override
  void dispose() {
    super.dispose();
    log("Screens: Checkout Screen disposed");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Checkout Screen"),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            if (usingGoRouter) {
              context.go('/home');
            } else {
              Navigator.pushNamedAndRemoveUntil(context, '/', (routs) => false);
            }
          },
          child: const Text("Done"),
        ),
      ),
    );
  }
}
