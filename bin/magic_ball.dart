// Он хочет принтить текущее время раз в секунду в формате DD.MM hh:mm:ss

// Если пользователь вводит:
// а) Символ А, то мы отправляем запрос куда-то без параметров eightballapi.com/api GET/ responds with a random reading
// б) если больше 1 символа, то вторым запросом https://eightballapi.com/api/biased GET/biased responds with a biased reading

// Если ошибка, то печатаем её (press red button). Если ответ - печатаем тоже.

import 'dart:async';
import 'dart:io';

import 'package:intl/intl.dart';
import 'package:translator/translator.dart';
import 'webapi.dart';
import 'repository.dart';

Future<void> main() async {
  final translator = GoogleTranslator();
  final IWebAPI webAPI = WebAPI();
  final IRepository repository = Repository(webAPI, translator);

  final stream = currentTimeStream();
  stream.listen((value) => print(value));

  while (true) {
    stdout.write('Введите вопрос (или нажмите Enter для отправки): ');
    String? input = stdin.readLineSync();

    if (input == null || input.isEmpty) {
      final advice = await repository.getAdvice();
      print(advice);
      break;
    }
    final enInput = translator.translate(input, to: 'en').toString();
    final answer = await repository.getAnswer(enInput);
    print(answer);
  }
}

Stream<String> currentTimeStream() async* {
  while (true) {
    await Future.delayed(Duration(seconds: 1));
    final formatter = DateFormat('dd.MM HH:mm:ss');
    yield formatter.format(DateTime.now());
  }
}
