// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'volume_info_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class VolumeInfoModelAdapter extends TypeAdapter<VolumeInfoModel> {
  @override
  final int typeId = 2;

  @override
  VolumeInfoModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return VolumeInfoModel(
      title: fields[0] as String,
      authors: (fields[1] as List).cast<String>(),
      publisher: fields[2] as String,
      description: fields[3] as String,
      pageCount: fields[4] as int,
      categories: (fields[5] as List).cast<String>(),
    );
  }

  @override
  void write(BinaryWriter writer, VolumeInfoModel obj) {
    writer
      ..writeByte(6)
      ..writeByte(0)
      ..write(obj.title)
      ..writeByte(1)
      ..write(obj.authors)
      ..writeByte(2)
      ..write(obj.publisher)
      ..writeByte(3)
      ..write(obj.description)
      ..writeByte(4)
      ..write(obj.pageCount)
      ..writeByte(5)
      ..write(obj.categories);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is VolumeInfoModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
