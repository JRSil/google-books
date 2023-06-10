import 'dart:convert';
import 'package:hive/hive.dart';

part 'sale_info_model.g.dart';

@HiveType(typeId: 1)
class SaleInfoModel {
  @HiveField(0)
  String country;

  @HiveField(1)
  String saleability;

  @HiveField(2)
  bool isEbook;

  @HiveField(3)
  double? price;

  @HiveField(4)
  String? url;

  SaleInfoModel({
    required this.country,
    required this.saleability,
    required this.isEbook,
    this.price,
    this.url,
  });

  Map<String, dynamic> toMap() {
    return {
      'country': country,
      'saleability': saleability,
      'isEbook': isEbook,
      'listPrice': {
        'amount': price,
        'currencyCode': 'BRL',
      },
      'buyLink': url,
    };
  }

  factory SaleInfoModel.fromMap(Map<String, dynamic> map) {
    return SaleInfoModel(
      country: map['country'] ?? "",
      saleability: map['saleability'],
      isEbook: map['isEbook'],
      price: map['listPrice'] != null
          ? map['listPrice']['amount'] is double
              ? map['listPrice']['amount']
              : double.parse(map['listPrice']['amount'])
          : null,
      url: map['buyLink'] ?? "",
    );
  }

  String toJson() => json.encode(toMap());

  factory SaleInfoModel.fromJson(String source) =>
      SaleInfoModel.fromMap(json.decode(source));
}
