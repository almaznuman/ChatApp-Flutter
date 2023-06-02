import 'package:demo1/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:demo1/customWidgets/loginTextField.dart';
import 'package:demo1/utils/spaces.dart';
import 'package:social_media_buttons/social_media_button.dart';
import 'package:url_launcher/url_launcher.dart';

class login extends StatelessWidget {
  login({Key? key}) : super(key: key);

  final _formkey = GlobalKey<FormState>();
  final _mainUrl = "https://www.google.com";

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
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              //crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                CircleAvatar(
                  radius: 50,
                  backgroundImage: AssetImage('assets/img.png'),
                ),
                Padding(
                  padding: const EdgeInsets.all(20.0),
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
                          title: "Username",
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
                ElevatedButton(
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
                GestureDetector(
                  onTap: () async {
                    print('Link clicked!');
                    if (!await launch(_mainUrl)) {
                      throw 'Could not launch this!';
                    }
                  },
                  child: Column(
                    children: [
                      const Text('Find us on'),
                      Text(_mainUrl),
                    ],
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(top: 10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SocialMediaButton.twitter(url:"https://twitter.com/home",size: 30),
                      SocialMediaButton.facebook(url:"",size: 30)
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
