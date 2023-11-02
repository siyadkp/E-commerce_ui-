import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:permission_handler/permission_handler.dart';

class BarcodeScanner {
  static Future<PermissionStatus> requestCameraPermission() async =>
      await Permission.camera.request();

  static Future<String> scanBarcode() async {
    PermissionStatus status = await requestCameraPermission();

    if (status.isGranted) {
      String barcodeScanRes = await FlutterBarcodeScanner.scanBarcode(
        '#FF0000', 
        'Cancel', 
        true,
        ScanMode.BARCODE,
      );
      if (barcodeScanRes != '-1') {
        return barcodeScanRes;
      }
    }
    return '';
  }
}
