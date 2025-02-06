import 'dart:developer';

import 'package:intl/intl.dart';

import '../enums/enums.dart';

/// Extracts the expiry date from the recognized text.

String? extractExpiryDates(String text) {
  // Define the combined regex for different expiry date formats with more flexibility
  final expiryDateRegex = RegExp(
      r'\b(?:EXP|EXPIRY|Expiration|Use\s*By|Best\s*Before|Sell\s*By|MFG|Expires?|Expiry\s*Date)\s*[:\-\s]*\d{2}[/\.\-\s]?\d{2}[/\.\-\s]?\d{2,4}|\d{4}[/\.\-\s]?\d{2}[/\.\-\s]?\d{2}|\d{2}[/\.\-\s]?\d{2}[/\.\-\s]?\d{2,4}|\bEXP\d{2}[/\.\-\s]?\d{1,2}\d{2}\b');

  // Find the first match of the regular expression in the given text
  final match = expiryDateRegex.firstMatch(text);

  if (match != null) {
    final expiryDateString = match.group(0); // Get the whole match
    log("🛑 Expiry Date Found: $expiryDateString");

    // Try parsing the expiry date into a DateTime object
    try {
      final formattedDate = _parseExpiryDate(expiryDateString!);
      log("🛑 Valid Expiry Date: $formattedDate");
      return formattedDate?.toString(); // Return as a formatted string
    } catch (e) {
      log("🛑 Failed to parse expiry date: $e");
      return null;
    }
  } else {
    log("🛑 No expiry date found.");
    return null;
  }
}

// Helper method to format and parse expiry date
// Helper method to format and parse expiry date
DateTime? _parseExpiryDate(String expiryDateString) {
  // Remove non-digit characters (e.g., EXP, MFG, etc.) and trim spaces
  final cleanedDateString =
      expiryDateString.replaceAll(RegExp(r'\D'), '').trim();

  log("🛑 Cleaned Date String: $cleanedDateString");

  // Try to parse various formats (e.g., MM/yy, MM/yyyy, dd/MM/yyyy)
  try {
    // If the date format is `MM/yy` (e.g., 03/22)
    if (cleanedDateString.length == 4) {
      return DateFormat("MM/yy")
          .parse("01/$cleanedDateString"); // Assume the first day of the month
    }
    // If the date format is `yyyyMMdd` (e.g., 20230322)
    else if (cleanedDateString.length == 8) {
      return DateFormat("yyyyMMdd").parse(cleanedDateString);
    }
  } catch (e) {
    throw FormatException("Invalid expiry date format: $expiryDateString");
  }
  return null;
}

String getScanTypeAsString(ScanType scanType) {
  switch (scanType) {
    case ScanType.detectImage:
      return 'Detect Image';
    case ScanType.barcodeScan:
      return 'Barcode Scan';
  }
}

String productExpiryStatusToString(ProductExpiryStatus status) {
  switch (status) {
    case ProductExpiryStatus.approachingExpired:
      return 'Approaching expired';
    case ProductExpiryStatus.expired:
      return 'Expired';
    case ProductExpiryStatus.safe:
      return 'Safe';
    case ProductExpiryStatus.unknown:
      return 'Unknown';
  }
}
