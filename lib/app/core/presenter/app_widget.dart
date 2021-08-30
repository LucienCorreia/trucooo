import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'app_theme.dart';

class AppWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: AppTheme.darkTheme,
      initialRoute: '/home',
    ).modular();
  }
}
