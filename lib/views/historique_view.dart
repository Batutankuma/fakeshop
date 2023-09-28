import 'package:fakeshop/constant.dart';
import 'package:fakeshop/models/story.model.dart';
import 'package:fakeshop/views/description_views.dart';
import 'package:flutter/material.dart';
import 'dart:core';

class HistoriqueView extends StatelessWidget {
  const HistoriqueView({super.key});

  //filtrage joint firebase
  Future<List<Map<String, dynamic>>> achatList() async {
    List<Map<String, dynamic>> list = [];
    var achat = await firestore
        .collection('achat')
        .where('userid', isEqualTo: fireAuth.currentUser!.uid)
        .get();
    for (var element in achat.docs) {
      var produit =
          await firestore.collection('produit').doc(element['produitid']).get();
      var x = {...element.data(), "produit": produit.data()};
      list.add(x);
    }
    return list;
  }

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
      body: StreamBuilder<List<Map<String, dynamic>>>(
        stream: achatList().asStream(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else {
            List<StoryModel> story = StoryModel.fetchStory(
                snapshot.data as List<Map<String, dynamic>>);
            return ListView.builder(
              itemCount: story.length,
              itemBuilder: (context, index) {
                return ListTile(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (BuildContext context) {
                        return DescriptionView(
                            productModel: story[index].produitid);
                      }),
                    );
                  },
                  title: Text(story[index].produitid.title),
                  leading: Container(
                    height: 50,
                    width: 50,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                          image: NetworkImage(story[index].produitid.image),
                          fit: BoxFit.cover),
                    ),
                  ),
                  subtitle: Text(story[index].date.toString()),
                );
              },
            );
          }
        },
      ),
    );
  }
}

/**
 * 
 */
