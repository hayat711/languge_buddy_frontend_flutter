
import 'package:flutter/material.dart';
import 'package:language_buddy/models/request/chat/room_model.dart';
import 'package:language_buddy/models/response/chat/ConversationModel.dart';
import 'package:language_buddy/services/helpers/chat_helper.dart';
import 'package:language_buddy/services/helpers/chat_room_helper.dart';

import '../models/response/chat/MessageModel.dart';

class ChatNotifier extends ChangeNotifier {

  String? _activeConversationId;
  String?  _activeRoomId;

  ChatNotifier() : _activeConversationId = null, _activeRoomId = null;


  String? get activeConversationId => _activeConversationId;

  set activeConversationId(String? conversationId) {
    _activeConversationId = conversationId;
    _activeRoomId = '';
    notifyListeners();
  }

  String? get activeRoomId => _activeRoomId;

  set activeRoomId(String? roomId) {

    _activeRoomId = roomId;
    _activeConversationId = '';
    notifyListeners();
  }
  

  void getConversations() async {
    try{
      final conversations = await ChatHelper.setConversations();
      notifyListeners();
    } catch (error) {
      throw Exception('Failed to populate conversations');
    }
  }
  void getRooms() async {
    try{
      final rooms = await RoomHelper.setRooms();
      notifyListeners();
    } catch (error) {
      throw Exception('Failed to populate rooms');
    }
  }

  List<MessageModel> messages = [];
  void setMessages(List<MessageModel> newMessages) {
    messages = newMessages;
    notifyListeners();
  }

  void setActiveRoomAndGetMessages(RoomModel room) {
    activeConversationId = null;
    messages = [];
    // leave the previous room if any; --> emit room:leave
    activeRoomId = room.id;
    // join the new room; --> emit room:join
    // get messages for the new room; --> emit message:get
    // reterive the messages from the new room
    notifyListeners();
  }

  void setActiveConversationAndGetMessages(ConversationModel conversation) {
    activeRoomId = null;
    messages = [];
    // leave the previous conversation if any; --> emit conversation:leave
    activeConversationId = conversation.id;
    // join the new conversation; --> emit conversation:join
    // get messages for the new conversation; --> emit message:get
    // reterive the messages from the new conversation
    notifyListeners();
  }


}