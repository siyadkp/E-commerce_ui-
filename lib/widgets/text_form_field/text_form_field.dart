import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class TextFormFieldWidget extends StatelessWidget {
  const TextFormFieldWidget(
      {Key? key,
      required this.title,
      required this.hintText,
      required this.controller,
      this.keyboardType = TextInputType.name})
      : super(key: key);

  final String title;
  final String hintText;
  final TextEditingController controller;
  final TextInputType keyboardType;
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
            child: TextFormField(
              controller: controller,
              keyboardType: keyboardType,
              maxLength: 10,
              maxLines: 1,
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
                  borderSide: BorderSide.none,
                ),
              ),
              validator: (value) {
                String userData = value!.trim();
                if (title == 'User name') {
                  if (userData.isEmpty) {
                    return 'User name is empty';
                  }
                } else {
                  if (userData.isEmpty) {
                    return 'Phone number is empty';
                  } else if (userData.length < 10) {
                    return 'This phone number is not valied';
                  }
                }
              },
            ),
          ),
          const SizedBox(
            height: 10,
          )
        ],
      ),
    );
  }
}
