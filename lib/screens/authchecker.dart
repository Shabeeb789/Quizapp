import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:quiz_app/screens/welcomescreen.dart';

import '../services/authservices.dart';
import 'loginscreen.dart';

class AuthChecker extends ConsumerWidget {
  const AuthChecker({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ref.watch(authStateProvider).when(
          data: (data) {
            print("$data");
            if (data == null) {
              return LoginScreen();
            } else {
              return WelcomeScreen();
            }
          },
          error: (error, stackTrace) => Text(error.toString()),
          loading: () {
            return const Center(child: CircularProgressIndicator());
          },
        );
  }
}
