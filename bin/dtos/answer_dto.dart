import 'package:json_annotation/json_annotation.dart';

part 'answer_dto.g.dart';

@JsonSerializable()
class AnswerDto {
  final String reading;
  final String question;
  final Map<String, dynamic> sentiment;

  const AnswerDto(this.reading, this.question, this.sentiment);

  factory AnswerDto.fromJson(Map<String, dynamic> json) => _$AnswerDtoFromJson(json);
}