import 'package:intl/intl.dart';

DateTime? parseExpiryDate(String expiryDate) {
  List<String> dateFormats = [
    'yyyy-MM-dd', // Example: 2025-02-03
    'MM/dd/yyyy', // Example: 02/03/2025
    'dd/MM/yyyy', // Example: 03/02/2025
    'yyyy-MM-dd HH:mm:ss', // Example: 2025-02-03 14:30:00
    'MMM dd, yyyy', // Example: Feb 03, 2025
    'MMMM dd, yyyy', // Example: February 03, 2025
    'MM/dd/yyyy HH:mm', // Example: 02/03/2025 14:30
    'yyyy/MM/dd', // Example: 2025/02/03
    'dd-MMM-yyyy', // Example: 03-Feb-2025
    'yyyy-MM-ddTHH:mm:ss', // Example: 2025-02-03T14:30:00
    'dd/MM/yyyy HH:mm', // Example: 03/02/2025 14:30
    'EEE, MMM d, yyyy', // Example: Sat, Feb 3, 2025
    'MM-dd-yyyy', // Example: 02-03-2025
    'yyyy/MM/dd HH:mm', // Example: 2025/02/03 14:30
  ];

  for (var format in dateFormats) {
    try {
      DateFormat dateFormat = DateFormat(format);
      return dateFormat
          .parse(expiryDate); // Return DateTime object if parsing succeeds
    } catch (e) {
      // Continue to the next format if parsing fails
    }
  }

  return null; // Return null if no formats match
}
