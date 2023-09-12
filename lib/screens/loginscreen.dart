import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:quiz_app/responsive.dart';
import 'package:quiz_app/screens/signupscreen.dart';

import '../providers/providers.dart';
import '../services/authservices.dart';

class LoginScreen extends ConsumerWidget {
  LoginScreen({super.key});

  final TextEditingController emailcontroller = TextEditingController();
  final TextEditingController passwordcontroller = TextEditingController();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final emailError = ref.watch(errorProvider);
    final passwordError = ref.watch(passwordErrorProvider);
    final hiddensignin = ref.watch(hiddenpassworedsigninProvider);

    return Scaffold(
      backgroundColor: Colors.teal,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(
                vertical: Responsive.height(86, context),
                horizontal: Responsive.width(32, context)),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Welcome Back!",
                  style: TextStyle(
                      fontSize: Responsive.width(24, context),
                      fontWeight: FontWeight.bold),
                ),
                Text(
                  "What kind of partner are you? Take this quiz to find out!",
                  style: TextStyle(
                      fontWeight: FontWeight.normal,
                      fontSize: Responsive.width(12, context)),
                ),
                SizedBox(
                  height: Responsive.height(20, context),
                ),
                TextField(
                  onChanged: (value) {
                    if (value == "") {
                      ref.read(errorProvider.notifier).state = false;
                    } else {
                      ref.read(errorProvider.notifier).state = true;
                    }
                  },
                  controller: emailcontroller,
                  decoration: InputDecoration(
                    border: const OutlineInputBorder(),
                    focusedErrorBorder: const OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.red)),
                    errorText: emailError ? null : "please enter email",
                    enabledBorder: const OutlineInputBorder(),
                    focusedBorder: const OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.blue)),
                    prefixIcon: const Icon(Icons.email),
                    hintText: "E-Mail",
                    hintStyle: const TextStyle(color: Colors.black),
                  ),
                ),
                SizedBox(
                  height: Responsive.height(20, context),
                ),
                TextField(
                  onChanged: (value) {
                    if (value == "") {
                      ref.read(passwordErrorProvider.notifier).state = false;
                    } else {
                      ref.read(passwordErrorProvider.notifier).state = true;
                    }
                  },
                  controller: passwordcontroller,
                  obscureText: hiddensignin,
                  decoration: InputDecoration(
                    errorText:
                        passwordError ? null : "password must be 8 characters",
                    border: const OutlineInputBorder(),
                    enabledBorder: const OutlineInputBorder(),
                    focusedBorder: const OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.blue)),
                    prefixIcon: const Icon(Icons.fingerprint_outlined),
                    suffixIcon: IconButton(
                        onPressed: () {
                          if (hiddensignin == true) {
                            ref
                                .read(hiddenpassworedsigninProvider.notifier)
                                .state = false;
                          } else {
                            ref
                                .read(hiddenpassworedsigninProvider.notifier)
                                .state = true;
                          }
                        },
                        icon: Icon(!hiddensignin
                            ? Icons.visibility
                            : Icons.visibility_off)),
                    hintText: "Password",
                    hintStyle: const TextStyle(color: Colors.black),
                  ),
                ),
                SizedBox(
                  height: Responsive.height(20, context),
                ),
                Padding(
                  padding:
                      EdgeInsets.only(left: Responsive.width(190, context)),
                  child: const Text(
                    "Forgot Password?",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                SizedBox(
                  height: Responsive.height(20, context),
                ),
                ElevatedButton(
                  onPressed: () async {
                    print(emailcontroller.text);
                    print(passwordcontroller.text);

                    if (emailcontroller.text != "" &&
                        passwordcontroller.text != "") {
                      try {
                        await ref.read(authServiceProvider).login(
                            emailcontroller.text, passwordcontroller.text);
                      } on FirebaseAuthException catch (e) {
                        print(e.message.toString());
                      }
                    }
                  },
                  style: ElevatedButton.styleFrom(
                      minimumSize:
                          Size(double.infinity, Responsive.height(40, context)),
                      backgroundColor: Colors.black),
                  child: const Text(
                    "Login",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                SizedBox(
                  height: Responsive.height(20, context),
                ),
                SizedBox(
                  height: Responsive.height(20, context),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Text("Don't have an account?"),
                    TextButton(
                        onPressed: () {
                          Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => SignUp(),
                          ));
                        },
                        child: const Text(
                          "Register",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, color: Colors.black),
                        ))
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
