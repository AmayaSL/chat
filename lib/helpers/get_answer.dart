import 'package:chat/entities/message.dart';
import 'package:dio/dio.dart';

class GetAnswer {
  final _dio = Dio();

  Future<Message> getAnswers() async {
    final response = await _dio.get("https://yesno.wtf/api");
    return Message(
        text: response.data["answer"],
        from: FromWho.your,
        imageUrl: response.data["image"]);
  }
}
