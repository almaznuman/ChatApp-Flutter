import 'package:flutter/material.dart';
import 'package:demo1/utils/styles.dart';

class loginInput extends StatelessWidget {
  final hintText;
  final FormFieldValidator<String>? validator;
  final TextEditingController controller;
  final bool obscure;

  const loginInput({Key? key, required this.hintText,this.validator, required this.controller,this.obscure=false}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: (value) {
        if(validator!=null){
          return validator!(value);
        }
      },
      controller: controller,
      decoration: InputDecoration(
          hintText: hintText,
          hintStyle: ThemeTextStyle.loginTextFieldStyle,
          border: OutlineInputBorder()),
    );
  }
}
