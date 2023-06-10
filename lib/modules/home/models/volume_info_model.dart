import 'dart:convert';
import 'package:hive/hive.dart';

part 'volume_info_model.g.dart';

@HiveType(typeId: 2)
class VolumeInfoModel {
  @HiveField(0)
  String title;

  @HiveField(1)
  List<String> authors;

  @HiveField(2)
  String publisher;

  @HiveField(3)
  String description;

  @HiveField(4)
  int pageCount;

  @HiveField(5)
  List<String> categories;

  VolumeInfoModel({
    required this.title,
    required this.authors,
    required this.publisher,
    required this.description,
    required this.pageCount,
    required this.categories,
  });

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'authors': authors,
      'publisher': publisher,
      'description': description,
      'pageCount': pageCount,
      'categories': categories,
    };
  }

  factory VolumeInfoModel.fromMap(Map<String, dynamic> map) {
    return VolumeInfoModel(
      title: map['title'] ?? "",
      authors: map['authors'] != null ? List<String>.from(map['authors']) : [],
      publisher: map['publisher'] ?? "",
      description: map['description'] ?? "",
      pageCount: map['pageCount'] is int
          ? map['pageCount']
          : int.parse(map['pageCount']),
      categories:
          map['categories'] != null ? List<String>.from(map['categories']) : [],
    );
  }

  String toJson() => json.encode(toMap());

  factory VolumeInfoModel.fromJson(String source) =>
      VolumeInfoModel.fromMap(json.decode(source));
}
