import 'package:ecommerce_ui/controller/getx/home_controller/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../view/search_result/screen_search_result.dart';

class SearchBarWithButtonsWidget extends StatelessWidget {
  const SearchBarWithButtonsWidget({
    Key? key,
    required this.hintText,
    this.isMaxLines = false,
  }) : super(key: key);

  final String hintText;
  final bool isMaxLines;

  @override
  Widget build(BuildContext context) {
    final homeController = Get.put(HomeController());
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: TextField(
              controller: homeController.searchBarTextEditingController,
              decoration: InputDecoration(
                hintText: hintText,
                hintStyle: const TextStyle(
                  fontWeight: FontWeight.normal,
                  fontSize: 15,
                ),
                fillColor: Colors.grey[200],
                filled: true,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                  borderSide: const BorderSide(color: Colors.black),
                ),
                suffixIcon: IconButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const SearchResult(),
                        ));
                  },
                  icon: const Icon(Icons.barcode_reader),
                ),
              ),
              onChanged: (value) {
                if (value.isEmpty) {
                  homeController.getAllProductDataFromApi();
                } else {
                  homeController.findProductDataWithBarcodeNumber();
                }
              },
            ),
          ),
          const SizedBox(width: 6),
          GestureDetector(
            onTap: () async {
              await homeController.scanBarcode();
              homeController.findProductDataWithBarcodeNumber();
            },
            child: Container(
              width: 50,
              height: 55,
              decoration: BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.circular(5),
              ),
              child: const Icon(
                Icons.barcode_reader,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
