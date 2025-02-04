import 'dart:developer';
import 'dart:io';
import 'package:google_mlkit_text_recognition/google_mlkit_text_recognition.dart';

class TextRecognizerService {
  final TextRecognizer _textRecognizer = TextRecognizer();

  Future<String?> recognizeExpiryDateFromImage(File imageFile) async {
    final inputImage = InputImage.fromFile(imageFile);
    final RecognizedText recognizedText =
        await _textRecognizer.processImage(inputImage);

    String? expiryDate;

    final regex = RegExp(
      r'\b(?:EXPIRY\s*DATE|EXP|exp|Expiry\s*Date|Exp\.\s*Date)[:\s-]*' // Match "EXPIRY DATE", "EXP", "exp", "Expiry Date", or "Exp. Date"
      r'(\d{2}[-/.]\d{2}[-/.]\d{2,4}|\d{4}[-/.]\d{2}[-/.]\d{2}|\d{2}[-/.]\d{4}|\d{2}[-/.]\d{2})\b',
      caseSensitive: false,
    );

    for (TextBlock block in recognizedText.blocks) {
      for (TextLine line in block.lines) {
        log(line.text);
        final match = regex.firstMatch(line.text);
        if (match != null) {
          expiryDate = match.group(1); // Extract only the date part
          break;
        }
      }
    }

    return expiryDate;
  }
}
