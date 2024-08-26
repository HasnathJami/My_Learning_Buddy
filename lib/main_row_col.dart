import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
      title: "LBuddy",
      home: Home(),
    ));

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Learning Buddy"),
        backgroundColor: Colors.green,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Align(
          alignment: Alignment.centerRight,
          child: Container(
            // width: MediaQuery.of(context).size.width,
            // height: MediaQuery.of(context).size.height/2,
            width: 400,
            height: 600,
            color: Colors.black,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  width: 100,
                  height: 100,
                  color: Colors.green,
                  padding: EdgeInsets.all(8),
                ),
                Container(
                  width: 100,
                  height: 100,
                  color: Colors.red,
                  padding: EdgeInsets.all(8),
                ),
                Container(
                  width: 100,
                  height: 100,
                  color: Colors.yellow,
                  padding: EdgeInsets.all(8),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
