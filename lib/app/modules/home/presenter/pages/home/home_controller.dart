import 'package:flutter_modular/flutter_modular.dart';
import 'package:localization/localization.dart';

import '../../../../../core/enums/localization.dart';
import '../../../../../core/presenter/stores/localization_store.dart';
import 'stores/game_store.dart';

class HomeController implements Disposable {
  final GameStore _gameStore;
  final LocalizationStore _localizationStore;

  HomeController({
    required GameStore gameStore,
    required LocalizationStore localizationStore,
  })  : _gameStore = gameStore,
        _localizationStore = localizationStore;

  GameStore get gameStore => _gameStore;
  LocalizationStore get localizationStore => _localizationStore;

  Future<void> switchLang() async {
    if (Localization.selectedLanguage == 'pt_BR') {
      await _localizationStore.changeLang(LocalizationsEnum.enUS);
    } else {
      await _localizationStore.changeLang(LocalizationsEnum.ptBR);
    }
  }

  @override
  void dispose() {
    _gameStore.dispose();
  }
}
