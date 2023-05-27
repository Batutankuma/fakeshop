import 'package:flutter/material.dart';

class NavigationBarView extends StatefulWidget{
  const NavigationBarView({super.key});

  @override
  State<NavigationBarView> createState() => _NavigationBarViewState();
}

class _NavigationBarViewState extends State<NavigationBarView> {
  //list of the page or view navigator
  List<Widget> viewUI = [Placeholder(),Placeholder(),Placeholder()];

  //init index view page
  int indexView = 0;

  void changeView(index){
    setState(() {
      indexView = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("FakeShop", style: TextStyle(fontWeight: FontWeight.w700),),
        backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
        actions: const [
          IconButton(onPressed: null, icon: Icon(Icons.shop))
        ],
      ),
      body: viewUI[indexView],
      bottomNavigationBar: BottomNavigationBar(
        onTap: changeView,
        currentIndex: indexView,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home),label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.category), label: "Category"),
          BottomNavigationBarItem(icon: Icon(Icons.settings),label: "Setting")
        ],
      ),
    );
  }
}