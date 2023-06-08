import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:language_buddy/models/response/chat/ConversationModel.dart';
import 'package:language_buddy/views/ui/demo-chat/demo_chat.dart';
import 'package:language_buddy/views/ui/mainscreen.dart';

import '../../../constants/color_scheme.dart';
import '../../../constants/demo_conversations.dart';
import '../../../models/response/chat/RoomModel.dart';
import '../../common/custom_appbar.dart';

class ChatListDemo extends StatefulWidget {
  const ChatListDemo({Key? key}) : super(key: key);

  @override
  State<ChatListDemo> createState() => _ChatListState();
}

class _ChatListState extends State<ChatListDemo> {
  List<ConversationModel> conversations = [];
  List<RoomModel> rooms = [];

  @override
  void initState() {
    super.initState();
    // Create mock data for conversations
    conversations = loadConversations().cast<ConversationModel>();
  }

  void _openChatPage(String displayName) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ChatPage(displayName: displayName),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(preferredSize: const Size.fromHeight(50),
        child: CustomAppBar(
          text: 'Conversations',
          child: GestureDetector(
            child: const Icon(CupertinoIcons.arrow_left),
            onTap: () {
              Get.to(() => const MainScreen());
            },
          ),
        ),
      ),
      body: Row(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: conversations.length,
              itemBuilder: (context, index) {
                ConversationModel conversation = conversations[index];
                return Container(
                  decoration: BoxDecoration(
                    color: backgroundColor,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.3),
                        spreadRadius: 2,
                        blurRadius: 5,
                        offset: Offset(0, 1),
                      ),
                    ],
                  ),
                  margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                  child: ListTile(
                    leading: CircleAvatar(
                      child: Text(conversation.recipient.displayName[0]),
                    ),
                    title: Text(conversation.recipient.displayName),
                    onTap: () {
                      _openChatPage(conversation.recipient.displayName);
                      // Handle conversation selection
                      // ...
                    },
                  ),
                );
              },
            ),
          ),

        ],
      ),
    );
  }

// Rest of the code...
}
