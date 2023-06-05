import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:language_buddy/models/response/chat/ConversationModel.dart';
import 'package:language_buddy/services/config.dart';

class ChatHelper {
  static var client = http.Client();

  static Future<List<ConversationModel>> setConversations() async {
    try {
      Map<String, String> requestHeaders = {
        'Content-type': 'application/json',
        'Accept': 'application/json',
      };

      var url = Uri.https(Config.apiUrl, Config.conversations);
      var response = await client.get(url, headers: requestHeaders);

      if (response.statusCode == 200) {
        final List<dynamic> data = jsonDecode(response.body);
        final List<ConversationModel> conversations = data.map((json) {
          return ConversationModel(
            createdAt: DateTime.parse(json['createdAt']),
            creator: Creator.fromJson(json['creator']),
            id: json['id'],
            recipient: Creator.fromJson(json['recipient']),
            updatedAt: DateTime.parse(json['updatedAt']),
          );
        }).toList();
        return conversations;
      } else {
        throw Exception('Failed to fetch conversations');
      }
    } catch (error) {
      throw Exception('Failed to fetch conversations');
    }
  }
}
