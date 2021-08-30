import 'package:flutter_modular/flutter_modular.dart';

import '../../modules/home/home_module.dart';
import 'stores/localization_store.dart';

class AppModule extends Module {
  @override
  List<Bind> get binds => [
        Bind.singleton(
          (i) => LocalizationStore(),
        ),
      ];

  @override
  List<ModularRoute> get routes => [
        ModuleRoute(
          '/home',
          module: HomeModule(),
        ),
      ];
}
