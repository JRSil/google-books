import 'dart:convert';

import 'package:ambev/config/api.dart';
import 'package:ambev/modules/home/models/book_result_model.dart';

class HomeRepository {
  final Api api = Api();

  Future<BookResultModel> getBooks(
    String term,
  ) async {
    const url = "www.googleapis.com";
    const path = "/books/v1/volumes";

    final response = await api.get(
      url,
      urlPath: path,
      queryParameters: {
        'q': term,
      },
    );

    final map = jsonDecode(response.body) as Map<String, dynamic>;

    return BookResultModel.fromMap(map);
  }
}
