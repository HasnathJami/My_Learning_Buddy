import 'package:flutter/material.dart';
import 'package:my_learning_buddy/drawer.dart';
import 'package:http/http.dart' as http;

void main() => runApp(MaterialApp(
      title: "Learning Buddy",
      home: Home(),
      // theme: ThemeData(
      //     primarySwatch:
      //         Colors.red // it changes the status bar and top bar color // not working on latest version
      //     ),
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
    print(res.body);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        title: Text("MLB"),
        backgroundColor: Colors.red,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: data != null
            ? SingleChildScrollView(
                child: Card(),
              )
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
