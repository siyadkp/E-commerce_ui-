import 'package:ecommerce_ui/controller/getx/cart_controller/cart_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import '../../model/product_model/product_model.dart';
import 'product_add_button_widget.dart';
import 'qty_buttton_widget.dart';

class ProductWidget extends StatelessWidget {
  const ProductWidget({Key? key, required this.productData}) : super(key: key);
  final ProductModel productData;

  @override
  Widget build(BuildContext context) {
    final cartController = Get.put(CartController());
    return Container(
      height: 120,
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Stack(
        children: [
          Row(children: [
            const SizedBox(width: 10),
            Container(
              height: 90,
              decoration: BoxDecoration(
                color: Colors.white, // Set the border color
                borderRadius: BorderRadius.circular(10),
                border: Border.all(
                  color: Colors.black, // Set the border color
                  width: 1, // Set the border width
                ),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.network(
                  productData.image,
                  width: 106,
                  height: 86,
                ),
              ),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(height: 10),
                  Text(
                    productData.productName,
                    style: TextStyle(
                      fontSize: 4.w,
                      fontWeight: FontWeight.bold,
                      overflow: TextOverflow.ellipsis,
                    ),
                    maxLines: 2,
                  ),
                  const SizedBox(height: 5),
                  Text(
                    'Qty: ${productData.qty}',
                    style: TextStyle(
                      fontSize: 4.w,
                      fontWeight: FontWeight.w500,
                      color: const Color.fromARGB(255, 176, 190, 197),
                    ),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    '\$${productData.price}',
                    style:
                        TextStyle(fontSize: 4.w, fontWeight: FontWeight.w500),
                  ),
                  const SizedBox(height: 5),
                ],
              ),
            ),
          ]),
          Padding(
            padding: const EdgeInsets.only(bottom: 10, right: 10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                if (cartController
                    .containsCartProduct(productData.barcodeNumber))
                  QtyButttonWidget(productData: productData)
                else
                  ProductAddButtonWidget(productData: productData)
              ],
            ),
          )
        ],
      ),
    );
  }
}
