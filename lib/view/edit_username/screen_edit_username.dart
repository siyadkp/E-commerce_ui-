import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import '../../widgets/buttons/buttons.dart';
import '../../widgets/text_form_field/text_form_field.dart';

class ScreenEditUserProfile extends StatelessWidget {
  const ScreenEditUserProfile({super.key});

  // Private method to build the header section
  Widget _buildHeader() {
    return const Text(
      'Edit Profile',
      style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
    );
  }

  // Private method to build the content section
  Widget _buildContent() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _buildHeader(),
        SizedBox(
          height: 6.h,
        ),
        const TextFormFieldStyle(
          title: 'User name',
          hintText: 'Enter your username',
        ),
        const TextFormFieldStyle(
          title: 'Phone number',
          hintText: 'Enter your Phone number',
        ),
        SizedBox(
          height: 6.h,
        ),
        KButtons.elevatedButton(
          text: 'Update',
          onPressed: () {},
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildContent(),
    );
  }
}
