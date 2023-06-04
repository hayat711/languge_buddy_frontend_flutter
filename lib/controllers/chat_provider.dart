
import 'package:flutter/material.dart';
import 'package:language_buddy/services/helpers/chat_helper.dart';
import 'package:language_buddy/services/helpers/chat_room_helper.dart';

class ChatNotifier extends ChangeNotifier {

  late String _activeConversationId  = '';
  String get activeConversationId => _activeConversationId;

  set activeConversationId(String conversationId) {
    _activeConversationId = conversationId;
    activeRoomId = '';
    notifyListeners();
  }

  late String  _activeRoomId = '';
  String get activeRoomId => _activeRoomId;

  set activeRoomId(String roomId) {

    _activeRoomId = roomId;
    activeConversationId = '';
    notifyListeners();
  }
  

  
  void fetchData() async {
    try{
      final conversations = await ChatHelper.setConversations();
      final rooms = await RoomHelper.setRooms();
      notifyListeners();
    } catch (error) {
      throw Exception('Faild to populate converations');
    }
  }


  bool _isConnected = false;
  bool get isConnected => _isConnected;

  void setConnected(bool isConnected) {
    _isConnected = isConnected;
    notifyListeners();
  }

  void toggleConnected() {
    _isConnected = !_isConnected;
    notifyListeners();
  }

  void setDisconnected() {
    _isConnected = false;
    notifyListeners();
  }

  void setConnectedAndNotify() {
    _isConnected = true;
    notifyListeners();
  }
}