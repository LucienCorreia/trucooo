import 'package:equatable/equatable.dart';

class PlayerEntity extends Equatable {
  final String name;
  final int score;

  const PlayerEntity({
    required this.name,
    int score = 0,
  }) : this.score = score < 0 ? 0 : score;

  bool get isWinner => score >= 12;

  @override
  List<Object?> get props => [
    name,
    score,
  ];

  PlayerEntity copyWith({
    String? name,
    int? score,
  }) {
    return PlayerEntity(
      name: name ?? this.name,
      score: score ?? this.score,
    );
  }
}
