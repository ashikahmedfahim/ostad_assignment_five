import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart';
import 'package:ostad_assignment_five/models/product.dart';
import 'package:ostad_assignment_five/utils/constants.dart';

class ProductServices {
  Future<List<Product>?> getProducts() async {
    Uri uri = Uri.parse('${Constants.baseURl}/ReadProduct');
    Response response = await get(uri);
    if (response.statusCode == 200) {
      Map<String, dynamic> mp = json.decode(response.body);
      List<dynamic> productList = mp['data'];
      List<Product> products = productList.map((productMap) {
        return Product.fromJson(productMap as Map<String, dynamic>);
      }).toList();
      return products;
    }
    return null;
  }

  Future<void> createProduct(Map<String, dynamic> product) async {
    Uri uri = Uri.parse('${Constants.baseURl}/CreateProduct');
    Response response = await post(uri,
        body: jsonEncode(product), headers: {"content": "Application/json"});
    print(response.body);
  }

  Future<void> editProduct(Product product) async {
    Uri uri = Uri.parse('${Constants.baseURl}/UpdateProduct/${product.id}');
    Response response = await post(uri,
        body: jsonEncode(product), headers: {"content": "Application/json"});
    print(response.body);
  }

  Future<void> deleteProduct(String id) async {
    Uri uri = Uri.parse('${Constants.baseURl}/DeleteProduct/${id}');
    Response response = await get(uri);
  }
}
