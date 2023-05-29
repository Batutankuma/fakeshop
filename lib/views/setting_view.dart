import 'package:flutter/material.dart';

class SettingView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          const SizedBox(height: 50),
          Center(
            child: Container(
              width: 120,
              height: 120,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.black),
                  borderRadius: BorderRadius.circular(100),
                  color: Colors.teal),
              child: const Center(
                child: Text("S",
                    style:
                        TextStyle(fontWeight: FontWeight.w800, fontSize: 50)),
              ),
            ),
          ),
          const SizedBox(height: 10),
          Center(
            child: Text("Sael Batuta Nkuma".toUpperCase()),
          ),
          const SizedBox(height: 10),
          const Center(
            child: Text("Saelbatita@gmail.com"),
          )
        ],
      ),
    );
  }
}
