import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class SearchBarWithButtonsWidget extends StatelessWidget {
  const SearchBarWithButtonsWidget(
      {super.key, required this.hintText, this.ismaxLines = false});

  final String hintText;
  final bool ismaxLines;

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
              hintStyle:
                  const TextStyle(fontWeight: FontWeight.normal, fontSize: 15),
              fillColor: Colors.grey[200],
              filled: true,
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(
                      10.0), // Adjust the radius as needed
                  borderSide:
                      BorderSide(color: Colors.black) // Remove the border
                  ),
              suffixIcon: IconButton(
                  onPressed: () {}, icon: const Icon(Icons.barcode_reader)),
            ),
          ),
        ),
        const SizedBox(
          width: 4,
        ),
        Container(
          width: 50,
          height: 55,
          decoration: BoxDecoration(
              color: Colors.blue, borderRadius: BorderRadius.circular(5)),
          child: const Icon(
            Icons.search,
            color: Colors.white,
          ),
        )
      ],
    );
  }
}
