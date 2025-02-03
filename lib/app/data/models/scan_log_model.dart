// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:hive_ce/hive.dart';

import '../../../core/enums/enums.dart';
part 'scan_log_model.g.dart';

@HiveType(typeId: 0)
class ScanLogModel {
  @HiveField(0)
  String? uid;
  @HiveField(1)
  String? barcode;
  @HiveField(2)
  String? productName;
  @HiveField(3)
  String? imageUrl;
  @HiveField(4)
  String? expiryDate;
  @HiveField(5)
  ProductExpiryStatus? expiryStatus;
  @HiveField(6)
  ScanType? scanType;
  @HiveField(7)
  String? productId;

  ScanLogModel({
    this.uid,
    this.barcode,
    this.productName,
    this.imageUrl,
    this.expiryDate,
    this.expiryStatus,
    this.scanType,
    this.productId,
  });

  ScanLogModel copyWith({
    String? uid,
    String? barcode,
    String? productName,
    String? imageUrl,
    String? expiryDate,
    String? entryDate,
    ProductExpiryStatus? expiryStatus,
    ScanType? scanType,
    String? productId,
  }) {
    return ScanLogModel(
      uid: uid ?? this.uid,
      barcode: barcode ?? this.barcode,
      productName: productName ?? this.productName,
      imageUrl: imageUrl ?? this.imageUrl,
      expiryDate: expiryDate ?? this.expiryDate,
      expiryStatus: expiryStatus ?? this.expiryStatus,
      scanType: scanType ?? this.scanType,
      productId: productId ?? this.productId,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'uid': uid,
      'barcode': barcode,
      'productName': productName,
      'imageUrl': imageUrl,
      'expiryDate': expiryDate,
      'expiryStatus': expiryStatus?.name,
      "scanType": scanType?.name,
      "productId": productId,
    };
  }

  factory ScanLogModel.fromMap(Map<String, dynamic> map) {
    return ScanLogModel(
      uid: map['uid'] != null ? map['uid'] as String : null,
      barcode: map['barcode'] != null ? map['barcode'] as String : null,
      productName:
          map['productName'] != null ? map['productName'] as String : null,
      imageUrl: map['imageUrl'] != null ? map['imageUrl'] as String : null,
      expiryDate:
          map['expiryDate'] != null ? map['expiryDate'] as String : null,
      expiryStatus: map['expiryStatus'] != null
          ? getProductExpiryStatus(expiryDate: map['entryDate'] as String)
          : null,
      scanType: map['scanType'] != null
          ? ScanType.values.firstWhere(
              (element) => element.name == map['scanType'] as String)
          : null,
      productId: map['productId'] != null ? map['productId'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory ScanLogModel.fromJson(String source) =>
      ScanLogModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'ScanLogModel(uid: $uid, barcode: $barcode, productName: $productName, imageUrl: $imageUrl, expiryDate: $expiryDate, expiryStatus: $expiryStatus , scanType: $scanType , productId: $productId)';
  }

  @override
  bool operator ==(covariant ScanLogModel other) {
    if (identical(this, other)) return true;

    return other.uid == uid &&
        other.barcode == barcode &&
        other.productName == productName &&
        other.imageUrl == imageUrl &&
        other.expiryDate == expiryDate &&
        other.expiryStatus == expiryStatus &&
        other.scanType == scanType &&
        other.productId == productId;
  }

  @override
  int get hashCode {
    return uid.hashCode ^
        barcode.hashCode ^
        productName.hashCode ^
        imageUrl.hashCode ^
        expiryDate.hashCode ^
        expiryStatus.hashCode ^
        scanType.hashCode ^
        productId.hashCode;
  }
}
