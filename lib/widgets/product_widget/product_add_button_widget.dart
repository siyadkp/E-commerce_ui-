import 'package:ecommerce_ui/controller/getx/cart_controller/cart_controller.dart';
import 'package:ecommerce_ui/model/product_model/product_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductAddButtonWidget extends StatelessWidget {
  const ProductAddButtonWidget({super.key, required this.productData});
  final ProductModel productData;
  @override
  Widget build(BuildContext context) {
    CartController cartController = Get.put(CartController());
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        productData.qty <= 0
            ? const Text(
                'Out of stock',
                style: TextStyle(color: Colors.red),
              )
            : OutlinedButton(
                onPressed: () {
                  cartController.addToCart(productData);
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Your product added to cart'),
                    ),
                  );
                  Get.back();
                },
                style: ButtonStyle(
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                  ),
                  side: MaterialStateProperty.all<BorderSide>(
                    const BorderSide(
                      color: Colors.green,
                    ),
                  ),
                ),
                child: const Text('Add', style: TextStyle(color: Colors.green)),
              ),
      ],
    );
  }
}
