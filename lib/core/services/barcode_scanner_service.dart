import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';

class BarcodeScannerService {
  // Scans the barcode and returns the result
  Future<String?> scanBarcode() async {
    // Start the barcode scanning process
    try {
      String result = await FlutterBarcodeScanner.scanBarcode(
        '#ff6666', // Custom color for the scanner's line
        'Cancel', // The button label for canceling the scan
        true, // Whether to show the flash button
        ScanMode
            .BARCODE, // You can change the scan mode (e.g., QR code, Barcode)
      );
      return result;
    } on Exception catch (e) {
      // Handle the exception
      print(e);
      return null;
    }
  }
}
