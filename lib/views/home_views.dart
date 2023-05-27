import 'package:fakeshop/components/grid_view_component.dart';
import 'package:flutter/material.dart';

class HomeView extends StatelessWidget{
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
      body: const GridViewComponent()
    );
  }

}