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
        backgroundColor: Colors.transparent,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
        child: ListView(
          children: [
            //image
            SizedBox(
              height: 200,
              width: 120,
              child: Image.network(productModel.image),
            ),
            const SizedBox(height: 20),
            //title
            Flexible(
              flex: 1,
              child: Center(
                child: Text(
                  productModel.title.toUpperCase(),
                  textAlign: TextAlign.right,
                  style: const TextStyle(
                      fontWeight: FontWeight.w900, fontSize: 18),
                ),
              ),
            ),
            //Price
            Flexible(
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "\$ ${productModel.price}",
                  textAlign: TextAlign.left,
                  style: const TextStyle(
                      fontWeight: FontWeight.w900, fontSize: 18),
                ),
              ),
            ),
            const SizedBox(height: 20),
            //subtitle
            Flexible(
              flex: 2,
              child: Text(
                productModel.description,
                textAlign: TextAlign.left,
                style: const TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 15,
                    color: Colors.grey),
              ),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        child: Row(
          children: [
            Expanded(
              child: TextButton.icon(
                style: const ButtonStyle(
                    iconColor: MaterialStatePropertyAll(Colors.black),
                    backgroundColor: MaterialStatePropertyAll(Colors.teal)),
                onPressed: null,
                icon: const Icon(Icons.payment),
                label: const Text(
                  "Pay",
                  style: TextStyle(
                      fontWeight: FontWeight.w800, color: Colors.white),
                ),
              ),
            ),
            const IconButton(onPressed: null, icon: Icon(Icons.favorite)),
            const IconButton(onPressed: null, icon: Icon(Icons.shop)),
            const IconButton(
                onPressed: null, icon: Icon(Icons.apple, color: Colors.black))
          ],
        ),
      ),
    );
  }
}
