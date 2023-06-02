import 'package:flutter/material.dart';
import 'package:demo1/customWidgets/chatBubble.dart';
import 'package:demo1/customWidgets/textInput.dart';

import 'models/chatmsgEntity.dart';

class chatscreen extends StatelessWidget {

  const chatscreen({Key? key}) : super(key: key);

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
                itemCount: 10,
                itemBuilder: (BuildContext context, int index) {
                  return chatbubble(
                  entity:chatmsgEntity(id: "12",msg: "hi",time: "2:00",author: Author(username: "Almaz")),
                      align: index%2==0? Alignment.centerRight:Alignment.centerLeft);
                }),
          ),
           textinput()
        ],
      ),
    );
  }
}
