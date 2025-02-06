# Food Expiry Date Detection App

## Overview

This Flutter application is designed to scan food product packaging, extract the expiry date using Optical Character Recognition (OCR), and provide a visual indicator (Green, Yellow, Red) based on the expiry status. The app also includes features such as a countdown timer, local storage for scanned products, and optional AI-powered enhancements for better accuracy.

## Features

### Core Features

1. **Scan Expiry Date**:
   - Use Google ML Kit OCR or Tesseract OCR to detect and extract the expiry date from food packaging images.

2. **Status Indicator**:
   - Display expiry status based on the detected date:
     - **Green**: Safe to consume (More than 7 days left)
     - **Yellow**: Approaching expiry (Less than 7 days left)
     - **Red**: Expired

3. **Countdown Timer**:
   - Show the remaining days until expiry or how many days the product has been expired.

4. **History & Storage**:
   - Save scanned products and their expiry status locally using SQLite or Hive.

### Bonus Features

1. **AI-Powered Expiry Date Extraction**:
   - Use Google Vision API or OpenAI API to enhance text detection for better accuracy.

2. **Barcode Scanner Integration**:
   - Allow scanning product barcodes and fetching details using an open product database API (e.g., OpenFoodFacts API).

3. **Speech Output**:
   - Use Google Text-to-Speech (TTS) to read aloud the expiry status.

## Tech Stack

- **Flutter**: Latest version
- **State Management**: GetX
- **OCR**: Google ML Kit OCR
- **Local Storage**: SQLite / Hive
- **AI Enhancements**: OpenAI API
- **Speech Output**: Google TTS (Optional)

## Project Setup

### Dependencies

Add the following dependencies to your `pubspec.yaml` file:

```yaml
dependencies:
  flutter:
    sdk: flutter
  google_ml_kit: ^latest_version
  tesseract_ocr: ^latest_version
  hive: ^latest_version
  sqflite: ^latest_version
  http: ^latest_version
  google_tts: ^latest_version
```

### API Key Configuration

1. **Google Vision API**:
   - Obtain an API key from the Google Cloud Console.
   - Add the API key to your `android/app/src/main/AndroidManifest.xml` and `ios/Runner/Info.plist` files.

2. **OpenAI API**:
   - Obtain an API key from OpenAI.
   - Store the API key securely in your app, preferably using environment variables.

### Running the Project

1. Clone the repository:

   ```bash
   git clone https://github.com/devmuhammadreda/food-expiry-detection-app.git
   ```

2. Navigate to the project directory:

   ```bash
   cd food-expiry-detection-app
   ```

3. Install dependencies:

   ```bash
   flutter pub get
   ```

4. Run the app:

   ```bash
   flutter run
   ```

## Implementation Details

- **OCR Integration**: Implemented using Google ML Kit OCR for text extraction from images.
- **State Management**: Utilized GetX for efficient state management.
- **Local Storage**: Used SQLite or Hive to store scanned products and their expiry status.
- **AI Enhancements**: Integrated Google Vision API or OpenAI API for improved text detection accuracy.
- **Speech Output**: Optional feature using Google Text-to-Speech (TTS) for reading aloud the expiry status.

---

**Best regards**,  
Muhammad Reda  
Flutter Developer  
devmuhammadreda@gmail.com

---

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

---

## Contributing

Contributions are welcome! Please open an issue or submit a pull request for any improvements or bug fixes.

---

## Acknowledgments

- Thanks to Google ML Kit, Tesseract OCR, and OpenAI for providing the tools and APIs used in this project.
- Special thanks to Athar Infotech for the opportunity to work on this assignment.

---

**Happy Coding!** 🚀