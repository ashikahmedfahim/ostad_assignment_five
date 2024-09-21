import 'package:flutter/material.dart';
import 'package:ostad_assignment_five/screens/edit_product_screen.dart';

import '../models/product.dart';

class ProductCard extends StatelessWidget {
  const ProductCard(
      {super.key, required this.product, required this.deleteProduct});

  final Product product;
  final Function deleteProduct;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Text('Code: ${product.productCode}'),
      trailing: SizedBox(
        width: 100,
        child: Row(
          children: [
            IconButton(
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => EditProductScreen(
                        product: product,
                      ),
                    ),
                  );
                },
                icon: const Icon(Icons.edit)),
            IconButton(
                onPressed: () {
                  deleteProduct(product.id);
                },
                icon: const Icon(Icons.delete)),
          ],
        ),
      ),
      title: Text(product.productName),
      subtitle: Text(product.createdDate.toUtc().toString().substring(0, 10)),
    );
  }
}
