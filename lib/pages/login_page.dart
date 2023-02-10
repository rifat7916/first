import 'package:flutter/material.dart';

import '../utilities/routes.dart';

class LoginPage extends StatefulWidget {
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String name = "";
  bool changeButton = false;
  final _formKey = GlobalKey<FormState>();

  moveToHome(BuildContext context) async {
    if (_formKey.currentState!.validate()) {
      setState(() {
        changeButton = true;
      });
      await Future.delayed(Duration(seconds: 1));
      await Navigator.pushNamed(context, MyRoutes.homeRoute);
      setState(() {
        changeButton = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      child: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(children: [
            Image.asset(
              "assests/images/image1.png",
              fit: BoxFit.cover,
            ),
            SizedBox(height: 20),
            Text(
              "Welcome $name",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 32),
              child: Column(
                children: [
                  TextFormField(
                    decoration: InputDecoration(
                      hintText: "Enter Username",
                      labelText: "Username",
                    ),
                    validator: (String? value) {
                      if ( value!.isEmpty) {
                        return "Username can't be empty";
                      }

                      return null;
                    },
                    onChanged: (value) {
                      name = value;
                      setState(() {});
                    },
                  ),
                  TextFormField(
                    obscureText: true,
                    decoration: InputDecoration(
                      hintText: "Enter Password",
                      labelText: "Password",
                    ),
                    validator: (String? value) {
                      if (value!.isEmpty) {
                        return "Password can't be empty";
                      }
                      else if (value.length > 6) {
                        return "Password length should be at least 6";
                      }
                      return null;
                    },
                  ),

                  SizedBox(height: 50),

                  Material(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(changeButton ? 20 : 8),
                    child: InkWell(
                      onTap: () => moveToHome(context),
                      child: AnimatedContainer(
                       duration: Duration(seconds: 1),
                       width: changeButton ? 100 : 150,
                       height: 50,
                       alignment: Alignment.center,
                       child: changeButton
                            ? Icon(
                                Icons.done,
                                color: Colors.white,
                              )
                            : Text(
                                "Log in",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20),
                              ),

                        // shape: changeButton?BoxShape.circle: BoxShape.rectangle,
                      ),
                    ),
                  )

                  // ElevatedButton(
                  //   child: Text("Log in"),
                  //   style: TextButton.styleFrom(minimumSize: Size(150, 80)),
                  //   onPressed: () {
                  //     Navigator.pushNamed(context, MyRoutes.homeRoute);
                  //   },
                  // ),
                ],
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
