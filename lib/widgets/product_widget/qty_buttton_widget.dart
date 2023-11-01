import 'package:ecommerce_ui/controller/getx/cart_controller/cart_controller.dart';
import 'package:ecommerce_ui/model/product_model/product_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class QtyButttonWidget extends StatelessWidget {
  const QtyButttonWidget({super.key, required this.productData});
  final ProductModel productData;
  @override
  Widget build(BuildContext context) {
    final cartController = Get.put(CartController());
    int cartProductQuantity =
        cartController.cartProducts[productData.barcodeNumber]!.inCartQty;
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        InkWell(
          onTap: () {
            if (cartProductQuantity <= 1) {
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    title: const Text('Delete Product'),
                    content: Text(
                        'Do you want to remove ${productData.productName} from your cart?'),
                    actions: [
                      TextButton(
                        child: const Text('Cancel'),
                        onPressed: () {
                          Get.back();
                        },
                      ),
                      TextButton(
                        child: const Text('OK'),
                        onPressed: () async {
                          await cartController.removeFromCart(productData);
                          Get.back();
                        },
                      )
                    ],
                  );
                },
              );
            } else {
              cartController.removeFromCart(productData);
            }
          },
          child: Container(
            decoration: BoxDecoration(
              color: Colors.blue,
              borderRadius: BorderRadius.circular(12),
            ),
            padding: const EdgeInsets.all(2),
            child: const Icon(Icons.remove, color: Colors.white, size: 16),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: Text(
            cartProductQuantity.toString(),
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
        ),
        InkWell(
          onTap: () {
            if (productData.qty <= cartProductQuantity) {
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    title: const Text('Quantity Limit Exceeded'),
                    content: Text(
                        'You cannot add more than the available quantity (${productData.qty} items).'),
                    actions: [
                      TextButton(
                        child: const Text('OK'),
                        onPressed: () async {
                          Get.back();
                        },
                      )
                    ],
                  );
                },
              );
            } else {
              cartController.addToCart(productData);
            }
          },
          child: Container(
            decoration: BoxDecoration(
              color: Colors.blue,
              borderRadius: BorderRadius.circular(12),
            ),
            padding: const EdgeInsets.all(2),
            child: const Icon(Icons.add, color: Colors.white, size: 16),
          ),
        ),
      ],
    );
  }
}
