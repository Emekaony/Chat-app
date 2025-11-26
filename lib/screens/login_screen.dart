import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  final _formKey = GlobalKey<FormState>();
  final userNameController = TextEditingController();
  final passwordController = TextEditingController();

  // this will be triggered when the user presses the log in button
  void loginUser() {
    if (_formKey.currentState != null && _formKey.currentState!.validate()) {
      if (kDebugMode) {
        print("Log in Successiful");

        print("Username: ${userNameController.text}");
        print("Username: ${passwordController.text}");
      }
    }
  }

  String? validateUserName(String? userName) {
    String? message;
    if (userName != null) {
      if (userName.isEmpty) {
        message = "Username can NOT be empty";
      } else if (userName.isNotEmpty && userName.length < 5) {
        message = "Username must be greater than 4 characters";
      }
    }
    return message;
  }

  String? validatePassword(String? password) {
    String? message;
    if (password != null) {
      if (password.isEmpty) {
        message = "password CANNOT be empty!";
      } else if (password.isNotEmpty && password.length < 5) {
        message = "password must have more than 4 characters";
      }
    }
    return message;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text(
          "Hello",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
      body: Container(
        margin: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text(
              "Let's sign you in",
              style: TextStyle(
                color: Colors.brown,
                fontWeight: FontWeight.bold,
                fontSize: 24,
              ),
            ),
            const Text(
              "welcome back\nYou've been missed!",
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 10),
            Image.asset(
              "assets/images/silver_ball.jpg",
              fit: BoxFit.cover,
              height: 100,
              width: 100,
            ),
            SizedBox(height: 10),
            /*
            u need the TextFormField to be a descendant of this form for u to 
            be able to validate it using the formKey property
            */
            Form(
              key: _formKey,
              child: Column(
                children: [
                  // use a form field when u need a validator
                  // regular TextField does NOT have a validator property
                  TextFormField(
                    autocorrect: false,
                    controller: userNameController,
                    validator: (value) => validateUserName(value),
                    decoration: InputDecoration(
                      label: Text(("Username")),
                      // hintText: "enter your username",
                      border: OutlineInputBorder(),
                    ),
                  ),
                  SizedBox(height: 10),
                  TextFormField(
                    autocorrect: false,
                    controller: passwordController,
                    validator: (value) => validatePassword(value),
                    obscureText: true,
                    decoration: InputDecoration(
                      label: Text("Password"),
                      // hintText: "enter ur password",
                      border: OutlineInputBorder(),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                ElevatedButton(
                  onPressed: loginUser,
                  child: Text(
                    "Log In",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
