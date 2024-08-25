import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(
    title: 'Learning Buddy',
    home: Home(),
  ));
}

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Learning Buddy"),
      ),
      body: Center(
        // alignment: Alignment.center,
        child: Container(
          alignment: Alignment.center,
          // padding: EdgeInsets.all(8),
          // color: Colors.teal,
          width: 100,
          height: 100,
          decoration: BoxDecoration(
              // shape: BoxShape.circle,
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                    color: Colors.grey.shade400,
                    blurRadius: 5,
                    offset: const Offset(2.0, 5.0)
                    // spreadRadius: 10,
                    )
              ],
              color: Colors.teal,
              gradient: const LinearGradient(colors: [Colors.yellow, Colors.pink])),
          child: const Text(
            "I am a Box tester",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20,
              color: Colors.white
            ),
          ),
        ),
      ),
    );
  }
}
