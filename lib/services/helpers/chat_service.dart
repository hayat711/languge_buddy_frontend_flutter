import 'package:logger/logger.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;


class ChatService {
  final IO.Socket socket;
  final logger = Logger();

  ChatService(String url) : socket = IO.io(url, <String, dynamic> {
    'transports': ['websocket'],
  });

  void connect() {
    socket.connect();
    logger.d(' chat srever connected 🚀');
  }

  void disconnect() {
    socket.disconnect();
    logger.d('disconnected 👋');
  }

  void sendMessage(String message) {
    socket.emit('create:message', message);
    logger.d('Message sent 😃: $message');
  }

  void sendTyping(String username) {
    socket.emit('typing', username);
    logger.d('Typing: 🥳 $username');
  }

  void listenToMessages(void Function(dynamic) onMessageReceived) {
  socket.on('create:message', (data) {
    logger.d('Message received: $data');
    onMessageReceived(data);
  });
  }
}