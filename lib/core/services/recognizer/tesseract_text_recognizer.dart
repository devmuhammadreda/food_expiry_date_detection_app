import 'dart:developer';

import 'package:flutter_tesseract_ocr/android_ios.dart';
import 'interface/text_recognizer.dart';

class TesseractTextRecognizer extends ITextRecognizer {
  @override
  Future<String> processImage(String imgPath) async {
    final res = await FlutterTesseractOcr.extractText(
      imgPath,
      language: "eng+ara",
      args: {
        "psm": "4",
        "preserve_interword_spaces": "1",
        "tessdata": "assets/tessdata",
      },
    );
    log(res);
    return res;
  }
}
