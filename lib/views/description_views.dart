import 'package:fakeshop/models/product_model.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class DescriptionView extends StatelessWidget {
  ProductModel productModel;

  DescriptionView({super.key, required this.productModel});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Description",
            style: TextStyle(fontWeight: FontWeight.w700)),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            //image
            Flexible(
              flex: 2,
              child: Image.network(productModel.image),
            ),
            //title
            Flexible(
              flex: 1,
              child: Center(
                child: Text(productModel.title.toUpperCase(),
                    style: const TextStyle(fontWeight: FontWeight.w700)),
              ),
            ),
            //subtitle
            Flexible(
              flex: 2,
              child: Text(
                productModel.description,
                textAlign: TextAlign.justify,
              ),
            ),
            const SizedBox(height: 20),
            //price
            SizedBox(
              child: Row(
                children: [
                  Flexible(
                    flex: 4,
                    child: ElevatedButton(
                      onPressed: null,
                      child: Center(
                        child: Text(
                          productModel.price.toString(),
                          style: const TextStyle(
                              fontWeight: FontWeight.w800, color: Colors.black),
                        ),
                      ),
                    ),
                  ),
                  const Flexible(
                    flex: 1,
                    child: IconButton(onPressed: null, icon: Icon(Icons.shop,color: Colors.black)),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
