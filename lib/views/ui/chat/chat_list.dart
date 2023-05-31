import 'package:flutter/material.dart';

class ChatList extends StatelessWidget {
  const ChatList({Key? key}) : super(key: key);

  @override
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Chat List'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Welcome to Language Buddy & please sign up!',
              style: TextStyle(fontSize: 24),
            ),

            // add sign-in form fields and logic here

          ],
        ),
      ),
    );
  }
}