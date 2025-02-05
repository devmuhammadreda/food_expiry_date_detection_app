import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/ocr_screen_controller.dart';
import '../widgets/image_with_scanning_widget.dart';

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
          if (controller.imagePath != null) {
            return Column(
              children: [
                ImageWithScanningWidget(
                  imagePath: controller.imagePath,
                  isProcessing: controller.isProcessing,
                ),
                SizedBox(height: 20),
                if (controller.response != null)
                  Text(controller.response?.recognizedText ?? ""),
              ],
            );
          } else {
            return SizedBox();
          }
        },
      ),
    );
  }
}
