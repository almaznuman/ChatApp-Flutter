import 'package:flutter/material.dart';

class textinput extends StatelessWidget {
  textinput({Key? key}) : super(key: key);

  final chatMessageController = TextEditingController();

  void onSendButtonPressed() {
    print('ChatMessage: ${chatMessageController.text}');
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
            onPressed: () {},
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