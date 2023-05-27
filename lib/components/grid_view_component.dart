import 'package:flutter/material.dart';

class GridViewComponent extends StatelessWidget{
  const GridViewComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2), 
     itemBuilder: (context, index) {
       return Card(
        child: Center(
          child: Text("Center"),
        ),
       );
     },
    );
  }

}