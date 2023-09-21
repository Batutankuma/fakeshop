import 'package:fakeshop/constant.dart';
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
            const SizedBox(height: 20),
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
                    color: Color.fromARGB(255, 61, 77, 76)),
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
              //btn pay produit
              child: TextButton.icon(
                style: const ButtonStyle(
                    iconColor: MaterialStatePropertyAll(Colors.black),
                    backgroundColor: MaterialStatePropertyAll(Colors.teal)),
                //logique de paiement
                onPressed: () async {
                  firestore.collection('achat').add({
                    'produitid': 'produit/${productModel.id}',
                    'userid': 'profil/${fireAuth.currentUser!.uid}'
                  }).then(
                    (value) => ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                          content: Text("Paiement Effectuer"),
                          backgroundColor: Colors.green),
                    ),
                  );
                },
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
            IconButton(
                onPressed: () async {
                  final achat = firestore.collection('achat');
                  final produit = firestore.collection('produit');
                  final profil = firestore.collection('produit');
                  final query = await achat
                      .where('produitid', isEqualTo: produit.id)
                      .where('produitid', isEqualTo: profil.id)
                      .get();
                  print(query);
                },
                icon: const Icon(Icons.apple, color: Colors.black))
          ],
        ),
      ),
    );
  }
}
