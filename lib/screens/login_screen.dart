import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_firebase/screens/register_Screen.dart';
import 'package:flutter_firebase/services/auth_service.dart';

class LoginScreen extends StatelessWidget {
  TextEditingController emailController = TextEditingController();
  TextEditingController PasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Login"),
        centerTitle: true,
        backgroundColor: Colors.teal,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextField(
            controller: emailController,
            decoration: InputDecoration(
              labelText: 'Email',
              border: OutlineInputBorder(),
            ),
          ),
          SizedBox(
            height: 30,
          ),
          TextField(
            controller: PasswordController,
            decoration: InputDecoration(
              labelText: 'Password',
              border: OutlineInputBorder(),
            ),
          ),
          SizedBox(
            height: 30,
          ),
          Container(
            height: 50,
            width: MediaQuery.of(context).size.width,
            child: ElevatedButton(
              onPressed: () async {
                if (emailController.text == "" ||
                    PasswordController.text == "") {
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    content: Text("All Fields are required !"),
                    backgroundColor: Colors.red,
                  ));
                } else {
                  User? result = await AuthService()
                      .login(emailController.text, PasswordController.text);
                  if (result != null) {
                    print("Success");
                    print(result.email);
                  }
                }
              },
              child: Text(
                'Submit',
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
