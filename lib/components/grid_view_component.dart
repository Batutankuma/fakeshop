import 'package:fakeshop/constant.dart';
import 'package:fakeshop/models/product_model.dart';
import 'package:fakeshop/views/description_views.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class GridViewComponent extends StatelessWidget {
  List<ProductModel> listProducts;
  GridViewComponent({super.key, required this.listProducts});
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: listProducts.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          childAspectRatio: 0.7,
          crossAxisSpacing: 7,
          mainAxisSpacing: 7,
          crossAxisCount: 2),
      itemBuilder: (context, index) {
        ProductModel modelOne = listProducts[index];
        return Card(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(0)),
          color: Colors.white,
          elevation: 1.0,
          child: GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => DescriptionView(productModel: modelOne),
                ),
              );
            },
            child: Padding(
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
                      )),
                  Flexible(
                    flex: 2,
                    child: Text(
                      modelOne.title,
                      softWrap: true,
                      textAlign: TextAlign.justify,
                      overflow: TextOverflow.clip,
                      style: const TextStyle(fontWeight: FontWeight.w700),
                      maxLines: 3,
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
