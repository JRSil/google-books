import 'package:flutter_modular/flutter_modular.dart';

import 'package:ambev/modules/home/home_module.dart';

class AppModule extends Module {
  @override
  List<Module> get imports => [];

  @override
  final List<ModularRoute> routes = [
    ModuleRoute(
      Modular.initialRoute,
      module: HomeModule(),
    ),
  ];
}
