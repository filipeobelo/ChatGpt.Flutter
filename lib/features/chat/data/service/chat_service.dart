import 'dart:convert';

import 'package:chat_gpt/features/chat/data/completions_input.dart';
import 'package:chat_gpt/features/chat/data/completions_output.dart';
import 'package:dio/dio.dart';

import '../../../../commons/network/network.dart';

abstract interface class ChatService {
  Future<CompletionsOutput> sendCompletion(CompletionsInput input);
}

class ChatServiceImpl implements ChatService {
  @override
  Future<CompletionsOutput> sendCompletion(CompletionsInput input) async {
    Response response =
        await dio.post('/v1/chat/completions', data: jsonEncode(input));
    return CompletionsOutput.fromJson(response.data);
  }
}
