import 'package:firebase_authentication/auth/auth.dart';
import 'package:firebase_authentication/auth/sign_up.dart';
import 'package:flutter/material.dart';

import '../widgets/custom_form_field.dart';

class Login extends StatelessWidget {
  Login({super.key});
  final emailController = TextEditingController();
  final passController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text("Login"),
              const SizedBox(height: 15),
              customFormField(
                label: "Email",
                hint: "Enter email",
                controller: emailController,
              ),
              const SizedBox(height: 10),
              customFormField(
                  label: "Password",
                  hint: "Enter Password",
                  controller: passController,
                  obscureText: true),
              const SizedBox(height: 50),
              Center(
                child: SizedBox(
                  width: 200,
                  child: ElevatedButton(
                    onPressed: () {
                      Auth().login(
                          emailController.text, passController.text, context);
                      emailController.clear();
                      passController.clear();
                    },
                    style: ElevatedButton.styleFrom(),
                    child: const Text("Login"),
                  ),
                ),
              ),
              const SizedBox(height: 30),
              Center(
                child: SizedBox(
                  width: 200,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Registration()),
                      );
                    },
                    style: ElevatedButton.styleFrom(),
                    child: const Text("Registration"),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
