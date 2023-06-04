import 'dart:convert';

import 'package:http/http.dart' as https;
import 'package:language_buddy/services/config.dart';

import '../../models/request/chat/room_model.dart';


class RoomHelper {
  static var client = https.Client();

  static Future<List<RoomModel>> setRooms() async {
    try {
      Map<String, String> requestHeaders = {
        'Content-type': 'application/json',
        'Accept': 'application/json',
      };

      var url = Uri.https(Config.apiUrl, Config.conversations);
      var response = await client.get(url, headers: requestHeaders);

      if (response.statusCode == 200) {
      final List<dynamic> data = jsonDecode(response.body);
      final List<RoomModel> rooms = data.map((json){
        return RoomModel(
          id: json['id'],
          content: json['content'],
          // map other properties
        );
      }).toList();
      return rooms;

    } else {
      throw Exception('Failed to fetch rooms');
    } 
    
    }catch (error) {
      throw Exception('Failed to fetch rooms');
    }
  }
}