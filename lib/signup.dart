import 'package:flutter/material.dart';

class signup extends StatelessWidget {
  signup({Key? key}) : super(key: key);

  final _formkey = GlobalKey<FormState>();
  void loginUser() {
    if (_formkey.currentState!.validate()&&_formkey.currentState!=null) {
      print('login successful!');
      print(usernamecontroler.text);
      print(passwordcontroler.text);
    }else{
      print('login unsuccessful!');
    }
  }
  final usernamecontroler =TextEditingController();
  final passwordcontroler =TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Text(
                'logo',
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 30,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 0.5),
              ),
              const Text(
                'Welcome back! \n You\'ve been missed',
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
                    TextFormField(
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter a username';
                        }
                        if(value.length<6){
                          return 'Username must be at least 6 characters long';
                        }
                      },
                      controller: usernamecontroler,
                      decoration: InputDecoration(
                          hintText: 'Username',
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20))),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter a password';
                        }
                        if(value.length<6){
                          return 'Password must be at least 6 characters long';
                        }
                        //include regex check for password strength
                        if(!RegExp(r"^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)[a-zA-Z\d]{8,}$").hasMatch(value)){
                          return 'Password must contain at least 1 uppercase letter, 1 lowercase letter and 1 number';
                        }
                      },
                      controller: passwordcontroler,
                      obscureText: true,
                      decoration: InputDecoration(
                          hintText: 'Password',
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20))),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              ElevatedButton(
                  onPressed: loginUser,
                  child: const Text(
                      'Log In',
                      style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold)
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
