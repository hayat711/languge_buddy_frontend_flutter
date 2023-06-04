import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:language_buddy/constants/color_scheme.dart';
import 'package:language_buddy/controllers/chat_provider.dart';
import 'package:language_buddy/views/common/custom_appbar.dart';
import 'package:language_buddy/views/common/drawer/drawer_widget.dart';
import 'package:language_buddy/views/common/exports.dart';
import 'package:provider/provider.dart';

import '../../../models/response/chat/MessageModel.dart';


class Chat extends StatelessWidget {
  const Chat({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<ChatNotifier> (builder: (context, chatNotifier, child) {
      List<MessageModel> messages = chatNotifier.messages;
      return  Scaffold(
        appBar: PreferredSize(preferredSize: Size.fromHeight(50.h),
            child: CustomAppBar(
              text: 'Chat',
              child: ListView.builder(
                itemCount: messages.length,
                padding: EdgeInsets.all(12.0.h),
                itemBuilder: (BuildContext context, int index) {
                  MessageModel message = messages[index];
                  return ListTile(
                    title: ReusableText(text: message.author.displayName,
                      style: appstyle(12, contentColor, FontWeight.w400),
                    ),
                    subtitle: ReusableText(text: message.text,
                      style: appstyle(18, contentColor, FontWeight.w500),
                    ),
                  );
                },
              ),
            )
        ),
      );
    });
  }
}