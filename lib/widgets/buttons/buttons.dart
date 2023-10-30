import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class KButtons {
  // Elevated Button with custom properties.
  static SizedBox elevatedButton({
    required String text,
    required Function() onPressed,
    double borderRadius = 25,
    double width = 85,
    double height = 12,
  }) =>
      SizedBox(
        width: width.w,
        height: height.w,
        child: ElevatedButton(
          style: ButtonStyle(
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(borderRadius),
              ),
            ),
            backgroundColor: MaterialStateProperty.all(Colors.green),
          ),
          onPressed: onPressed,
          child: Text(
            text,
            style: const TextStyle(
              color: Color.fromARGB(255, 255, 255, 255),
              fontSize: 15,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      );

  // Outline Button with custom properties.
  static SizedBox outlineButton({
    required String text,
    required Function() onPressed,
    double width = 53,
    double height = 10,
  }) =>
      SizedBox(
        width: width.w,
        height: height.w,
        child: OutlinedButton(
          onPressed: onPressed,
          style: ButtonStyle(
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(25.0),
              ),
            ),
            side: MaterialStateProperty.all<BorderSide>(
              const BorderSide(
                color: Colors.green,
                width: 2.0,
              ),
            ),
          ),
          child: Text(
            text,
            style: const TextStyle(
              color: Colors.green,
            ),
          ),
        ),
      );
}
