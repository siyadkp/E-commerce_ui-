import 'package:flutter/material.dart';
import '../../widgets/product_widget/product_widget.dart';

class ScreenPayment extends StatelessWidget {
  const ScreenPayment({Key? key}) : super(key: key);

  // Builds the AppBar widget
  AppBar _buildAppBar() {
    return AppBar(
      backgroundColor: Colors.white,
      iconTheme: const IconThemeData(color: Colors.black),
      elevation: 0,
    );
  }

  // Builds the checkout header section
  Widget _buildCheckoutHeader() {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Checkout',
          style: TextStyle(fontSize: 25, fontWeight: FontWeight.w500),
        ),
        Text(
          '2 Items',
          style: TextStyle(fontSize: 15),
        ),
        Divider(
          thickness: 1,
        ),
      ],
    );
  }

  // Builds the product list section
  Widget _buildProductList() {
    return Column(
      children: List.generate(2, (index) => const ProductWidget()),
    );
  }

  // Builds the total amount section
  Widget _buildTotalAmount() {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Text(
          'Total',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
        ),
        Text(
          '200',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
        ),
      ],
    );
  }

  // Builds the payment button
  Widget _buildPaymentButton() {
    return Padding(
      padding: const EdgeInsets.only(top: 40, left: 10, right: 10),
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
          onPressed: () {},
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
      appBar: _buildAppBar(),
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 18),
          children: <Widget>[
            _buildCheckoutHeader(),
            _buildProductList(),
            const Divider(thickness: 1),
            _buildTotalAmount(),
            _buildPaymentButton(),
          ],
        ),
      ),
    );
  }
}
