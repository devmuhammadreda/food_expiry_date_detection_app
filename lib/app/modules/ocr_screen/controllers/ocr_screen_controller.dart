import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/services/flutter_scalable_ocr/flutter_scalable_ocr.dart';

class OcrScreenController extends GetxController {
  final StreamController<String> controller = StreamController<String>();
  bool loading = false;
  GlobalKey<ScalableOCRState> cameraKey = GlobalKey<ScalableOCRState>();

  void setText(value) {
    controller.add(value);
  }

  @override
  void onInit() {
    cameraKey.currentState?.zoomLevel = 0;
    super.onInit();
  }

  @override
  void dispose() {
    controller.close();
    super.dispose();
  }

  String? expiryDate;
  void extractExpiryDate(String text) {
    // Example regex to find dates (simple format matching)
    RegExp exp = RegExp(r'\b(\d{1,2})/(\d{2,4})\b');
    final match = exp.firstMatch(text);

    if (match != null) {
      // Format found expiry date as MM/YYYY
      expiryDate = "${match.group(1)}/${match.group(2)}";
    } else {
      expiryDate = null;
    }
    update(); // Update the UI with the extracted expiry date
  }
}
