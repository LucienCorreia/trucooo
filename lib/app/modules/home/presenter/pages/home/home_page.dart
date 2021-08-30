import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:get/get.dart';
import 'package:localization/localization.dart';

import 'home_controller.dart';
import 'widgets/bottom_sheet_widget.dart';
import 'widgets/change_name_alert_dialog_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({
    Key? key,
  }) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends ModularState<HomePage, HomeController> {
  @override
  void initState() {
    super.initState();

    controller.localizationStore.selecetedLanguage.listen((value) {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('TRUCOOO!!!'),
        actions: [
          IconButton(
            onPressed: controller.switchLang,
            icon: Icon(
              Icons.translate,
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Obx(
                  () => Text(
                      '${controller.gameStore.hasWinner ? '${controller.gameStore.winner} ganhou!' : ''}'),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Obx(
                  () => GestureDetector(
                    onTap: () async {
                      final name = await showDialog<String?>(
                        context: context,
                        builder: (_) => ChangeNameAlertDialogWidget(),
                      );

                      controller.gameStore.changeNamePlayerOne(name);
                    },
                    child: Column(
                      children: [
                        Text(
                          '${controller.gameStore.gameEntity.playerOne.score}',
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 40),
                        ),
                        Text(
                          '${controller.gameStore.gameEntity.playerOne.name}',
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ),
                ),
                GestureDetector(
                  child: Obx(
                    () => GestureDetector(
                      onTap: () async {
                        final name = await showDialog<String?>(
                          context: context,
                          builder: (_) => ChangeNameAlertDialogWidget(),
                        );

                        controller.gameStore.changeNamePlayerTwo(name);
                      },
                      child: Column(
                        children: [
                          Text(
                            '${controller.gameStore.gameEntity.playerTwo.score}',
                            textAlign: TextAlign.center,
                            style: TextStyle(fontSize: 40),
                          ),
                          Text(
                            '${controller.gameStore.gameEntity.playerTwo.name}',
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  children: [
                    Row(
                      children: [
                        IconButton(
                          onPressed: () =>
                              controller.gameStore.decrementScorePlayerOne(),
                          icon: Icon(Icons.remove),
                        ),
                        Obx(
                          () => IconButton(
                            onPressed: !controller.gameStore.hasWinner
                                ? controller.gameStore.incrementScorePlayerOne
                                : null,
                            icon: Icon(Icons.add),
                          ),
                        ),
                      ],
                    ),
                    Obx(
                      () => TextButton(
                        onPressed: !controller.gameStore.hasWinner
                            ? () async {
                                final multiplier = await showModalBottomSheet(
                                  context: context,
                                  builder: (_) => BottomSheetWidget(),
                                );

                                controller.gameStore
                                    .incrementScorePlayerOne(multiplier * 3);
                              }
                            : null,
                        child: Text(
                          'TRUCO!',
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Column(
                  children: [
                    Row(
                      children: [
                        IconButton(
                          onPressed:
                              controller.gameStore.decrementScorePlayerTwo,
                          icon: Icon(Icons.remove),
                        ),
                        Obx(
                          () => IconButton(
                            onPressed: !controller.gameStore.hasWinner
                                ? controller.gameStore.incrementScorePlayerTwo
                                : null,
                            icon: Icon(Icons.add),
                          ),
                        ),
                      ],
                    ),
                    Obx(
                      () => TextButton(
                        onPressed: !controller.gameStore.hasWinner
                            ? () async {
                                final multiplier = await showModalBottomSheet(
                                  context: context,
                                  builder: (_) => BottomSheetWidget(),
                                );

                                controller.gameStore
                                    .incrementScorePlayerTwo(multiplier * 3);
                              }
                            : null,
                        child: Text(
                          'TRUCO!',
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: controller.gameStore.reset,
                  child: Text('reset'.i18n()),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
