import 'package:ecommerce_ui/view/payment/screen_payment.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import '../../widgets/product_widget/product_widget.dart';
import '../../widgets/search_bar/search_bar.dart';

class ScreenItemScanning extends StatelessWidget {
  const ScreenItemScanning({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: SafeArea(
        child: Column(
          children: [
            Stack(
              children: [
                Container(
                  height: 26.h,
                  width: double.infinity,
                  color: Colors.green,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Reward points',
                        style: TextStyle(color: Colors.white, fontSize: 4.w),
                      ),
                      Text(
                        '100.00',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 10.w,
                            fontWeight: FontWeight.w500),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'Muhammad Siyad',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 6.w,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            const SearchBarWithButtonsWidget(
              hintText: 'Enter your barcode and find your product',
            ),
            Expanded(
              child: Stack(
                children: [
                  ListView.separated(
                    padding: const EdgeInsets.all(10),
                    itemBuilder: (context, index) => const ProductWidget(),
                    separatorBuilder: (context, index) => const SizedBox(
                      height: 10,
                    ),
                    itemCount: 10,
                  ),
                  Align(
                    alignment: Alignment.bottomRight,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: SizedBox(
                        width: 110,
                        height: 40,
                        child: ElevatedButton(
                          style: ButtonStyle(
                            shape: MaterialStateProperty.all<
                                RoundedRectangleBorder>(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                            ),
                            backgroundColor: MaterialStateProperty.all(
                                const Color.fromARGB(231, 76, 175, 79)),
                          ),
                          onPressed: () {
                            Get.to(ScreenPayment());
                          },
                          child: const Text(
                            'Check Out',
                            style: TextStyle(
                                color: Color.fromARGB(255, 255, 255, 255),
                                fontSize: 15,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
