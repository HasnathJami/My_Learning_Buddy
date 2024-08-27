import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:my_learning_buddy/drawer.dart';

import 'login_page.dart';

void main() => runApp(MaterialApp(
      title: "Learning Buddy",
      home: LoginPage(),
      routes: {
        "/login": (context) => LoginPage(),
        "/home": (context) => Home()
      },
      // theme: ThemeData(
      //     primarySwatch:
      //     Colors.purple // it changes the status bar and top bar color
      // ),
    ));

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  TextEditingController _nameController = TextEditingController();
  var myText = "Change Me";
  var url = "https://jsonplaceholder.typicode.com/photos";
  var data;

  @override
  void initState() {
    super.initState();
    getData();
  }

  getData() async {
    var res = await http.get(Uri.parse(url));
    // print(res.body);
    data = jsonDecode(res.body);
    print(data);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        title: Text("MLB Main"),
        backgroundColor: Colors.brown,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: data != null
            ? ListView.builder(
                // gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: ListTile(
                      title: Text(data[index]["title"]),
                      subtitle: Text("ID: ${data[index]["id"]}"),
                      leading: Image.network(
                        "https://images.unsplash.com/photo-1721332153521-120cb0cd02d9?q=80&w=1935&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDF8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
                        height: 100,
                        width: 200,
                        fit: BoxFit.cover,
                      ),
                    ),
                  );
                },
                itemCount: data.length)
            : Center(
                child: CircularProgressIndicator(),
              ),
      ),
      // floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // myText = _nameController.text;
          setState(() {
            myText = _nameController.text;
          });
        },
        child: Icon(Icons.refresh),
        mini: false,
      ),
      drawer: MyDrawer(),
    );
  }
}
