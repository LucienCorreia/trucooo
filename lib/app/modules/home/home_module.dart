import 'package:flutter_modular/flutter_modular.dart';

import 'presenter/pages/home/home_controller.dart';
import 'presenter/pages/home/home_page.dart';
import 'presenter/pages/home/stores/game_store.dart';

class HomeModule extends Module {
  @override
  List<Bind> get binds => [
        Bind.lazySingleton<HomeController>(
          (i) => HomeController(
            gameStore: i.get(),
            localizationStore: i.get(),
          ),
        ),
        Bind.factory<GameStore>(
          (i) => GameStore(),
        ),
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute(
          '/',
          child: (_, __) => HomePage(),
        ),
      ];
}
