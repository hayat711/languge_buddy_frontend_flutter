import 'package:logger/logger.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;


class SocketService {
  final IO.Socket socket;
  final Logger logger = Logger();

  SocketService(String url) : socket = IO.io(url, <String, dynamic> {
    'transports': ['websocket'],
  });

  void connect() {
    socket.connect();
    logger.d('Socket connected 🚀 : ${socket.id}');
  }

  void disconnect() {
    socket.disconnect();
    logger.d('socket disconnected 👋 : ${socket.id}');
  }

  void sendMessage(String message) {
    socket.emit('create:message', message);
    logger.d('Message sent 😃: $message');
  }

  void sendTyping(String username) {
    socket.emit('typing', username);
    logger.d('Typing: 🥳 $username');
  }

  void listenToRoomAll(void Function(dynamic) onRoomAllReceived) {
    socket.on('room:all', (data) {
      logger.d('Room received room:all: $data');
      onRoomAllReceived(data);
    });
  }

  void listenToConversationAll(void Function(dynamic) onConversationAllReceived) {
    socket.on('conversation:all', (data) {
      logger.d('Conversation received conversation:all: $data');
      onConversationAllReceived(data);
    });
  }

  void listenToMessageCreated(void Function(dynamic) onMessageCreated) {
    socket.on('message:created', (data) {
      logger.d('Received message:created event: $data');
      onMessageCreated(data);
    });
  }

  void emitCreateMessage(String message, String chatId, String type) {
    final data = {'message': message, 'chatId': chatId, 'type': type};
    socket.emit('message:created', data);
    logger.d('Emitting message:created event: $data');
  }

  void listenToMessages(void Function(dynamic) onMessageReceived) {
    socket.on('create:message', (data) {
      logger.d('Received create:message event: $data');
      onMessageReceived(data);
    });
  }
}