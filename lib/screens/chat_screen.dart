import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:simple_application/components/chat_bubble.dart';
import 'package:simple_application/components/chat_input.dart';

class ChatScreen extends StatefulWidget {
  ChatScreen({super.key});

  final List<String> messages = [
    "Hey there! How's it going?",
    "Welcome to the family.",
    "Did you catch the game last night?",
    "I'll be there in 10 minutes.",
    "Can't wait for the weekend!",
    "Let's grab lunch tomorrow.",
    "Thanks for your help earlier.",
    "That sounds like a plan.",
    "Happy birthday! 🎉",
    "See you soon.",
  ];

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  void handleSubmit(String value) {
    setState(() {
      widget.messages.add(value);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(
          "Hi Nnaemeka",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        actions: [
          IconButton(
            onPressed: () {
              log("I pressed the logout button");
            },
            icon: Icon(Icons.logout, color: Colors.white),
          ),
        ],
      ),
      body: Container(
        color: Colors.black,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: widget.messages.length,
                itemBuilder: (BuildContext context, int index) {
                  final Alignment buttonAlignment = index % 2 == 0
                      ? Alignment.centerLeft
                      : Alignment.centerRight;
                  return ChatBubble(
                    message: widget.messages[index],
                    alignment: buttonAlignment,
                  );
                },
              ),
            ),
            ChatInputWidget(onSubmit: handleSubmit),
          ],
        ),
      ),
    );
  }
}
