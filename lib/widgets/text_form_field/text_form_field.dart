import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class TextFormFieldStyle extends StatelessWidget {
  const TextFormFieldStyle(
      {super.key,
      required this.title,
      required this.hintText,
      this.ismaxLines = false});

  final String title;
  final String hintText;
  final bool ismaxLines;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(fontWeight: FontWeight.w600),
          ),
          SizedBox(
            width: 85.w,
            height: ismaxLines ? 35.w : 14.w,
            child: TextFormField(
              maxLines: ismaxLines ? 4 : 1,
              decoration: InputDecoration(
                hintText: hintText,
                hintStyle: const TextStyle(
                    fontWeight: FontWeight.normal, fontSize: 15),
                fillColor: Colors.grey[200],
                filled: true,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(
                      25.0), // Adjust the radius as needed
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
