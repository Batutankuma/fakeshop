import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fakeshop/components/grid_view_component.dart';
import 'package:fakeshop/constant.dart';
import 'package:fakeshop/models/product_model.dart';
import 'package:flutter/material.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "FakeShop".toUpperCase(),
          style: const TextStyle(
              fontWeight: FontWeight.w700, fontSize: 16, color: Colors.white),
        ),
        backgroundColor: Colors.black,
        actions: const [
          IconButton(
              onPressed: null, icon: Icon(Icons.search, color: Colors.white)),
          IconButton(
              onPressed: null, icon: Icon(Icons.shop, color: Colors.white))
        ],
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: firestore.collection('produit').snapshots(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) return const LinearProgressIndicator();
          return Padding(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
              child: GridViewComponent(
                  listProducts:
                      ProductModel.fetchProduit(snapshot.data!.docs)));
        },
      ),
    );
  }
}
