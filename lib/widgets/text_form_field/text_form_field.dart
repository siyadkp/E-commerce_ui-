import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class TextFormFieldStyle extends StatelessWidget {
  const TextFormFieldStyle({
    Key? key,
    required this.title,
    required this.hintText,
    this.isMaxLines = false,
  }) : super(key: key);

  final String title;
  final String hintText;
  final bool isMaxLines;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Display the title with a custom style.
          Text(
            title,
            style: const TextStyle(fontWeight: FontWeight.w600),
          ),
          SizedBox(
            width: 85.w,
            height: isMaxLines ? 35.w : 14.w,
            child: TextFormField(
              maxLines: isMaxLines ? 4 : 1,
              decoration: InputDecoration(
                hintText: hintText,
                hintStyle: const TextStyle(
                  fontWeight: FontWeight.normal,
                  fontSize: 15,
                ),
                fillColor: Colors.grey[200],
                filled: true,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(25.0),
                  borderSide: BorderSide.none, // Remove the border
                ),
              ),
              validator: (value) {},
            ),
          ),
          SizedBox(
            height: 3.h,
          )
        ],
      ),
    );
  }
}
