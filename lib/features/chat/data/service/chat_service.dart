import 'dart:convert';

import 'package:chat_gpt/features/chat/data/model/completions_input.dart';
import 'package:chat_gpt/features/chat/data/model/completions_output.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

abstract class ChatService {
  Future<CompletionsOutput> sendCompletion(CompletionsInput input);
}

@Injectable(as: ChatService)
class ChatServiceImpl implements ChatService {
  const ChatServiceImpl(this._client);

  final Dio _client;

  @override
  Future<CompletionsOutput> sendCompletion(CompletionsInput input) async {
    Response response =
        await _client.post('/v1/chat/completions', data: jsonEncode(input));
    return CompletionsOutput.fromJson(response.data);
  }
}
