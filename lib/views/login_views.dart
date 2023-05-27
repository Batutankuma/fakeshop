import 'package:flutter/material.dart';

// ignore: must_be_immutable
class LoginView extends StatelessWidget {
  TextEditingController username = TextEditingController();
  TextEditingController password = TextEditingController();
  final _keyForm = GlobalKey<FormState>();

  LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: _keyForm,
        child: Column(
          children: [
            const Text("Login Application"),
            TextFormField(
              controller: username,
              decoration: const InputDecoration(
                  hintText: "Username", labelText: "Username"),
            ),
            TextFormField(
              controller: password,
              decoration: const InputDecoration(
                  hintText: "Username", labelText: "Username"),
            )
          ],
        ),
      ),
    );
  }
}
