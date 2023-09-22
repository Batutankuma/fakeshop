import 'package:fakeshop/views/category_view.dart';
import 'package:fakeshop/views/historique_view.dart';
import 'package:fakeshop/views/home_views.dart';
import 'package:fakeshop/views/setting_view.dart';
import 'package:flutter/material.dart';

class NavigationBarView extends StatefulWidget {
  const NavigationBarView({super.key});

  @override
  State<NavigationBarView> createState() => _NavigationBarViewState();
}

class _NavigationBarViewState extends State<NavigationBarView> {
  //list of the page or view navigator
  List<Widget> viewUI = [
    const HomeView(),
    const CategoryView(),
    const HistoriqueView(),
    const SettingView()
  ];

  //init index view page
  int indexView = 0;

  void changeView(index) {
    setState(() {
      indexView = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: viewUI[indexView],
      bottomNavigationBar: BottomNavigationBar(
        onTap: changeView,
        currentIndex: indexView,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.store), label: "Home"),
          BottomNavigationBarItem(
              icon: Icon(Icons.category), label: "Category"),
          BottomNavigationBarItem(
              icon: Icon(Icons.history), label: "Historique"),
          BottomNavigationBarItem(icon: Icon(Icons.settings), label: "Setting")
        ],
      ),
    );
  }
}
