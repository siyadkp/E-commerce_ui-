import 'package:ecommerce_ui/controller/getx/cart_controller/cart_controller.dart';
import 'package:ecommerce_ui/controller/getx/user_controller/user_controller.dart';
import 'package:ecommerce_ui/routes/routes.dart';
import 'package:ecommerce_ui/widgets/product_widget/product_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';
import 'package:sizer/sizer.dart';

import '../../controller/razorpay_payment_gateway/razorpay_payment_gateway.dart';
import '../../model/product_model/product_model.dart';
import '../../widgets/custom_appbar/custom_appBar.dart';

// ignore: must_be_immutable
class ScreenPayment extends StatelessWidget {
  ScreenPayment({Key? key}) : super(key: key);

  final _razorpay = Razorpay();
  double redeemedRewardPointes = 0;
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  // Handle successful payment -------------------------------------------------
  void _handlePaymentSuccess(PaymentSuccessResponse response) {
    final userController = Get.find<UserController>();
    final cartController = Get.find<CartController>();

    // Clear the cart and update user's reward points and update qty -----------
    cartController.paymentSuceess();
    userController.updateUserRewardPoints(redeemedRewardPointes);
    ScaffoldMessenger.of(_scaffoldKey.currentContext!).showSnackBar(
      const SnackBar(
        content: Text('Payment was successful!'),
      ),
    );
    // Navigate back to the item scanning screen -------------------------------
    Get.offNamedUntil(AppRoutes.itemScanning, (route) => false);
  }

  // Handle payment failure
  void _handlePaymentError(PaymentFailureResponse response) {
    ScaffoldMessenger.of(_scaffoldKey.currentContext!).showSnackBar(
      const SnackBar(
        content: Text('Payment failed. Please try again later.'),
      ),
    );
  }

  // Handle payment through an external wallet ---------------------------------
  void _handleExternalWallet(ExternalWalletResponse response) {}

  // Initiate the RazorPay payment process -------------------------------------
  void razorPay(double amount) {
    final razorpayPaymentGateway = RazorpayPaymentGateway();

    // Calculate the total amount after deducting redeemed reward points -------
    double totalAmount = amount - redeemedRewardPointes;

    // Convert the total amount to paisa (10000 for ₹100) ----------------------
    int payAmountInPaisa = (totalAmount * 100).toInt();

    var options = {
      'key': razorpayPaymentGateway.getkey(),
      'amount': payAmountInPaisa,
      'name': 'E-Mart',
      'description': 'Payment for the product',
    };

    try {
      _razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, _handlePaymentSuccess);
      _razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, _handlePaymentError);
      _razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, _handleExternalWallet);
      _razorpay.open(options);
    } catch (e) {
      // Handle any exceptions or errors that may occur during the payment process.
    }
  }

  // Builds the checkout header section ----------------------------------------
  Widget _buildCheckoutHeader(String items) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: GestureDetector(
              onTap: () => Get.back(), child: const Icon(Icons.arrow_back)),
        ),
        const Text(
          'Checkout',
          style: TextStyle(fontSize: 25, fontWeight: FontWeight.w500),
        ),
        Text(
          '$items Items',
          style: const TextStyle(fontSize: 15),
        ),
      ],
    );
  }

  // Builds the list of products in the cart -----------------------------------
  Widget _buildProductList(List<ProductModel> cartProducts) {
    return Column(
      children: List.generate(cartProducts.length, (index) {
        return ProductWidget(productData: cartProducts[index]);
      }),
    );
  }

  // Builds the total amount section and handles reward points -----------------
  Widget _buildTotalAmount({required double amount}) {
    double haifOftheAmount = amount / 2;
    double totalAmount = 0;
    if (userRewardPointes >= haifOftheAmount) {
      totalAmount = amount - haifOftheAmount;
      redeemedRewardPointes = haifOftheAmount;
    } else {
      totalAmount = amount - userRewardPointes;
      redeemedRewardPointes = userRewardPointes;
    }
    redeemedRewardPointes = double.parse(totalAmount.toStringAsFixed(2));
    totalAmount = double.parse(totalAmount.toStringAsFixed(2));
    return Column(children: [
      Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        const Text(
          'Amount',
          style: TextStyle(fontSize: 17),
        ),
        Text(
          amount.toString(),
          style: const TextStyle(fontSize: 17),
        ),
      ]),
      const SizedBox(
        height: 5,
      ),
      Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        Text(
          'Discount: ${redeemedRewardPointes.toString()} (-${redeemedRewardPointes.toString()} points)',
          style: const TextStyle(
            fontSize: 16,
          ),
        ),
        Text(
          redeemedRewardPointes.toString(),
          style: const TextStyle(
            fontSize: 16,
          ),
        ),
      ]),
      const SizedBox(
        height: 5,
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text(
            'Total',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
          ),
          Text(
            totalAmount.toString(),
            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
          ),
        ],
      )
    ]);
  }

  // Builds the payment button -------------------------------------------------
  Widget _buildPaymentButton(double totalAmount, context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 10,
        vertical: 40,
      ),
      child: SizedBox(
        height: 50,
        child: ElevatedButton(
          style: ButtonStyle(
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(25.0),
              ),
            ),
            backgroundColor: MaterialStateProperty.all(Colors.green),
          ),
          onPressed: () {
            razorPay(totalAmount);
          },
          child: const Text(
            'Pay Now',
            style: TextStyle(
              color: Color.fromARGB(255, 255, 255, 255),
              fontSize: 15,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: customAppBar(),
      body: SafeArea(
        child: GetBuilder<CartController>(
          builder: (cartController) {
            if (cartController.cartProducts.isEmpty) {
              return ListView(
                padding: const EdgeInsets.symmetric(horizontal: 18),
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: GestureDetector(
                      onTap: () => Get.back(),
                      child: const Icon(Icons.arrow_back),
                    ),
                  ),
                  const Text(
                    'Checkout',
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.w500),
                  ),
                  SizedBox(
                    height: 35.h,
                  ),
                  const Center(
                    child: Text(
                      'No Items in Your Cart',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.grey,
                      ),
                    ),
                  )
                ],
              );
            }
            return ListView(
              padding: const EdgeInsets.symmetric(horizontal: 18),
              children: [
                _buildCheckoutHeader(
                    cartController.cartProducts.length.toString()),
                const Divider(
                  thickness: 1,
                ),
                _buildProductList(cartController.cartProducts.values.toList()),
                const Divider(thickness: 1),
                _buildTotalAmount(amount: cartController.totalAmount),
                _buildPaymentButton(
                  cartController.totalAmount,
                  context,
                )
              ],
            );
          },
        ),
      ),
    );
  }
}
