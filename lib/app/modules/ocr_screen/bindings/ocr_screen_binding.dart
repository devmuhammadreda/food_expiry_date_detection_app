import 'package:get/get.dart';

import '../controllers/ocr_screen_controller.dart';

class OcrScreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<OcrScreenController>(
      () => OcrScreenController(),
    );
  }
}
