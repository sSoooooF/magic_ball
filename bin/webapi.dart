import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:translator/translator.dart';

abstract interface class IWebAPI {
  Future<String> getAdvice();
  Future<String> getAnswer(String question, [bool lucky = true]);
}

class WebAPI implements IWebAPI {
  final translator = GoogleTranslator();

  @override
  Future<String> getAdvice() async {
    try {
      var url = Uri.https("eightballapi.com", '/api');

      var response = await http.get(url);
      if (response.statusCode == 200) {
        final Map<String, dynamic> decoder = jsonDecode(response.body);
        final translation = await translator.translate(decoder["reading"], to: 'ru');
        return translation.toString();
      } else {
        throw Exception('Failed to get advice');
      }
    } catch (e) {
      return 'Error: $e';
    }
  }

  @override
  Future<String> getAnswer(String question, [bool lucky = true]) async {
    try {
      var url = Uri.https("eightballapi.com", '/api/biased',
          {'question': question, 'lucky': lucky.toString()});

      var response = await http.get(url);
      if (response.statusCode == 200) {
        final Map<String, dynamic> decoder = jsonDecode(response.body);
        final translation = await translator.translate(decoder["reading"], to: 'ru');
        return translation.toString();
      } else {
        throw Exception('Failed to get answer');
      }
    } catch (e) {
      return 'Error: $e';
    }
  }
}