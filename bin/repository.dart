import 'package:translator/translator.dart';

import 'webapi.dart'


abstract interface class IRepository {
  Future<String> getAdvice();

  Future<String> getAnswer(String question, [bool lucky = true]);
}

class Repository implements IRepository {
  final IWebAPI webApi;
  final GoogleTranslator translator;

  Repository(this.webApi, this.translator);

  @override
  Future<String> getAdvice() async{
    final response = await webApi.getAdvice();
    final translatedResponse = (await translator.translate(response, to: 'ru')).toString();
    return translatedResponse;
  }

  @override
  Future<String> getAnswer(String question, [bool lucky = true]) async {
    final translatedQuestion = (await translator.translate(question, to: 'en')).toString();
    final response = await webApi.getAnswer(question, lucky);
    final translatedResponse = (await translator.translate(response, to: 'ru')).toString();
    return translatedResponse;
  }


}
