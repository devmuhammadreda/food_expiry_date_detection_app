import 'dart:developer';

import 'package:get/get.dart';
import '../../../../core/enums/enums.dart';
import '../../../../core/global/strings.dart';
import '../../../../core/global/uid.dart';
import '../../../../core/services/recognizer/interface/text_recognizer.dart';
import '../../../../core/services/recognizer/mlkit_text_recognizer.dart';
import '../../../data/data_source/scan_log_local_data_source.dart';
import '../../../data/models/recognition_response.dart';
import '../../../data/models/scan_log_model.dart';

class OcrScreenController extends GetxController {
  late final ITextRecognizer recognizer;
  RecognitionResponse? response;
  String? imagePath;
  bool isProcessing = false;
  ProductExpiryStatus? expiryStatus;
  @override
  void onInit() {
    super.onInit();
    imagePath = Get.arguments["image_path"] as String?;
    recognizer = MLKitTextRecognizer();
  }

  @override
  void onReady() {
    super.onReady();
    if (imagePath != null) {
      processImage(imagePath!);
    }
  }

  Future<void> _addProductLog(String expirationDate) async {
    await ScanLogLocalDataSource().addScanLog(
      ScanLogModel(
        productName: "Unknown product",
        expiryDate: expirationDate,
        expiryStatus: getProductExpiryStatus(expiryDate: expirationDate),
        scanType: ScanType.detectImage,
        uid: generateUid(),
      ),
    );
  }

  Future<void> processImage(String imgPath) async {
    if (isProcessing) return;

    isProcessing = true;
    response = null;
    update();

    final recognizedText = await recognizer.processImage(imgPath);
    log("🔍 OCR Extracted Text:\n$recognizedText");
    String? res = extractExpiryDates(recognizedText);
    if (res != null) {
      await _addProductLog(res);
      expiryStatus = getProductExpiryStatus(expiryDate: res);
    } else {
      expiryStatus = ProductExpiryStatus.unknown;
    }
    response = RecognitionResponse(
      imgPath: imgPath,
      recognizedText: recognizedText,
    );
    isProcessing = false;
    update();
  }

  @override
  void onClose() {
    if (recognizer is MLKitTextRecognizer) {
      (recognizer as MLKitTextRecognizer).dispose();
    }
    super.onClose();
  }
}
