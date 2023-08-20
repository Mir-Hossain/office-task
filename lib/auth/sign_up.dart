import 'package:firebase_authentication/auth/auth.dart';
import 'package:firebase_authentication/widgets/social_icon.dart';
import 'package:flutter/material.dart';

import '../widgets/custom_form_field.dart';

class Registration extends StatelessWidget {
  Registration({super.key});
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passController = TextEditingController();

  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              const Text("Registration"),
              const SizedBox(height: 15),
              customFormField(
                label: "Email",
                hint: "Enter email",
                validator: (value) {
                  if (value.isNull) {
                    return "Field cannot null";
                  }
                  return null;
                },
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
                      if (_formKey.currentState!.validate()) {
                        Auth().registration(
                            emailController.text, passController.text, context);
                      }
                      emailController.clear();
                      passController.clear();
                    },
                    style: ElevatedButton.styleFrom(),
                    child: const Text("Sign Up"),
                  ),
                ),
              ),
              const SizedBox(height: 50),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  socialIconButton(() => Auth().registerWithGoogle(),
                      "assets/icon/google.png"),
                  const SizedBox(width: 50),
                  socialIconButton(() => Auth().signInWithFacebook(),
                      "assets/icon/facebook.png")
                ],
              )
            ],
          ),
        ),
      ),
    ));
  }
}
