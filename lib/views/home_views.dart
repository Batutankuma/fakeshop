import 'package:fakeshop/components/grid_view_component.dart';
import 'package:fakeshop/models/product_model.dart';
import 'package:fakeshop/services/product_service.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class HomeView extends StatefulWidget{
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {

  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("FakeShop", style: TextStyle(fontWeight: FontWeight.w700),),
        backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
        actions: const [
          IconButton(onPressed: null, icon: Icon(Icons.search)),
          IconButton(onPressed: null, icon: Icon(Icons.shop))
        ],
      ),
      body: FutureBuilder<List<ProductModel>>(
        future: fetchProductList(http.Client()),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return GridViewComponent(listProducts: snapshot.data!);
          }else if(snapshot.hasError){
            print("object");
          }
          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      )
    );
  }
}
