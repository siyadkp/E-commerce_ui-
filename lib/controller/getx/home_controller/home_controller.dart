import 'package:ecommerce_ui/controller/database_functions/product_db_functions/product_db_functions.dart';
import 'package:ecommerce_ui/controller/product_api/product_api.dart';
import 'package:ecommerce_ui/model/product_model/product_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../barcode_scanner_functions/barcode_scanner_functions.dart';

class HomeController extends GetxController {
  final searchBarTextEditingController = TextEditingController();
  RxList<ProductModel> productDatas = RxList<ProductModel>();

  // Method to retrieve all product data from the API
  Future<void> getAllProductDataFromApi() async {
    productDatas.clear();

    // Check if product data is available in the local database
    productDatas.addAll(await ProductDB.getAllProductDatas());

    if (productDatas.isEmpty) {
      // If no data is available in the local database, fetch from the API
      productDatas.addAll(await ProductApi.fetchProductsFromApi());

      // Insert the fetched data into the local database
      ProductDB.insertProductDatas(productDatas);

      // Fetch the data from the local database
      productDatas.addAll(await ProductDB.getAllProductDatas());
    }

    // Notify listeners to update the UI
    update();
  }

  Future<void> scanBarcode() async {
    searchBarTextEditingController.text = await BarcodeScanner.scanBarcode();
    update();
  }

  // Method to find product data with a barcode number
  Future<void> findProductDataWithBarcodeNumber() async {
    productDatas.clear();

    if (searchBarTextEditingController.text.isNotEmpty) {
      // Search for product data in the local database
      final productData = ProductDB.findProductDataWithBarcodeNumber(
        searchBarTextEditingController.text,
      );

      if (productData != null) {
        // Add the found product data to the list
        productDatas.add(productData);
      }
    }
    // Notify listeners to update the UI
    update();
  }
}
