import 'dart:convert';
import 'package:hive/hive.dart';

import 'package:ambev/modules/home/models/sale_info_model.dart';
import 'package:ambev/modules/home/models/volume_info_model.dart';

part 'book_model.g.dart';

@HiveType(typeId: 0)
class BookModel {
  @HiveField(0)
  String id;

  @HiveField(1)
  VolumeInfoModel volumeInfo;

  @HiveField(2)
  SaleInfoModel saleInfo;

  BookModel({
    required this.id,
    required this.volumeInfo,
    required this.saleInfo,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'volumeInfo': volumeInfo.toMap(),
      'saleInfo': saleInfo.toMap(),
    };
  }

  factory BookModel.fromMap(Map<String, dynamic> map) {
    return BookModel(
      id: map['id'],
      volumeInfo: VolumeInfoModel.fromMap(map['volumeInfo']),
      saleInfo: SaleInfoModel.fromMap(map['saleInfo']),
    );
  }

  String toJson() => json.encode(toMap());

  factory BookModel.fromJson(String source) =>
      BookModel.fromMap(json.decode(source));
}
