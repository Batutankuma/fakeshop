import 'package:fakeshop/components/grid_view_component.dart';
import 'package:fakeshop/constant.dart';
import 'package:fakeshop/models/product_model.dart';
import 'package:flutter/material.dart';

class CategoryView extends StatefulWidget {
  const CategoryView({super.key});

  @override
  State<CategoryView> createState() => CategoryViewState();
}

/// [AnimationController]s can be created with `vsync: this` because of
/// [TickerProviderStateMixin].
class CategoryViewState extends State<CategoryView>
    with TickerProviderStateMixin {
  late final TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        centerTitle: true,
        title: Text("Category".toUpperCase(),
            style: const TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: 16,
                color: Colors.white)),
        actions: const [
          IconButton(
              onPressed: null, icon: Icon(Icons.search), color: Colors.white),
          IconButton(
              onPressed: null, icon: Icon(Icons.shop), color: Colors.white)
        ],
        bottom: TabBar(
          labelColor: Colors.white,
          controller: _tabController,
          tabs: const <Widget>[
            Tab(
              text: "Men's clothing",
              icon: Icon(Icons.person),
            ),
            Tab(
              text: "Women's clothing",
              icon: Icon(Icons.person_2),
            ),
            Tab(
              text: "Jewelery",
              icon: Icon(Icons.join_left),
            ),
            Tab(
              text: "Electronics",
              icon: Icon(Icons.tv),
            ),
          ],
        ),
      ),
      body: StreamBuilder(
        stream: firestore.collection('produit').snapshots(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return const Column(
              children: [
                LinearProgressIndicator(),
                Expanded(
                  child: Center(
                    child: Text("Loading..."),
                  ),
                )
              ],
            );
          }

          return TabBarViewFilterCategory(
              ProductModel.fetchProduit(snapshot.data!.docs));
        },
      ),
    );
  }

  // ignore: non_constant_identifier_names
  TabBarView TabBarViewFilterCategory(List<ProductModel> productList) {
    return TabBarView(
      controller: _tabController,
      children: <Widget>[
        Center(
          child: GridViewComponent(
              listProducts: productList
                  .where(
                      (element) => element.category.contains("men's clothing"))
                  .toList()),
        ),
        Center(
          child: GridViewComponent(
              listProducts: productList
                  .where((element) =>
                      element.category.contains("women's clothing"))
                  .toList()),
        ),
        Center(
          child: GridViewComponent(
              listProducts: productList
                  .where((element) => element.category.contains("jewelery"))
                  .toList()),
        ),
        Center(
          child: GridViewComponent(
              listProducts: productList
                  .where((element) => element.category.contains("electronics"))
                  .toList()),
        ),
      ],
    );
  }
}
