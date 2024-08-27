import 'package:flutter/material.dart';
import 'package:my_learning_buddy/home_page_with_future_builder.dart';
import 'package:my_learning_buddy/utils/PreferencesUtil.dart';
import 'home_page.dart';
import 'login_page.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // PreferencesUtil.preferences = await SharedPreferences.getInstance();
  await PreferencesUtil.initPrefs();

  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    title: "Learning Buddy",
    home: PreferencesUtil.preferences.getBool("loggedIn") == true
        ? HomeFb()
        : LoginPage(),
    routes: {"/login": (context) => LoginPage(), "/home": (context) => HomeFb()},
    // theme: ThemeData(
    //     primarySwatch:
    //     Colors.purple // it changes the status bar and top bar color
    // ),
  ));
}
