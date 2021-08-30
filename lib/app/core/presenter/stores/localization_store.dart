import 'package:get/get.dart';
import 'package:localization/localization.dart';

import '../../enums/localization.dart';

class LocalizationStore extends GetxController {
  final _selectedLanguage = Rx<LocalizationsEnum>(LocalizationsEnum.ptBR);

  Rx<LocalizationsEnum> get selecetedLanguage => _selectedLanguage;

  LocalizationStore() {
    _init();
  }

  Future<void> _init() async {
    Localization.setTranslationDirectories([
      'assets/lang',
    ]);

    await changeLang(LocalizationsEnum.ptBR);
  }

  Future<void> changeLang(LocalizationsEnum lang) async {
    await Localization.configuration(selectedLanguage: lang.value);

     _selectedLanguage.value = lang;
  }
}
