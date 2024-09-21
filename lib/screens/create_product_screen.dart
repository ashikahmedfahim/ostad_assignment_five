import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ostad_assignment_five/models/product.dart';
import 'package:ostad_assignment_five/screens/home_screen.dart';
import 'package:ostad_assignment_five/services/apis/product_services.dart';

class CreateProductScreen extends StatefulWidget {
  const CreateProductScreen({super.key});

  @override
  State<CreateProductScreen> createState() => _CreateProductScreenState();
}

class _CreateProductScreenState extends State<CreateProductScreen> {
  TextEditingController nameTEController = TextEditingController();
  TextEditingController codeTEController = TextEditingController();
  TextEditingController priceTEController = TextEditingController();

  void createProduct(Map<String, dynamic> product) {
    ProductServices ps = ProductServices();
    ps.createProduct(product);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
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
                          createProduct({
                            "ProductName": nameTEController.text,
                            "ProductCode": codeTEController.text,
                            "UnitPrice": priceTEController.text,
                          });
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
