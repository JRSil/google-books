import 'package:ambev/modules/home/page/detail/detail_page.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'package:ambev/modules/home/home_store.dart';
import 'package:ambev/modules/home/page/initial/home_page.dart';

class HomeModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.lazySingleton((i) => HomeStore()),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute(
      Modular.initialRoute,
      child: (_, args) => HomePage(),
    ),
    ChildRoute(
      '/detail',
      child: (_, args) => DetailPage(
        book: args.data,
      ),
    ),
  ];
}
