import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:language_buddy/controllers/chat_provider.dart';
import 'package:language_buddy/models/request/chat/conversation_model.dart';
import 'package:language_buddy/models/request/chat/message.model.dart';
import 'package:language_buddy/models/request/chat/room_model.dart';
import 'package:language_buddy/services/helpers/chat_helper.dart';
import 'package:language_buddy/views/common/custom_appbar.dart';
import 'package:language_buddy/views/common/drawer/drawer_widget.dart';
import 'package:provider/provider.dart';

class ChatList extends StatefulWidget {
  const ChatList({Key? key}) : super(key: key);

  @override
  State<ChatList> createState() => _ChatListState();
}

class _ChatListState extends State<ChatList> {
  List<ConversationModel> conversations = [];
  List<RoomModel> rooms = [];
  List<MesssageModel> messages = [];

  @override
  void initState() {
    super.initState();
    // fetch the conversation and rooms when the widget is initalized
    Provider.of<ChatNotifier>(context, listen: false).fetchData();
  }

  

  @override
  Widget build(BuildContext context) {
    return Consumer<ChatNotifier>(builder: (context, chatNotifier, child){
      chatNotifier.activeConversationId;
      chatNotifier.activeRoomId;

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
                title: Text('Conversation Name'),
                onTap: () {
                  // Set the active conversation
                  // chatNotifier.activeConversationId = conversation.id;
                  Navigator.pushNamed(context, '/chat');
                },
              ),
            
            // Display the rooms

            for (var room in rooms)
              ListTile(
                title: Text('Room Name'),
                onTap: () {
                  // Set the active room
                  // chatNotifier.activeRoomId = room.id;
                  Navigator.pushNamed(context, '/chat');
                },
              ),
              
          ],
        ),
      );
    });
    
      
  }
}