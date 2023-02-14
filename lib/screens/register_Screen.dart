import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_firebase/main.dart';
import 'package:flutter_firebase/screens/login_screen.dart';
import 'package:flutter_firebase/services/auth_service.dart';

class RegisterScreen extends StatelessWidget {
  TextEditingController emailController = TextEditingController();
  TextEditingController PasswordController = TextEditingController();
  TextEditingController ConfirmPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Register"),
        centerTitle: true,
        backgroundColor: Colors.orangeAccent,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
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
              TextField(
                controller: ConfirmPasswordController,
                decoration: InputDecoration(
                  labelText: 'Confirm Password',
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
                    } else if (PasswordController.text !=
                        ConfirmPasswordController.text) {
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        content: Text("PAssword dont match  !"),
                        backgroundColor: Colors.red,
                      ));
                    } else {
                      User? result = await AuthService().register(
                          emailController.text, PasswordController.text);
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
              SizedBox(
                height: 20,
              ),
              TextButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => LoginScreen(),
                        ));
                  },
                  child: Text("Alredy Login Account Log In Hear"))
            ],
          ),
        ),
      ),
    );
  }
}
