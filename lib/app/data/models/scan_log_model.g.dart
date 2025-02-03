// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'scan_log_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ScanLogModelAdapter extends TypeAdapter<ScanLogModel> {
  @override
  final int typeId = 0;

  @override
  ScanLogModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ScanLogModel(
      uid: fields[0] as String?,
      barcode: fields[1] as String?,
      productName: fields[2] as String?,
      imageUrl: fields[3] as String?,
      expiryDate: fields[4] as String?,
      expiryStatus: fields[5] as ProductExpiryStatus?,
      scanType: fields[6] as ScanType?,
      productId: fields[7] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, ScanLogModel obj) {
    writer
      ..writeByte(8)
      ..writeByte(0)
      ..write(obj.uid)
      ..writeByte(1)
      ..write(obj.barcode)
      ..writeByte(2)
      ..write(obj.productName)
      ..writeByte(3)
      ..write(obj.imageUrl)
      ..writeByte(4)
      ..write(obj.expiryDate)
      ..writeByte(5)
      ..write(obj.expiryStatus)
      ..writeByte(6)
      ..write(obj.scanType)
      ..writeByte(7)
      ..write(obj.productId);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ScanLogModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
