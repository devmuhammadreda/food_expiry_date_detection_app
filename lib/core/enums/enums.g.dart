// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'enums.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ProductExpiryStatusAdapter extends TypeAdapter<ProductExpiryStatus> {
  @override
  final int typeId = 1;

  @override
  ProductExpiryStatus read(BinaryReader reader) {
    switch (reader.readByte()) {
      case 0:
        return ProductExpiryStatus.approachingExpired;
      case 1:
        return ProductExpiryStatus.expired;
      case 2:
        return ProductExpiryStatus.safe;
      case 3:
        return ProductExpiryStatus.unknown;
      default:
        return ProductExpiryStatus.approachingExpired;
    }
  }

  @override
  void write(BinaryWriter writer, ProductExpiryStatus obj) {
    switch (obj) {
      case ProductExpiryStatus.approachingExpired:
        writer.writeByte(0);
      case ProductExpiryStatus.expired:
        writer.writeByte(1);
      case ProductExpiryStatus.safe:
        writer.writeByte(2);
      case ProductExpiryStatus.unknown:
        writer.writeByte(3);
    }
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ProductExpiryStatusAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class ScanTypeAdapter extends TypeAdapter<ScanType> {
  @override
  final int typeId = 2;

  @override
  ScanType read(BinaryReader reader) {
    switch (reader.readByte()) {
      case 0:
        return ScanType.detectImage;
      case 1:
        return ScanType.barcodeScan;
      default:
        return ScanType.detectImage;
    }
  }

  @override
  void write(BinaryWriter writer, ScanType obj) {
    switch (obj) {
      case ScanType.detectImage:
        writer.writeByte(0);
      case ScanType.barcodeScan:
        writer.writeByte(1);
    }
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ScanTypeAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
