import 'package:get/get.dart';

import '../../../../domain/entities/game_entity.dart';

class GameStore extends GetxController {
  final _gameEntity = Rx<GameEntity>(
    GameEntity(),
  );

  GameEntity get gameEntity => _gameEntity.value;

  String? get winner => _gameEntity.value.playerOne.isWinner
      ? _gameEntity.value.playerOne.name
      : _gameEntity.value.playerTwo.isWinner
          ? _gameEntity.value.playerTwo.name
          : null;

  bool get hasWinner =>
      _gameEntity.value.playerOne.isWinner ||
      _gameEntity.value.playerTwo.isWinner;

  void incrementScorePlayerOne([int score = 1]) {
    final player = _gameEntity.value.playerOne.copyWith(
      score: _gameEntity.value.playerOne.score + score,
    );

    _gameEntity.value = _gameEntity.value.copyWith(
      playerOne: player,
    );
  }

  void incrementScorePlayerTwo([int score = 1]) {
    final player = _gameEntity.value.playerTwo.copyWith(
      score: _gameEntity.value.playerTwo.score + score,
    );

    _gameEntity.value = _gameEntity.value.copyWith(
      playerTwo: player,
    );
  }

  void changeNamePlayerOne(String? name) {
    final player = _gameEntity.value.playerOne.copyWith(
      name: name,
    );

    _gameEntity.value = _gameEntity.value.copyWith(
      playerOne: player,
    );
  }

  void changeNamePlayerTwo(String? name) {
        final player = _gameEntity.value.playerTwo.copyWith(
      name: name,
    );

    _gameEntity.value = _gameEntity.value.copyWith(
      playerTwo: player,
    );
  }

  void decrementScorePlayerOne() {
    final player = _gameEntity.value.playerOne.copyWith(
      score: _gameEntity.value.playerOne.score - 1,
    );

    _gameEntity.value = _gameEntity.value.copyWith(
      playerOne: player,
    );
  }

  void decrementScorePlayerTwo() {
    final player = _gameEntity.value.playerTwo.copyWith(
      score: _gameEntity.value.playerTwo.score - 1,
    );

    _gameEntity.value = _gameEntity.value.copyWith(
      playerTwo: player,
    );
  }

  void reset() {
    _gameEntity.value = _gameEntity.value.reset();
  }

  @override
  void dispose() {
    super.dispose();
  }
}
