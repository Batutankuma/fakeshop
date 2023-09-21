import 'package:fakeshop/constant.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

// ignore: must_be_immutable
class LoginView extends StatelessWidget {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  final _keyForm = GlobalKey<FormState>();

  LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: _keyForm,
        child: Padding(
          padding: const EdgeInsets.only(left: 20, right: 20, top: 120),
          child: ListView(
            children: [
              Align(
                alignment: Alignment.topLeft,
                child: Text(
                  "Bonjour à Nouveau!".toUpperCase(),
                  style: const TextStyle(
                      fontWeight: FontWeight.w800,
                      color: Colors.black,
                      fontSize: 25),
                ),
              ),
              Align(
                alignment: Alignment.topLeft,
                child: Text(
                  "Content de te revoir".toUpperCase(),
                  style: const TextStyle(
                      fontWeight: FontWeight.w600,
                      color: Colors.grey,
                      fontSize: 15),
                ),
              ),
              const SizedBox(height: 40),
              SizedBox(
                height: 40,
                child: TextFormField(
                  controller: email,
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      icon: Icon(Icons.email),
                      hintText: "Email",
                      labelText: "Email"),
                ),
              ),
              const SizedBox(height: 40),
              SizedBox(
                height: 40,
                child: TextFormField(
                  controller: password,
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      icon: Icon(Icons.key),
                      hintText: "Password",
                      labelText: "Password"),
                ),
              ),
              const SizedBox(height: 20),
              Align(
                alignment: Alignment.topRight,
                child: Text(
                  "Forgot Password?",
                  style: TextStyle(
                      fontWeight: FontWeight.w800,
                      color: Theme.of(context).primaryColor,
                      fontSize: 14),
                ),
              ),
              const SizedBox(height: 40),
              //btn login
              FilledButton(
                style: ButtonStyle(
                    backgroundColor: MaterialStatePropertyAll(
                        Theme.of(context).primaryColor)),
                onPressed: () => {
                  //logic authentification application
                  fireAuth
                      .signInWithEmailAndPassword(
                          email: email.text, password: password.text)
                      .then((value) => Navigator.pushNamedAndRemoveUntil(
                          context, '/index', (route) => false))
                      .catchError((error) => ScaffoldMessenger.of(context)
                          .showSnackBar(SnackBar(content: Text("$error"))))
                },
                child: const Center(
                  child: Text(
                    "Login to your account",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
              const SizedBox(height: 40),
              //btn login
              ElevatedButton.icon(
                label: const Center(
                  child: Text(
                    "Login Using Google",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                icon: const Icon(Icons.apple),
                style: const ButtonStyle(
                    backgroundColor: MaterialStatePropertyAll(Colors.red)),
                onPressed: null,
              ),
              const SizedBox(height: 40),
              const Align(
                alignment: Alignment.center,
                child: Text(
                  "Besoin d'avoir un compte Sign Up?",
                  style: TextStyle(
                      fontWeight: FontWeight.w800,
                      color: Colors.black,
                      fontSize: 14),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
