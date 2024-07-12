import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'dtos/answer_dto.dart';

abstract interface class IWebAPI {
  Future<String> getAdvice();

  Future<AnswerDto?> getAnswer(String question, bool lucky);
}

class WebAPI implements IWebAPI {
  @override
  Future<String> getAdvice() async {
    try {
      var url = Uri.https("eightballapi.com", '/api');

      var response = await http.get(url);
      if (response.statusCode == 200) {
        final Map<String, dynamic> decoder = jsonDecode(response.body);
        return decoder["reading"];
      } else {
        throw Exception('Failed to get advice');
      }
    } catch (e) {
      throw 'Error: $e';
    }
  }

  @override
  Future<AnswerDto> getAnswer(String question, bool lucky) async {
    var url = Uri.https("eightballapi.com", '/api/biased',
        {'question': question, 'lucky': lucky.toString()},);

    try {
      var response = await http.get(url);
      if (response.statusCode == 401) {
        throw Exception('Пришла 401');
      }
      final result = AnswerDto.fromJson(jsonDecode(response.body));
      return result;
    } on ClientException {
      print('Я обработал ошибку в клиенте');
      throw Exception('Клиент сломался');
    } on Exception {
      rethrow;
    }
  }

}
