import 'package:e_commerce/models/product_model.dart';
import 'package:e_commerce/services/product.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  var productList = <Product>[].obs;

  getProducts() async {
    var products = await ProductService.getProducts();
    print(products);
    if (products != null) {
      productList.value = products;
      print(products.length);
    }
  }

  @override
  void onInit() {
    print(onInit);
    getProducts();
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }
}
