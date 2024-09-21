import 'package:flutter/material.dart';
import 'package:ostad_assignment_five/screens/home_screen.dart';
import 'package:ostad_assignment_five/services/apis/product_services.dart';

import '../models/product.dart';

class EditProductScreen extends StatefulWidget {
  const EditProductScreen({super.key, required this.product});

  final Product product;

  @override
  State<EditProductScreen> createState() => _EditProductScreenState();
}

class _EditProductScreenState extends State<EditProductScreen> {
  TextEditingController nameTEController = TextEditingController();
  TextEditingController codeTEController = TextEditingController();
  TextEditingController priceTEController = TextEditingController();

  void editProduct(Product product) {
    ProductServices ps = ProductServices();
    ps.editProduct(product);
  }

  @override
  void initState() {
    nameTEController.text = widget.product.productName;
    codeTEController.text = widget.product.productCode;
    priceTEController.text = widget.product.unitPrice;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('App'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              decoration: const InputDecoration(
                hintText: 'Enter product name',
              ),
              controller: nameTEController,
            ),
            TextField(
              decoration: const InputDecoration(
                hintText: 'Enter product code',
              ),
              controller: codeTEController,
            ),
            TextField(
              decoration: const InputDecoration(
                hintText: 'Enter product price',
              ),
              controller: priceTEController,
              keyboardType: TextInputType.number,
            ),
            Padding(
              padding: const EdgeInsets.all(48.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ElevatedButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: const Text('Back')),
                  ElevatedButton(
                      onPressed: () {
                        widget.product.productName = nameTEController.text;
                        widget.product.productCode = codeTEController.text;
                        widget.product.unitPrice = priceTEController.text;
                        editProduct(widget.product);
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => HomeScreen()));
                      },
                      child: const Text('Save')),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    nameTEController.dispose();
    codeTEController.dispose();
    priceTEController.dispose();
    super.dispose();
  }
}
