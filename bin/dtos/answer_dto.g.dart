// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'answer_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AnswerDto _$AnswerDtoFromJson(Map<String, dynamic> json) => AnswerDto(
      json['reading'] as String,
      json['question'] as String,
      json['sentiment'] as Map<String, dynamic>,
    );

Map<String, dynamic> _$AnswerDtoToJson(AnswerDto instance) => <String, dynamic>{
      'reading': instance.reading,
      'question': instance.question,
      'sentiment': instance.sentiment,
    };
