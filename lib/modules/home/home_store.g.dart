// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$HomeStore on _HomeStoreBase, Store {
  late final _$booksAtom = Atom(name: '_HomeStoreBase.books', context: context);

  @override
  ObservableList<BookModel> get books {
    _$booksAtom.reportRead();
    return super.books;
  }

  @override
  set books(ObservableList<BookModel> value) {
    _$booksAtom.reportWrite(value, super.books, () {
      super.books = value;
    });
  }

  late final _$termAtom = Atom(name: '_HomeStoreBase.term', context: context);

  @override
  String get term {
    _$termAtom.reportRead();
    return super.term;
  }

  @override
  set term(String value) {
    _$termAtom.reportWrite(value, super.term, () {
      super.term = value;
    });
  }

  late final _$getBooksAsyncAction =
      AsyncAction('_HomeStoreBase.getBooks', context: context);

  @override
  Future<void> getBooks(String text) {
    return _$getBooksAsyncAction.run(() => super.getBooks(text));
  }

  late final _$_HomeStoreBaseActionController =
      ActionController(name: '_HomeStoreBase', context: context);

  @override
  void changeTerm(String value) {
    final _$actionInfo = _$_HomeStoreBaseActionController.startAction(
        name: '_HomeStoreBase.changeTerm');
    try {
      return super.changeTerm(value);
    } finally {
      _$_HomeStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
books: ${books},
term: ${term}
    ''';
  }
}
