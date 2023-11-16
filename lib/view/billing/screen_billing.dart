import 'package:flutter/material.dart';

import '../../widgets/search_bar/search_bar.dart';

class ScreenBilling extends StatelessWidget {
  const ScreenBilling({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        body: SafeArea(
      child: SearchBarWithButtonsWidget(
        hintText: '',
      ),
    ));
  }
}
