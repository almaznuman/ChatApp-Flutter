import 'package:flutter/material.dart';

class chatbubble extends StatelessWidget {
  final Alignment align;
  final String message;
  const chatbubble({Key? key,required this.message,required this.align}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: align,
      child: Container(
        padding: const EdgeInsets.all(24),
        margin: const EdgeInsets.all(30),
        decoration: const BoxDecoration(
            color: Colors.grey,
            borderRadius: BorderRadius.all(Radius.circular(20))),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text('$message', style: TextStyle(fontSize: 30)),
            Image.network(
                "https://images.unsplash.com/photo-1685469481281-61c0a91784ba?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwcm9maWxlLXBhZ2V8MXx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1000&q=60",
                scale: 5)
          ],
        ),
      ),
    );
  }
}