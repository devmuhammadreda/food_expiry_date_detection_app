import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../core/enums/enums.dart';
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
            return ImageWithScanningWidget(
              imagePath: controller.imagePath,
              isProcessing: controller.isProcessing,
              expiryStatus:
                  controller.expiryStatus ?? ProductExpiryStatus.unknown,
            );
          } else {
            return SizedBox();
          }
        },
      ),
    );
  }
}
