import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:localization/localization.dart';

class ChangeNameAlertDialogWidget extends StatelessWidget {
  final textEditingController = TextEditingController();

  ChangeNameAlertDialogWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('change name'.i18n()),
      content: TextField(
        controller: textEditingController,
        cursorColor: Colors.white,
        decoration: InputDecoration(
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(
              color: Colors.red,
            ),
          ),
        ),
      ),
      actions: [
        TextButton(
          onPressed: () => Modular.to.pop(textEditingController.text),
          child: Text(
            'save'.i18n(),
            style: TextStyle(
              color: Colors.red,
            ),
          ),
        ),
      ],
    );
  }
}
