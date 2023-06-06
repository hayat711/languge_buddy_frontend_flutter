import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:language_buddy/controllers/chat_provider.dart';
import 'package:language_buddy/models/request/chat/message.model.dart';
import 'package:language_buddy/models/request/chat/room_model.dart';
import 'package:language_buddy/models/response/chat/ConversationModel.dart';
import 'package:language_buddy/models/response/chat/MessageModel.dart';
import 'package:language_buddy/views/common/custom_appbar.dart';
import 'package:language_buddy/views/common/drawer/drawer_widget.dart';
import 'package:logger/logger.dart';
import 'package:provider/provider.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;


class ChatList extends StatefulWidget {
  const ChatList({Key? key}) : super(key: key);

  @override
  State<ChatList> createState() => _ChatListState();
}

class _ChatListState extends State<ChatList> {

  List<ConversationModel> conversations = [];
  List<RoomModel> rooms = [];
  List<MesssageModel> messages = [];

  late IO.Socket socket;
  final Logger logger = Logger();


  @override
  void initState() {
    super.initState();
    final chatNotifier = Provider.of<ChatNotifier>(context, listen: false);
    chatNotifier.getConversations();
    chatNotifier.getRooms();

    socket = IO.io('ws://localhost:8001/chat', <String, dynamic>{
      'transports': ['websocket'],
      'autoConnect': false,
    });

    socket.on('connect', (_) => {
      logger.d('Socket connected 🚀 : ${socket.id}')
    });

    socket.on('disconnect', (_) => {
      logger.d('Socket disconnected 👋 : ${socket.id}')
    });

    socket.on('message:created', (message) {
      logger.d('message:created event: $message');

      if(chatNotifier.activeRoomId != null && message['room']['id'] == chatNotifier.activeRoomId) {
        // handel room-specific message
        // setMessages((messages) => [...messages, message]);
      }
      if(chatNotifier.activeConversationId != null && message['conversation']['id'] == chatNotifier.activeConversationId) {
        // handel conversation-specific message
        // setMessages((messages) => [...messages, message]);
      }
    });

    socket.emit('room:all');
    socket.emit('conversation:all');

  }


  

  @override
  Widget build(BuildContext context) {
    return Consumer<ChatNotifier>(builder: (context, chatNotifier, child){
      conversations = chatNotifier.getConversations as List<ConversationModel>;
      rooms = chatNotifier.getRooms as List<RoomModel>;

    // socket.emit('room:join', {'roomId': room.id })
    // socket.emit('conversation:join', {'conversationId': conversation.id })

      return Scaffold(
        appBar:  PreferredSize( preferredSize: const Size.fromHeight(50),
        child: CustomAppBar(
          text: 'Chat list',
           child: Padding(
              padding: EdgeInsets.all(12.0.h),
              child: const DrawerWidget(),
            ),
        ),
        ),
        body: ListView(
          children:  [
            const Text(
              'Chat list',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),

            // Display the conversations
            for (var conversation in conversations)
              ListTile(
                title: const Text('Conversation Name'),
                onTap: () {
                  // Set the active conversation
                  if (conversation != null) {
                    chatNotifier.setActiveConversationAndGetMessages(conversation);
                    // retrieve the messages from the conversation
                    //TODO retrieve messages

                    // List<MessageModel> newMessages = ...;
                    // chatNotifier.setMessages(newMessages);
                  }
                  Navigator.pushNamed(context, '/chat');
                },
              ),
            
            // Display the rooms

            for (var room in rooms)
              ListTile(
                title: const Text('Room Name'),
                onTap: () {
                  // Set the active room
                  if (room != null) {
                    chatNotifier.setActiveRoomAndGetMessages(room);
                    //TODO retrieve messages
                    // retrieve the messages from the room
                    // List<MessageModel> newMessages = ...;
                    // chatNotifier.setMessages(newMessages);
                  }
                  Navigator.pushNamed(context, '/chat');
                },
              ),
              
          ],
        ),
      );
    });
    
      
  }
}