import 'package:flutter/material.dart';
import 'package:demo1/models/chatmsgEntity.dart';

class chatbubble extends StatelessWidget {
  final chatmsgEntity entity;
  final Alignment align;
  const chatbubble({Key? key,required this.entity,required this.align}) : super(key: key);

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
            Text('${entity.msg}', style: TextStyle(fontSize: 30)),
            if(entity.imageurl!=null)
              Image.network(
                  '${entity.msg}',
                  scale: 5)
          ],
        ),
      ),
    );
  }
}