import 'package:get/get.dart';
import '../../../model/product_model/product_model.dart';

class CartController extends GetxController {
  final cartProducts = <String, ProductModel>{};
  double totalAmount = 0;

  // Check if a product with a given key is already in the cart
  containsCartProduct(String key) {
    if (cartProducts.isNotEmpty && cartProducts.containsKey(key)) {
      return true;
    }
    return false;
  }

  // Add a product to the cart
  Future<void> addToCart(ProductModel productData) async {
    final key = productData.barcodeNumber;
    if (cartProducts.containsKey(key)) {
      cartProducts[key]!.inCartQty++;
    } else {
      final updatedProductData = ProductModel(
          image: productData.image,
          productName: productData.productName,
          qty: productData.qty,
          price: productData.price,
          barcodeNumber: productData.barcodeNumber,
          inCartQty: 1);
      cartProducts.putIfAbsent(key, () => updatedProductData);
    }
    totalAmountCalculator(productData, isAdded: true);
    update();
  }

  // Calculate the total amount in the cart
  totalAmountCalculator(ProductModel productData, {bool isAdded = false}) {
    double productPrice = productData.price;
    double originalValue;
    if (isAdded) {
      originalValue = totalAmount + productPrice;
    } else {
      originalValue = totalAmount - productPrice;
    }
    totalAmount = double.parse(originalValue.toStringAsFixed(2));
    update();
  }

  // Clear the cart and reset the total amount
  cartClearing() {
    cartProducts.clear();
    totalAmount = 0;
    update();
  }

  // Remove a product from the cart
  Future<void> removeFromCart(ProductModel productData) async {
    final key = productData.barcodeNumber;
    if (cartProducts[key]!.inCartQty <= 1) {
      cartProducts.remove(key);
    } else {
      cartProducts[key]!.inCartQty--;
    }
    totalAmountCalculator(productData);
    update();
  }
}
