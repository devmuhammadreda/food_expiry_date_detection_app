import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../core/services/flutter_scalable_ocr/flutter_scalable_ocr.dart';
import '../controllers/ocr_screen_controller.dart';

class OcrScreenView extends GetView<OcrScreenController> {
  const OcrScreenView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Scan Product Expiry Date'),
        centerTitle: true,
      ),
      body: GetBuilder<OcrScreenController>(
        builder: (controller) {
          if (controller.loading == false) {
            return Stack(
              fit: StackFit.expand,
              children: [
                ScalableOCR(
                  key: controller.cameraKey,
                  torchOn: false,
                  cameraSelection: 0,
                  lockCamera: true,
                  paintboxCustom: Paint()
                    ..style = PaintingStyle.stroke
                    ..strokeWidth = 4.0
                    ..color = const Color.fromARGB(153, 102, 160, 241),
                  boxLeftOff: 5,
                  boxBottomOff: 2.5,
                  boxRightOff: 5,
                  boxTopOff: 2.5,
                  boxHeight: MediaQuery.of(context).size.height,
                  getRawData: (value) {
                    inspect(value);
                  },
                  getScannedText: (value) {
                    controller.setText(value);
                    controller.extractExpiryDate(value); // Process scanned text
                  },
                ),
                StreamBuilder<String>(
                  stream: controller.controller.stream,
                  builder:
                      (BuildContext context, AsyncSnapshot<String> snapshot) {
                    return Result(
                      text: snapshot.data != null ? snapshot.data! : "",
                      expiryDate: controller.expiryDate, // Pass expiry date
                    );
                  },
                ),
              ],
            );
          } else {
            return Padding(
              padding: const EdgeInsets.all(17.0),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                ),
                height: MediaQuery.of(context).size.height / 3,
                width: MediaQuery.of(context).size.width,
                child: const Center(
                  child: CircularProgressIndicator(),
                ),
              ),
            );
          }
        },
      ),
    );
  }
}

class Result extends StatelessWidget {
  const Result({
    Key? key,
    required this.text,
    required this.expiryDate,
  }) : super(key: key);

  final String text;
  final String? expiryDate;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text("Scanned text: $text"),
        if (expiryDate != null)
          Text(
            "Expiry Date: $expiryDate",
            style: TextStyle(color: Colors.green, fontWeight: FontWeight.bold),
          ),
        if (expiryDate == null)
          Text(
            "No expiry date found.",
            style: TextStyle(color: Colors.red),
          ),
      ],
    );
  }
}
