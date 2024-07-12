import 'dart:convert';

import 'package:http/http.dart' as http;

abstract interface class IWebAPI {
  Future<String> getAdvice();

  Future<String> getAnswer(String question, bool lucky);
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
      return 'Error: $e';
    }
  }

  @override
  Future<String> getAnswer(String question, bool lucky) async {
    try {
      var url = Uri.https("eightballapi.com", '/api/biased',
          {'question': question, 'lucky': lucky.toString()});

      var response = await http.get(url);
      if (response.statusCode == 200) {
        final Map<String, dynamic> decoder = jsonDecode(response.body);
        return decoder["reading"];
      } else {
        throw Exception('Failed to get answer');
      }
    } catch (e) {
      return 'Error: $e';
    }
  }
}
