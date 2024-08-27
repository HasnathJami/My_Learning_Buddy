import 'package:flutter/material.dart';
import 'package:my_learning_buddy/main.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final userNameController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Login Page"),
        ),
        body: Stack(
          fit: StackFit.expand,
          children: [
            Image.asset(
              "assets/images/card_bg.jpg",
              fit: BoxFit.cover,
              color: Colors.black.withOpacity(0.7),
              colorBlendMode: BlendMode.darken,
            ),
            Center(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: SingleChildScrollView(
                  child: Card(
                    child: Column(
                      children: [
                        Form(
                            child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Column(
                            children: [
                              TextFormField(
                                decoration: InputDecoration(
                                    hintText: "Enter Username",
                                    labelText: "Username"),
                              ),
                              SizedBox(height: 20),
                              TextFormField(
                                obscureText: true,
                                decoration: InputDecoration(
                                    hintText: "Enter Password",
                                    labelText: "Password"),
                              )
                            ],
                          ),
                        )),
                        SizedBox(
                          height: 20,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: FilledButton(
                              onPressed: () {
                                // Navigator.push(
                                //     context,
                                //     MaterialPageRoute(
                                //         builder: (context) => Home()));
                                Navigator.pushNamed(context, "/home");
                              },
                              child: Text("Sign In"),
                              style: FilledButton.styleFrom(
                                  backgroundColor: Colors.orange,
                                  textStyle: TextStyle(color: Colors.white))),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ));
  }
}
