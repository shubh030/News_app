import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_firebase/screens/register_Screen.dart';
import 'package:flutter_firebase/services/auth_service.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:provider/provider.dart';
import 'package:flutter_firebase/services/google_sign_in.dart';

import 'homepage.dart';

class LoginScreen extends StatelessWidget {
  TextEditingController emailController = TextEditingController();
  TextEditingController PasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    ChangeNotifierProvider(
      create: (context) => GoogleSignInProvider(),
    );

    return Scaffold(
      appBar: AppBar(
        title: Align(
            alignment: Alignment.centerLeft,
            child: Text(
              "Social",
              style: TextStyle(fontSize: 30),
            )),
        centerTitle: true,
        backgroundColor: Colors.red,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.redAccent),
                  borderRadius: BorderRadius.circular(20)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Container(
                      width: 100,
                      child: TextButton(
                          onPressed: () {},
                          style: TextButton.styleFrom(
                            backgroundColor: Colors.red,
                            minimumSize: Size(100, 50),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.only(
                              topLeft: Radius.zero,
                              topRight: Radius.zero,
                              bottomLeft: Radius.circular(20.0),
                              bottomRight: Radius.circular(20.0),
                            )),
                          ),
                          child: Text(
                            "Login",
                            style: TextStyle(fontSize: 20, color: Colors.white),
                          )),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Container(
                      width: 150,
                      child: TextButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => RegisterScreen(),
                                ));
                          },
                          style: TextButton.styleFrom(
                            backgroundColor: Colors.white,
                            padding: EdgeInsets.all(20.0),
                            minimumSize: Size(100, 50),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.only(
                              topLeft: Radius.zero,
                              topRight: Radius.zero,
                              bottomLeft: Radius.circular(20.0),
                              bottomRight: Radius.circular(20.0),
                            )),
                          ),
                          child: Text(
                            "SignUp",
                            style: TextStyle(color: Colors.grey, fontSize: 20),
                          )),
                    ),
                  )
                ],
              ),
            ),
            TextFormField(
              controller: emailController,
              decoration: InputDecoration(
                suffixIcon: Icon(
                  Icons.email,
                  color: Colors.red.shade500,
                ),
                labelText: 'Email',
                labelStyle: TextStyle(color: Colors.black),
                hintText: 'johndoe@gmail.com',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            TextFormField(
              controller: PasswordController,
              decoration: InputDecoration(
                suffixIcon: Icon(
                  Icons.lock,
                  color: Colors.red.shade500,
                ),
                labelText: 'Password',
                labelStyle: TextStyle(color: Colors.black),
                hintText: 'Password',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            TextButton(
                onPressed: () {},
                child: Text(
                  'Forgot Password ?',
                  style: TextStyle(color: Colors.red),
                )),
            SizedBox(
              height: 10,
            ),
            Container(
              child: Text(
                "Login with ",
                style: TextStyle(fontSize: 20),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            InkWell(
                onTap: () {
                  final provider =
                      Provider.of<GoogleSignInProvider>(context, listen: false);
                  provider.googleLogin();
                },
                child: Container(
                  width: 100,
                  height: 80,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Container(
                          // decoration: BoxDecoration(color: Colors.blue),
                          child: Image.network(
                              'http://pngimg.com/uploads/google/google_PNG19635.png',
                              fit: BoxFit.cover)),
                      SizedBox(
                        width: 5.0,
                      ),
                    ],
                  ),
                )),
            Container(
              height: 50,
              width: MediaQuery.of(context).size.width,
              child: TextButton(
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
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Homepage(),
                        ));
                  }
                },
                style: TextButton.styleFrom(
                  backgroundColor: Colors.red,
                  minimumSize: Size(100, 50),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20.0),
                    topRight: Radius.circular(20.0),
                    bottomLeft: Radius.zero,
                    bottomRight: Radius.zero,
                  )),
                ),
                child: Text(
                  'LogIn',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
