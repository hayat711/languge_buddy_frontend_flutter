import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:language_buddy/models/response/chat/RoomModel.dart';
import 'package:language_buddy/services/config.dart';

class RoomHelper {
  static var client = http.Client();

  static Future<List<RoomModel>> setRooms() async {
    try {
      Map<String, String> requestHeaders = {
        'Content-type': 'application/json',
        'Accept': 'application/json',
      };

      var url = Uri.https(Config.apiUrl, Config.rooms);
      var response = await client.get(url, headers: requestHeaders);

      if (response.statusCode == 200) {
        final List<dynamic> data = jsonDecode(response.body);
        final List<RoomModel> rooms = data.map((json) {
          return RoomModel(
            id: json['id'],
            name: json['name'],
            description: json['description'],
            createdAt: DateTime.parse(json['createdAt']),
            updatedAt: DateTime.parse(json['updatedAt']),
            isPublic: json['isPublic'],
            owner: Owner.fromJson(json['owner']),
            mods: (json['mods'] as List<dynamic>)
                .map((mod) => Owner.fromJson(mod))
                .toList(),
            users: (json['users'] as List<dynamic>)
                .map((user) => Owner.fromJson(user))
                .toList(),
          );
        }).toList();
        return rooms;
      } else {
        throw Exception('Failed to fetch rooms');
      }
    } catch (error) {
      throw Exception('Failed to fetch rooms');
    }
  }
}
