// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'answer_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AnswerDto _$AnswerDtoFromJson(Map<String, dynamic> json) => AnswerDto(
      json['reading'] as String,
      json['question'] as String,
      Sentiments.fromJson(json['sentiment'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$AnswerDtoToJson(AnswerDto instance) => <String, dynamic>{
      'reading': instance.reading,
      'question': instance.question,
      'sentiment': instance.sentiment,
    };

Sentiments _$SentimentsFromJson(Map<String, dynamic> json) => Sentiments(
      score: (json['score'] as num).toInt(),
      comparative: (json['comparative'] as num).toDouble(),
      calculation: (json['calculation'] as List<dynamic>)
          .map((e) => Calculation.fromJson(e as Map<String, dynamic>))
          .toList(),
      tokens:
          (json['tokens'] as List<dynamic>).map((e) => e as String).toList(),
      words: (json['words'] as List<dynamic>).map((e) => e as String).toList(),
      positive:
          (json['positive'] as List<dynamic>).map((e) => e as String).toList(),
      negative:
          (json['negative'] as List<dynamic>).map((e) => e as String).toList(),
    );

Map<String, dynamic> _$SentimentsToJson(Sentiments instance) =>
    <String, dynamic>{
      'score': instance.score,
      'comparative': instance.comparative,
      'calculation': instance.calculation,
      'tokens': instance.tokens,
      'words': instance.words,
      'positive': instance.positive,
      'negative': instance.negative,
    };

Calculation _$CalculationFromJson(Map<String, dynamic> json) => Calculation(
      win: (json['win'] as num).toInt(),
    );

Map<String, dynamic> _$CalculationToJson(Calculation instance) =>
    <String, dynamic>{
      'win': instance.win,
    };
