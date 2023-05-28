import 'package:fakeshop/models/product_model.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class GridViewComponent extends StatelessWidget {
  GridViewComponent({super.key});
  ProductModel modelOne = ProductModel(
      "1",
      "Fjallraven - Foldsack No. 1 Backpack, Fits 15 Laptops",
      109.95,
      "men's clothing",
      "Your perfect pack for everyday use and walks in the forest. Stash your laptop (up to 15 inches) in the padded sleeve, your everyday",
      "https://fakestoreapi.com/img/81fPKd-2AYL._AC_SL1500_.jpg");

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          childAspectRatio: 0.7,
          crossAxisSpacing: 1,
          mainAxisSpacing: 2,
          crossAxisCount: 2),
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.all(5),
          child: Column(
            children: [
              Flexible(flex: 3, child: Image.network(modelOne.image)),
              Flexible(
                flex: 1,
                child: Text(
                  modelOne.price.toString(),
                  softWrap: true, 
                  textAlign: TextAlign.justify,
                  overflow: TextOverflow.clip,
                )
              ),
              Flexible(
                flex: 2,
                child: Text(
                  modelOne.title,
                  softWrap: true, 
                  textAlign: TextAlign.justify,
                  overflow: TextOverflow.clip,
                  style: const TextStyle(
                    fontWeight: FontWeight.w700
                  ),
                  maxLines: 3,
                )
              ),
            ],
          ),
        );
      },
    );
  }
}
