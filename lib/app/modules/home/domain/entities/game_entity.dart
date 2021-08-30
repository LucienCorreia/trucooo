import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

import 'player_entity.dart';

@immutable
class GameEntity extends Equatable {
  final PlayerEntity playerOne;
  final PlayerEntity playerTwo;

  const GameEntity({
    this.playerOne = const PlayerEntity(
      name: 'Player 1',
    ),
    this.playerTwo = const PlayerEntity(
      name: 'Player 2',
    ),
  });

  PlayerEntity? get winner => playerOne.isWinner
      ? playerOne
      : playerTwo.isWinner
          ? playerTwo
          : null;

  @override
  List<Object?> get props => [
        playerOne,
        playerTwo,
      ];

  GameEntity reset() {
    return copyWith(
      playerOne: playerOne.copyWith(score: 0),
      playerTwo: playerTwo.copyWith(score: 0),
    );
  }

  GameEntity copyWith({
    PlayerEntity? playerOne,
    PlayerEntity? playerTwo,
  }) {
    return GameEntity(
      playerOne: playerOne ?? this.playerOne,
      playerTwo: playerTwo ?? this.playerTwo,
    );
  }
}
