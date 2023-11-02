import 'package:ecommerce_ui/controller/network_connection_handling/network_connection_handling.dart';
import 'package:ecommerce_ui/widgets/buttons/buttons.dart';
import 'package:flutter/material.dart';

class ScreenNoInternet extends StatefulWidget {
  const ScreenNoInternet({super.key});

  @override
  State<ScreenNoInternet> createState() => _ScreenNoInternetState();
}

class _ScreenNoInternetState extends State<ScreenNoInternet> {
  @override
  void initState() {
    InternetConnectionActivity.stopTimer();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              Icons.signal_wifi_off, // You can use any icon you prefer
              size: 96.0,
              color: Colors.red,
            ),
            const SizedBox(height: 16.0),
            const Text(
              'No Internet Connection',
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8.0),
            const Text(
              'Please check your internet connection and try again.',
              style: TextStyle(
                fontSize: 16.0,
                color: Colors.grey,
              ),
            ),
            const SizedBox(height: 16.0),
            KButtons.elevatedButton(
              text: 'Retry',
              borderRadius: 10,
              width: 20,
              height: 10,
              onPressed: () => InternetConnectionActivity.initialNavigation(),
            )
          ],
        ),
      ),
    );
  }
}
