// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sale_info_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class SaleInfoModelAdapter extends TypeAdapter<SaleInfoModel> {
  @override
  final int typeId = 1;

  @override
  SaleInfoModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return SaleInfoModel(
      country: fields[0] as String,
      saleability: fields[1] as String,
      isEbook: fields[2] as bool,
      price: fields[3] as double?,
      url: fields[4] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, SaleInfoModel obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.country)
      ..writeByte(1)
      ..write(obj.saleability)
      ..writeByte(2)
      ..write(obj.isEbook)
      ..writeByte(3)
      ..write(obj.price)
      ..writeByte(4)
      ..write(obj.url);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is SaleInfoModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
