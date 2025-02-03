import 'dart:io';
import 'package:google_mlkit_text_recognition/google_mlkit_text_recognition.dart';

class TextRecognizerService {
  final TextRecognizer _textRecognizer = TextRecognizer();

  Future<String?> recognizeExpiryDateFromImage(File imageFile) async {
    final inputImage = InputImage.fromFile(imageFile);
    final RecognizedText recognizedText =
        await _textRecognizer.processImage(inputImage);

    String? expiryDate;
    final regex = RegExp(r'\b(0[1-9]|1[0-2])/(0[1-9]|[12]\d|3[01])/\d{2,4}\b');

    for (TextBlock block in recognizedText.blocks) {
      for (TextLine line in block.lines) {
        if (regex.hasMatch(line.text)) {
          expiryDate = regex.firstMatch(line.text)?.group(0);
          break;
        }
      }
    }

    return expiryDate;
  }
}
