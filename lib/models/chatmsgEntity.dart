import 'package:flutter/material.dart';
class chatmsgEntity{
  String msg;
  String? imageurl;
  String id;
  String time;
  Author author;
  chatmsgEntity({required this.msg,this.imageurl,required this.id,required this.time,required this.author});
}

class Author{
  String username;
  Author({required this.username});
}