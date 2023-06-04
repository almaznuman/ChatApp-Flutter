import 'dart:convert';
import 'package:demo1/models/image.dart';
import 'package:demo1/repo/imagesrepo.dart';
import 'package:demo1/customWidgets/textInput.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'customWidgets/chatBubble.dart';
import 'models/chatmsgEntity.dart';

class chatscreen extends StatefulWidget {
  chatscreen({Key? key}) : super(key: key);

  @override
  State<chatscreen> createState() => _chatscreenState();
}

class _chatscreenState extends State<chatscreen> {
  //initiate state of messages
  List<ChatMessageEntity> _messages = [];

  _loadInitialMessages() async {
    final response = await rootBundle.loadString('assets/msg.json');

    final List<dynamic> decodedList = jsonDecode(response) as List;

    final List<ChatMessageEntity> _chatMessages = decodedList.map((listItem) {
      return ChatMessageEntity.fromJson(listItem);
    }).toList();

    //final state of the messages
    setState(() {
      _messages = _chatMessages;
    });
  }

  @override
  void initState() {
    _loadInitialMessages();;
    super.initState();
  }

  onMessagesent(ChatMessageEntity entity) {
    _messages.add(entity);
    setState(() {});
  }
  @override
  Widget build(BuildContext context) {
    final username = ModalRoute.of(context)!.settings.arguments as String;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text('Hi $username!'),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.pushReplacementNamed(context, '/');
                print('Icon pressed!');
              },
              icon: Icon(Icons.logout))
        ],
      ),
      body: Column(
        children: [
          Expanded(
              child: ListView.builder(
                  itemCount: _messages.length,
                  itemBuilder: (context, index) {
                    return ChatBubble(
                        alignment: _messages[index].author.userName == "almaz"
                            ? Alignment.centerRight
                            : Alignment.centerLeft,
                        entity: _messages[index]);
                  })),
          textinput(onsubmit: onMessagesent),
        ],
      ),
    );
  }
}
