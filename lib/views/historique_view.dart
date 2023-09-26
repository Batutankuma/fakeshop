import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fakeshop/constant.dart';
import 'package:flutter/material.dart';
import 'dart:core';

class HistoriqueView extends StatelessWidget {
  const HistoriqueView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Historique".toUpperCase(),
          style: const TextStyle(
              fontWeight: FontWeight.w700, fontSize: 16, color: Colors.white),
        ),
        backgroundColor: Colors.black,
        actions: const [
          IconButton(
            onPressed: null,
            icon: Icon(Icons.search, color: Colors.white),
          ),
        ],
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: firestore
            .collection('achat')
            .doc('nVhpDc9odRpJsDYmjNIT')
            .collection('produit')
            .snapshots(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else {
            print(snapshot.data!.docs);
            return Text("data");
            /**
             * List<StoryModel> story = StoryModel.fetchStory(snapshot.data!.docs);
            return ListView.builder(
              itemCount: story.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(story[index].id),
                  subtitle: Text(
                    story[index].date.toString(),
                  ),
                );
              },
            );
             */
          }
        },
      ),
    );
  }
}
