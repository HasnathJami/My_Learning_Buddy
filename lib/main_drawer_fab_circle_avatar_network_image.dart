import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
      title: "Learning Buddy",
      home: Home(),
      theme: ThemeData(
          primarySwatch:
              Colors.purple // it changes the status bar and top bar color
          ),
    ));

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}


class _HomeState extends State<Home> {

  TextEditingController _nameController = TextEditingController();
  var myText = "Change Me";

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        title: Text("MLB"),
        // backgroundColor: Colors.brown,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Card(
            child: Column(
              children: [
                Image.asset(
                  "assets/images/card_bg.jpg",
                  // height: 100,
                  // width: 100,
                  fit: BoxFit.cover,
                ),
                SizedBox(height: 20),
                Text(myText, style: TextStyle(
                  fontWeight: FontWeight.bold
                ) ),
                SizedBox(height: 20,),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: TextField(
                    controller: _nameController,
                    keyboardType: TextInputType.text,
                    // obscureText: true,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: "Enter something here",
                      label: Text("Name"),
                    ),
                  ),
                )

              ],
            ),
          ),
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
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            // DrawerHeader(
            //   child: Text("Hi, from My Learning Buddy", style: TextStyle(
            //     color: Colors.white
            //   ),),
            //   decoration: BoxDecoration(color: Colors.purple),
            // ),
            UserAccountsDrawerHeader(
              accountName: Text("Hasnath Jami"),
              accountEmail: Text("j@gmail.com"),
              // currentAccountPicture: Image.network("https://media.istockphoto.com/id/1293771966/photo/happy-man-with-arms-outstretched-at-park.jpg?s=2048x2048&w=is&k=20&c=AuJgsAPKbp5w0Qn_ElBL_0ZcHm8Z7XAPkDtpS7ET_ag="),
              currentAccountPicture: CircleAvatar(
                backgroundImage: NetworkImage(
                    "https://media.istockphoto.com/id/1293771966/photo/happy-man-with-arms-outstretched-at-park.jpg?s=2048x2048&w=is&k=20&c=AuJgsAPKbp5w0Qn_ElBL_0ZcHm8Z7XAPkDtpS7ET_ag="),
              ),
            ),
            ListTile(
              leading: Icon(Icons.person),
              title: Text("Account"),
              subtitle: Text("Personal"),
              trailing: Icon(Icons.edit),
            ),
            ListTile(
              leading: Icon(Icons.email),
              title: Text("Emailo"),
              subtitle: Text("j@gmail.com"),
              trailing: Icon(Icons.send),
            ),
          ],
        ),
      ),
    );
  }
}
