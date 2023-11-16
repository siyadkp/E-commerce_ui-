import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controller/getx/cart_controller/cart_controller.dart';
import '../../../controller/getx/home_controller/home_controller.dart';
import '../../../widgets/buttons/buttons.dart';
import '../../../widgets/product_widget/product_widget.dart';
import '../../../widgets/search_bar/search_bar.dart';
import '../../payment/screen_payment.dart';

class ProductListViewBuilder extends StatelessWidget {
  const ProductListViewBuilder({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: [
          const SizedBox(
            height: 10,
          ),
          const SearchBarWithButtonsWidget(
            hintText: 'Enter your barcode and find your product',
          ),
          Expanded(
            child: Stack(
              children: [
                GetBuilder<HomeController>(
                  builder: (homeController) {
                    return GetBuilder<CartController>(
                      builder: (cartController) {
                        if (homeController.productDatas.isEmpty) {
                          return const Center(
                              child: Text(
                            'No Products Found',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.grey,
                            ),
                          ));
                        }
                        return NotificationListener<
                            OverscrollIndicatorNotification>(
                          onNotification: (overscroll) {
                            overscroll.disallowIndicator();
                            return true;
                          },
                          child: ListView.separated(
                            physics: const ClampingScrollPhysics(),
                            padding: const EdgeInsets.all(10),
                            itemBuilder: (context, index) => ProductWidget(
                                productData:
                                    homeController.productDatas[index]),
                            separatorBuilder: (context, index) =>
                                const SizedBox(
                              height: 10,
                            ),
                            itemCount: homeController.productDatas.length,
                          ),
                        );
                      },
                    );
                  },
                ),
                GetBuilder<CartController>(builder: (cartController) {
                  return Visibility(
                    visible: cartController.cartProducts.isNotEmpty,
                    child: Align(
                      alignment: Alignment.bottomCenter,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: KButtons.elevatedButton(
                          text: 'Check Out',
                          icon: const Icon(Icons.shopping_cart_outlined),
                          width: 15,
                          height: 14,
                          borderRadius: 12,
                          onPressed: () => Get.to(ScreenPayment()),
                        ),
                      ),
                    ),
                  );
                }),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
