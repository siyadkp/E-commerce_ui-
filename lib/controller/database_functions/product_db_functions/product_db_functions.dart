import 'package:ecommerce_ui/model/product_model/product_model.dart';
import 'package:hive/hive.dart'; // Import the Hive library for local data storage

// Define a class for managing product data using Hive
class ProductDB {
  static final productDB =
      Hive.box<ProductModel>('products'); // Define a Hive box for product data

  // Method to insert a list of product data into the Hive box
  static Future<void> insertProductDatas(List<ProductModel> productData) async {
    for (ProductModel element in productData) {
      productDB.put(element.barcodeNumber, element);
    }
  }

  // Method to update a specific product's data in the Hive box
  static Future<void> updateProductData(ProductModel productData) async {
    await productDB.put(productData.barcodeNumber, productData);
    // Note: The code "await getAllProductDatas();" doesn't seem necessary here.
  }

  // Method to retrieve all product data from the Hive box
  static Future<List<ProductModel>> getAllProductDatas() async {
    return productDB.values.toList();
  }

  // Method to find a specific product by its barcode number
  static ProductModel? findProductDataWithBarcodeNumber(String key) {
    return productDB.get(key);
  }
}
