import 'package:demo1/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:demo1/customWidgets/loginTextField.dart';
import 'package:demo1/utils/spaces.dart';

class login extends StatelessWidget {
  login({Key? key}) : super(key: key);

  final _formkey = GlobalKey<FormState>();

  void loginUser(context) {
    if (_formkey.currentState != null && _formkey.currentState!.validate()) {
      Navigator.pushReplacementNamed(context, '/chat',
          arguments: '${userNameController.text}');
      print('login successful!');
    } else {
      print('not successful!');
    }
  }

  final userNameController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(left: 20.0, right: 20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Padding(
              padding: EdgeInsets.only(bottom: 50.0),
              child: CircleAvatar(
                radius: 50,
                backgroundImage: AssetImage('assets/img.png'),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Form(
                key: _formkey,
                child: Column(
                  children: [
                    loginInput(
                      controller: userNameController,
                      hintText: 'Type your username',
                      validator: (value) {
                        if (value != null &&
                            value.isNotEmpty &&
                            value.length < 5) {
                          return "Your username should be more than 5 characters";
                        } else if (value != null && value.isEmpty) {
                          return "Please type your username";
                        }
                        return null;
                      },
                      title: "Username, Email or Phone Number",
                    ),
                    verticalspacing(24),
                    loginInput(
                      controller: passwordController,
                      hintText: 'Type your Password',
                      obscure: true,
                      title: "Password",
                    ),
                  ],
                ),
              ),
            ),
            verticalspacing(0),
            Container(
              margin: const EdgeInsets.only(top: 30),
              child: ElevatedButton(
                  style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all(Colors.black)),
                  onPressed: () {
                    loginUser(context);
                  },
                  child: Text(
                    'Login',
                    style: ThemeTextStyle.loginTextButton,
                  )),
            )
          ],
        ),
      ),
    );
  }
}
