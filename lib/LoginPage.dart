import 'package:demo1/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:demo1/customWidgets/loginTextField.dart';
import 'package:demo1/utils/spaces.dart';

class login extends StatelessWidget {
  login({Key? key}) : super(key: key);

  final _formkey = GlobalKey<FormState>();

  void loginUser(context) {
    if (_formkey.currentState != null && _formkey.currentState!.validate()) {
      print(userNameController.text);
      print(passwordController.text);

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
      body: Container(
        margin: EdgeInsets.only(top: 50),
        child: SingleChildScrollView(
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const Text(
                    'Let\'s sign you in!',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 30,
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 0.5),
                  ),
                  const Text(
                    'Welcome back! \n You\'ve been missed!',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 20,
                        color: Colors.blueGrey),
                  ),
                  Form(
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
                        ),
                        verticalspacing(24),
                        loginInput(
                          controller: passwordController,
                          hintText: 'Type your Password',
                          obscure: true,
                        ),
                      ],
                    ),
                  ),
                  verticalspacing(24),
                  ElevatedButton(
                      onPressed: () {
                        loginUser(context);
                      },
                      child: const Text(
                        'Login',
                        style: TextStyle(fontSize: 24, fontWeight: FontWeight.w300),
                      )),
                  GestureDetector(
                    onTap: () {
                      //todo: Navigate to browser
                      print('Link clicked!');
                    },
                    child: const Column(
                      children: [
                        Text('Find us on'),
                        Text('Goddayum son'),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}