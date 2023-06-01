import 'package:flutter/material.dart';
import 'package:demo1/customWidgets/chatbubble.dart';
import 'package:demo1/customWidgets/textInput.dart';

class chatscreen extends StatelessWidget {

  const chatscreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final username=ModalRoute.of(context)!.settings.arguments as String;
    return Scaffold(
      appBar: AppBar(
        title:  Center(
          child: Text('$username',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30)),
        ),
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
                      message: "message",
                      align: index%2==0? Alignment.centerRight:Alignment.centerLeft);
                }),
          ),
           textinput()
        ],
      ),
    );
  }
}
