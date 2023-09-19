import 'package:fakeshop/components/grid_view_component.dart';
import 'package:fakeshop/models/product_model.dart';
import 'package:fakeshop/services/product_service.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:http/http.dart' as http;

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
      body: FutureBuilder<List<ProductModel>>(
        future: fetchProductList(http.Client()),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                child: GridViewComponent(listProducts: snapshot.data!));
          } else if (snapshot.hasError) {}
          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}
