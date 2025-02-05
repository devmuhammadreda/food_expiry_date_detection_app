import 'package:get/get.dart';

import '../../../../core/services/recognizer/interface/text_recognizer.dart';
import '../../../../core/services/recognizer/tesseract_text_recognizer.dart';
import '../../../data/models/recognition_response.dart';

class OcrScreenController extends GetxController {
  late ITextRecognizer recognizer;
  RecognitionResponse? response;
  String? imagePath;
  bool isProcessing = false;
  @override
  void onInit() {
    imagePath = Get.arguments["image_path"];
    recognizer = TesseractTextRecognizer();

    super.onInit();
  }

  @override
  void onReady() async {
    await processImage(imagePath!);
    super.onReady();
  }

  Future<void> processImage(String imgPath) async {
    imagePath = imgPath;
    isProcessing = true;
    response = null;
    update();
    final recognizedText = await recognizer.processImage(imgPath);
    response =
        RecognitionResponse(imgPath: imgPath, recognizedText: recognizedText);
    isProcessing = false;
    update();
  }
}
