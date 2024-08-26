import 'package:flutter/material.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
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
    );
  }
}
