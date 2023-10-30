import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

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
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          width: 80.w,
          child: TextFormField(
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
                borderSide: BorderSide(color: Colors.black),
              ),
              suffixIcon: IconButton(
                onPressed: () {
                  // Handle barcode reader button press here.
                },
                icon: const Icon(Icons.barcode_reader),
              ),
            ),
          ),
        ),
        const SizedBox(width: 6),
        Container(
          width: 50,
          height: 55,
          decoration: BoxDecoration(
            color: Colors.blue,
            borderRadius: BorderRadius.circular(5),
          ),
          child: const Icon(
            Icons.search,
            color: Colors.white,
          ),
        ),
      ],
    );
  }
}
