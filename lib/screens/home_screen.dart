import 'package:flutter/material.dart';
import 'package:ostad_assignment_five/screens/create_product_screen.dart';
import 'package:ostad_assignment_five/services/apis/product_services.dart';
import 'package:ostad_assignment_five/widgets/product_card.dart';

import '../models/product.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late List<Product> productList = [];
  bool isLoading = false;

  // Create an async function to fetch products
  void fetchProducts() async {
    setState(() {
      isLoading = true;
    });
    ProductServices ps = ProductServices();
    List<Product>? products = await ps.getProducts();
    setState(() {
      if (products != null) {
        productList = products;
      }
    });
    setState(() {
      isLoading = false;
    });
  }

  void deleteProduct(String id) {
    ProductServices ps = ProductServices();
    ps.deleteProduct(id);
    fetchProducts();
  }

  @override
  void initState() {
    fetchProducts();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('App'),
      ),
      body: Column(
        children: [
          ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const CreateProductScreen()));
              },
              child: const Text('Create new Post')),
          isLoading
              ? const Center(child: Padding(
                padding: EdgeInsets.all(48.0),
                child: CircularProgressIndicator(),
              ))
              : Expanded(
                  child: ListView.builder(
                    itemBuilder: (context, index) {
                      if (productList.isNotEmpty) {
                        return ProductCard(
                          product: productList[index],
                          deleteProduct: deleteProduct,
                        );
                      }
                      return null;
                    },
                    itemCount: productList.length,
                  ),
                ),
        ],
      ),
    );
  }
}
