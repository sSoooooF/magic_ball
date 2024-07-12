class AnswerDto {
  final String reading;
  final String question;
  final Map<String, dynamic> sentiment;

  const AnswerDto(this.reading, this.question, this.sentiment);

  factory AnswerDto.fromJson(Map<String, dynamic> json) {
    return AnswerDto(
      json['reading'],
      json['question'],
      json['sentiment'],
    );
  }
}

//{
//   "reading": "It is decidedly so.",
//   "question": "will i win the lottery",
//   "sentiment": {
//     "score": 4,
//     "comparative": 0.8,
//     "calculation": [
//       {
//         "win": 4
//       }
//     ],
//     "tokens": [
//       "will",
//       "i",
//       "win",
//       "the",
//       "lottery"
//     ],
//     "words": [
//       "win"
//     ],
//     "positive": [
//       "win"
//     ],
//     "negative": []
//   }
// }
