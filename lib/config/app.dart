import 'package:ambev/modules/home/models/sale_info_model.dart';
import 'package:ambev/modules/home/models/volume_info_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'package:ambev/config/boxes.dart';
import 'package:ambev/config/app_modules.dart';
import 'package:ambev/modules/home/models/book_model.dart';

Future<void> initApp() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter(BookModelAdapter());
  Hive.registerAdapter(SaleInfoModelAdapter());
  Hive.registerAdapter(VolumeInfoModelAdapter());
  bookBox = await Hive.openBox<BookModel>('bookBox');
  runApp(
    ModularApp(
      module: AppModule(),
      child: App(),
    ),
  );
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: "Teste Ambev",
      routeInformationParser: Modular.routeInformationParser,
      routerDelegate: Modular.routerDelegate,
    );
  }
}
