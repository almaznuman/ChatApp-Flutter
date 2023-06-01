import 'package:flutter/material.dart';

class CounterStateful extends StatefulWidget {

  final Color color;
  final Color textcolor;

  const CounterStateful({Key? key, required this.color,required this.textcolor}) : super(key: key);

  @override
  State<CounterStateful> createState() => _CounterStatefulState();
}

class _CounterStatefulState extends State<CounterStateful> {
  int counter=0;
  void _increment(){
    setState(() {
      counter++;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text("Counter App"))),
      floatingActionButton: FloatingActionButton(
        backgroundColor: widget.color,
        onPressed: () {
          _increment();
        },
        child: Icon(Icons.add,color: widget.textcolor),
      ),
      body: Center(child: Text("$counter", style: TextStyle(fontSize: 20))),
    );
  }
}
