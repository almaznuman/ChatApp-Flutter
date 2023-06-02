import 'package:flutter/material.dart';
import 'package:demo1/customWidgets/chatBubble.dart';
import 'package:demo1/customWidgets/textInput.dart';

import 'models/chatmsgEntity.dart';

class chatscreen extends StatelessWidget {

  chatscreen({Key? key}) : super(key: key);

  final List<chatmsgEntity>_messages=[
    chatmsgEntity(msg: "Goddayum", id: "dadada`", time: "5.00", author: Author(username: "almaz")),
    chatmsgEntity(msg: "dsdsd", id: "dadada`", time: "5.00", author: Author(username: "almaz")),
    chatmsgEntity(msg: "Goddayuqeqem", id: "dadada`", time: "5.00", author: Author(username: "dumbass")),
    chatmsgEntity(msg: "Goddayum21111", id: "dadada`", time: "5.00", author: Author(username: "dumbass")),
    chatmsgEntity(msg: "Go23233ddayum", id: "dadada`", time: "5.00", author: Author(username: "dumbass"))
  ];
  @override
  Widget build(BuildContext context) {
    final username=ModalRoute.of(context)!.settings.arguments as String;
    return Scaffold(
      appBar: AppBar(
        title:  Text('$username',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30)),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.popAndPushNamed(context,'/');
              },
              icon: const Icon(Icons.logout)),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
                itemCount: _messages.length,
                itemBuilder: (BuildContext context, int index) {
                  return chatbubble(
                  entity:_messages[index],
                      align: _messages[index].author.username=="almaz"? Alignment.centerRight:Alignment.centerLeft);
                }),
          ),
           textinput()
        ],
      ),
    );
  }
}
