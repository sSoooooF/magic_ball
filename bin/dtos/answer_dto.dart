import 'package:json_annotation/json_annotation.dart';

part 'answer_dto.g.dart';

@JsonSerializable()
class AnswerDto {
  final String reading;
  final String question;
  final Sentiments sentiment;

  const AnswerDto(this.reading, this.question, this.sentiment);

  factory AnswerDto.fromJson(Map<String, dynamic> json) => _$AnswerDtoFromJson(json);
}


@JsonSerializable()
class Sentiments {
  final int score;
  final double comparative;
  final List<Calculation> calculation;
  final List<String> tokens;
  final List<String> words;
  final List<String> positive;
  final List<String> negative;

  const Sentiments(
      {required this.score,
        required this.comparative,
        required this.calculation,
        required this.tokens,
        required this.words,
        required this.positive,
        required this.negative});

  factory Sentiments.fromJson(Map<String, dynamic> json) =>
      _$SentimentsFromJson(json);
}

@JsonSerializable()
class Calculation {
  final int win;

  const Calculation({required this.win});

  factory Calculation.fromJson(Map<String, dynamic> json) =>
      _$CalculationFromJson(json);
}

