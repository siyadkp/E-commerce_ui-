import 'package:ecommerce_ui/routes/routes.dart';
import 'package:ecommerce_ui/view/splash/screen_splash.dart';
import 'package:flutter/material.dart';

class ScreeNoInternet extends StatelessWidget {
  const ScreeNoInternet({super.key});

  @override
  Widget build(BuildContext context) {
    final ScreenSplash splash = ScreenSplash();
    return Scaffold(
      appBar: AppBar(
        title: const Text('No Internet Connection'),
      ),
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
            ElevatedButton(
              onPressed: () {
                AppRoutes.initialNavigation();
              },
              child: const Text('Retry'),
            ),
          ],
        ),
      ),
    );
  }
}
