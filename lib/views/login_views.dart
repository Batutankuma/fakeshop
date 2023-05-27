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
      appBar: AppBar(),
      body: Form(
        key: _keyForm,
        child: Padding(
          padding: const EdgeInsets.only(left: 20, right: 20, top: 40),
          child: Column(
            children: [
              const Text("Login Application"),
              TextFormField(
                controller: username,
                decoration: const InputDecoration(
                    hintText: "Username", labelText: "Username"),
              ),
              const SizedBox(height: 10),
              TextFormField(
                controller: password,
                decoration: const InputDecoration(
                    hintText: "Password", labelText: "Password"),
              ),
              const SizedBox(height: 10),
              const FilledButton(
                onPressed: null,
                child: Center(
                  child: Text("Login"),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
