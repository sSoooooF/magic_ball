// Он хочет принтить текущее время раз в секунду в формате DD.MM hh:mm:ss

// Если пользователь вводит:
// а) Символ А, то мы отправляем запрос куда-то без параметров eightballapi.com/api GET/ responds with a random reading
// б) если больше 1 символа, то вторым запросом https://eightballapi.com/api/biased GET/biased responds with a biased reading

// Если ошибка, то печатаем её (press red button). Если ответ - печатаем тоже.
import 'package:intl/intl.dart';
import 'webapi.dart';

Future<void> main() async {
  final IWebAPI webAPI = WebAPI();

  final stream = printCurTime();
  stream.listen((value) => print(value));

  final someAdvice = await webAPI.getAdvice();
  print(someAdvice);

  final someAnswer = await webAPI.getAnswer("Vitya sucks");
  print(someAnswer);
}

Stream<String> printCurTime() async* {
  while(true) {
    await Future.delayed(Duration(seconds: 1));
    final formater = DateFormat('d.M HH:mm:ss').format(DateTime.now());
    yield formater;
  }
}