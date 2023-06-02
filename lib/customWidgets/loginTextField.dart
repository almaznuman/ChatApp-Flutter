import 'package:flutter/material.dart';
import 'package:demo1/utils/styles.dart';

class loginInput extends StatelessWidget {
  final hintText;
  final FormFieldValidator<String>? validator;
  final TextEditingController controller;
  final bool obscure;
  final String title;

  const loginInput({Key? key, required this.hintText,this.validator, required this.controller,this.obscure=false,required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      //round corners of textfield
//decoration: InputDecoration(borderRadius: BorderRadius.circular(10)),
      obscureText: obscure,
      validator: (value) {
        if(validator!=null){
          return validator!(value);
        }
      },
      controller: controller,
      decoration: InputDecoration(
        label: Text(title),labelStyle: ThemeTextStyle.loginTextFieldStyle,
          hintText: hintText,
          hintStyle: ThemeTextStyle.loginHintText,
          border: OutlineInputBorder(),),
    );
  }
}
