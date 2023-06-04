import 'dart:convert';

import 'package:http/http.dart' as https;
import 'package:language_buddy/services/config.dart';

import '../../models/request/chat/conversation_model.dart';


class ChatHelper {
  static var client = https.Client();

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
      final List<ConversationModel> conversations = data.map((json){
        return ConversationModel(
          id: json['id'],
          content: json['content'],
          // map other properties
        );
      }).toList();
      return conversations;

    } else {
      throw Exception('Failed to fetch conversations');
    } 

    
    }catch (error) {
      throw Exception('Failed to fetch conversations');
    }
  }
}