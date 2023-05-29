import 'package:fakeshop/components/grid_view_component.dart';
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
        title: const Text("Category", style: TextStyle(fontWeight: FontWeight.w700)),
        bottom: TabBar(
          controller: _tabController,
          tabs: const <Widget>[
            Tab(
              text: "electronics",
              icon: Icon(Icons.cloud_outlined),
            ),
            Tab(
              text: "jewelery",
              icon: Icon(Icons.beach_access_sharp),
            ),
            Tab(
              text: "men's clothing",
              icon: Icon(Icons.brightness_5_sharp),
            ),
            Tab(
              text: "women's clothing",
              icon: Icon(Icons.brightness_5_sharp),
            ),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children:  <Widget>[
          Center(
            child: GridViewComponent(),
          ),
          Center(
            child: GridViewComponent(),
          ),
          Center(
            child: GridViewComponent(),
          ),
          Center(
            child: GridViewComponent(),
          ),
        ],
      ),
    );
  }
}
