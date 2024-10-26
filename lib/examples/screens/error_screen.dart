import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../constants.dart';

class ErrorScreen extends StatelessWidget {
  const ErrorScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Center(child: Text("Error 404")),
          ElevatedButton(
            onPressed: () {
              if (usingGoRouter) {
                context.go('/home');
              } else {
                Navigator.pushNamedAndRemoveUntil(
                    context, '/', (routs) => routs.isFirst);
              }
            },
            child: const Text("Go Home"),
          ),
        ],
      ),
    );
  }
}
