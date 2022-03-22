import 'package:dio/dio.dart';
import 'package:e_commerce/environment/environment.dart';
import 'package:e_commerce/models/product_model.dart';
import 'package:flutter/material.dart';

class ProductService {
  static var dio = Dio();
  static var url = BASE_URL;

  static Future<dynamic> getProducts() async {
    try {
      var response = await dio.get(url + 'products');
      if (response.statusCode == 200) {
        var json = response.data;
        final product = productFromJson(json);
        return product;
      } else {
        // Show error;
        return null!;
      }
    } catch (e) {
      debugPrint('e = ' + e.toString());
    }
  }
}
