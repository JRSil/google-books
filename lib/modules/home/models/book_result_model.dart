import 'dart:convert';

import 'package:ambev/modules/home/models/book_model.dart';

class BookResultModel {
  int totalItems;
  List<BookModel> books;

  BookResultModel({
    required this.totalItems,
    required this.books,
  });

  Map<String, dynamic> toMap() {
    return {
      'totalItems': totalItems,
      'items': books.map((e) => e.toMap()).toList(),
    };
  }

  factory BookResultModel.fromMap(Map<String, dynamic> map) {
    return BookResultModel(
      totalItems: map['totalItems'] is int
          ? map['totalItems']
          : int.parse(map['totalItems']),
      books: List<BookModel>.from(
        map['items'].map((e) => BookModel.fromMap(e)),
      ),
    );
  }

  String toJson() => json.encode(toMap());

  factory BookResultModel.fromJson(String source) =>
      BookResultModel.fromMap(json.decode(source));
}
