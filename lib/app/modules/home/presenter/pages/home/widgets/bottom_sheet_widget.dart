import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:localization/localization.dart';

class BottomSheetWidget extends StatelessWidget {
  const BottomSheetWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        ListTile(
          title: Text('points'.i18n(['3'])),
          onTap: () => Modular.to.pop(1),
        ),
        ListTile(
          title: Text('points'.i18n(['6'])),
          onTap: () => Modular.to.pop(2),
        ),
        ListTile(
          title: Text('points'.i18n(['9'])),
          onTap: () => Modular.to.pop(3),
        ),
        ListTile(
          title: Text('points'.i18n(['12'])),
          onTap: () => Modular.to.pop(4),
        ),
      ],
    );
  }
}
