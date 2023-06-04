import 'package:demo1/customWidgets/Imagepicker.dart';
import 'package:demo1/models/chatmsgEntity.dart';
import 'package:flutter/material.dart';

class textinput extends StatelessWidget {
  final Function(ChatMessageEntity)onsubmit;
  textinput({Key? key,required this.onsubmit}) : super(key: key);

  final chatMessageController = TextEditingController();




  void onSendButtonPressed() {
    print('ChatMessage: ${chatMessageController.text}');
    final newchatmsg = ChatMessageEntity(text: chatMessageController.text,
        id:"555",
        createdAt:DateTime.now().microsecondsSinceEpoch,
        author: Author(userName: "almaz"));
    onsubmit(newchatmsg);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      decoration: const BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.vertical(top: Radius.circular(20))),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
            onPressed: () {
              showModalBottomSheet(context: context, builder: (BuildContext context){
                return ImagePicker();
              });
            },
            icon: const Icon(
              Icons.add,
              color: Colors.white,
            ),
          ),
          Expanded(
              child: TextField(
                cursorColor: Colors.white,
                keyboardType: TextInputType.multiline,
                scrollPhysics: ScrollPhysics(),
                maxLines: 5,
                minLines: 1,
                controller: chatMessageController,
                textCapitalization: TextCapitalization.sentences,
                style: const TextStyle(color: Colors.white),
                decoration: const InputDecoration(
                    hintText: "Type your message",
                    hintStyle: TextStyle(color: Colors.white),
                    border: InputBorder.none),
              )),
          IconButton(
            onPressed: onSendButtonPressed,
            icon: const Icon(
              Icons.send,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}