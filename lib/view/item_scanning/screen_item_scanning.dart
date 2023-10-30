import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:sizer/sizer.dart';
import '../../res/fonts/fonts.dart';
import '../../res/images/images.dart';
import '../../widgets/buttons/buttons.dart';
import '../../widgets/product_widget/product_widget.dart';
import '../../widgets/search_bar/search_bar.dart';
import '../payment/screen_payment.dart';

class ScreenItemScanning extends StatelessWidget {
  const ScreenItemScanning({super.key});

  // Private method to build the header section
  Widget _buildHeader() {
    return Container(
      height: 20.h,
      width: double.infinity,
      color: const Color.fromARGB(255, 39, 105, 42),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 10),
                child: Text(
                  'Muhammad Siyad',
                  style: KFonts.poppins(
                      color: Colors.white,
                      fontSize: 6.w,
                      fontWeight: FontWeight.w500),
                ),
              ),
              IconButton(
                onPressed: () {},
                padding: EdgeInsets.zero,
                icon: Icon(
                  Icons.account_circle_outlined,
                  color: Colors.white,
                  size: 8.w,
                ),
              ),
            ],
          ),
          SizedBox(
            height: 2.h,
          ),
          SizedBox(
            width: 120,
            child: Align(
              alignment: Alignment.centerRight,
              child: Text(
                'Reward points',
                style: KFonts.poppins(color: Colors.white, fontSize: 4.w),
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              LottieBuilder.asset(
                KImages.coinLottie,
                width: 40,
              ),
              Text(
                '100.00',
                style: KFonts.poppins(
                    color: Colors.white,
                    fontSize: 10.w,
                    fontWeight: FontWeight.w500),
              ),
            ],
          ),
        ],
      ),
    );
  }

  // Private method to build the content section
  Widget _buildContent() {
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
                    child: KButtons.elevatedButton(
                      text: 'Check Out',
                      width: 40,
                      height: 11,
                      borderRadius: 12,
                      onPressed: () => Get.to(const ScreenPayment()),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: SafeArea(
        child: Column(
          children: [
            _buildHeader(),
            _buildContent(),
          ],
        ),
      ),
    );
  }
}
