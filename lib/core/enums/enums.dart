import 'package:flutter/material.dart';
import 'package:hive_ce/hive.dart';
import '../global/date_formate.dart';

part 'enums.g.dart'; // This file will be generated

@HiveType(typeId: 1) // Assign a unique typeId
enum ProductExpiryStatus {
  @HiveField(0)
  approachingExpired,

  @HiveField(1)
  expired,

  @HiveField(2)
  safe,

  @HiveField(3)
  unknown,
}

@HiveType(typeId: 2)
enum ScanType {
  @HiveField(0)
  detectImage,

  @HiveField(1)
  barcodeScan,
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

Color productExpiryStatusToColor(ProductExpiryStatus status) {
  switch (status) {
    case ProductExpiryStatus.approachingExpired:
      return Colors.yellow;
    case ProductExpiryStatus.expired:
      return Colors.red;
    case ProductExpiryStatus.safe:
      return Colors.green;
    case ProductExpiryStatus.unknown:
      return Colors.grey;
  }
}

ProductExpiryStatus getProductExpiryStatus({required String expiryDate}) {
  if (expiryDate.isEmpty) {
    return ProductExpiryStatus.unknown;
  }

  final now = DateTime.now();
  DateTime? expiry = parseExpiryDate(expiryDate);

  if (expiry?.isBefore(now) ?? false) {
    return ProductExpiryStatus.expired;
  }

  final difference = expiry?.difference(now).inDays;

  if ((difference ?? 0) <= 7) {
    return ProductExpiryStatus.approachingExpired;
  }

  return ProductExpiryStatus.safe;
}

String getScanTypeAsString(ScanType scanType) {
  switch (scanType) {
    case ScanType.detectImage:
      return 'Detect Image';
    case ScanType.barcodeScan:
      return 'Barcode Scan';
  }
}
