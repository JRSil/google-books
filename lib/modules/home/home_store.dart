import 'package:ambev/config/boxes.dart';
import 'package:ambev/modules/home/util/sale_enum.dart';
import 'package:mobx/mobx.dart';

import 'package:ambev/modules/home/models/book_model.dart';
import 'package:ambev/modules/home/repository/home_repository.dart';

part 'home_store.g.dart';

class HomeStore = _HomeStoreBase with _$HomeStore;

abstract class _HomeStoreBase with Store {
  final HomeRepository repository = HomeRepository();

  @observable
  ObservableList<BookModel> books = ObservableList<BookModel>();

  @observable
  String term = "";

  @action
  void changeTerm(String value) => term = value;

  @action
  Future<void> getBooks(String text) async {
    if (text == "") {
      return Future.value();
    }

    books.clear();

    try {
      final result = await repository.getBooks(text);

      books.addAll(result.books);
    } catch (e) {
      print(e.toString());
    }
  }

  void put(BookModel book) {
    if (!containsKey(book.id)) {
      bookBox.put(book.id, book);
    } else {
      bookBox.delete(book.id);
    }
  }

  void getFromDatabase(String text) {
    final size = bookBox.length;
    books.clear();

    List<BookModel> list = [];

    for (var index = 0; index < size; index++) {
      list.add(
        bookBox.getAt(index),
      );
    }

    books.addAll(
      list.where(
        (element) => element.volumeInfo.title.toLowerCase().contains(text),
      ),
    );
  }

  bool containsKey(String id) {
    return bookBox.containsKey(id);
  }

  Saleability getSaleability(BookModel book) {
    switch (book.saleInfo.saleability) {
      case "NOT_FOR_SALE":
        return Saleability.notForSale;
      case "FOR_SALE":
        return Saleability.forSale;
      default:
        return Saleability.notForSale;
    }
  }
}
