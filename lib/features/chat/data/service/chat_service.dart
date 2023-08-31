import 'package:chat_gpt/features/chat/data/chat_data.dart';
import 'package:dio/dio.dart';

abstract interface class ChatService {
  Future<ChatData> sendMessage();
}

class ChatServiceImpl implements ChatService {
  final dio = Dio();

  @override
  Future<ChatData> sendMessage() async {
    Response response;
    // Todo: mock api for test purpose 
    response = await dio.get('https://catfact.ninja/fact');
    return ChatData.fromJson(response.data);
  }
}
