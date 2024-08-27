import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:my_learning_buddy/utils/PreferencesUtil.dart';
import '../drawer.dart';

class HomeSb extends StatelessWidget {
  TextEditingController _nameController = TextEditingController();

  // @override
  Future getData() async {
    var url = "https://jsonplaceholder.typicode.com/photos";
    var data;

    Dio dio = Dio();
    try {
      var response = await dio.get(url);
      data = response.data;
      // setState(() {});
      return data;
    } on DioError catch (e) {
      if (e.response != null) {
        // The server responded with an error code and data
        print("Server error: ${e.response?.statusCode}");
        print("Data: ${e.response?.data}");
      } else {
        // Something happened in setting up or sending the request that triggered an Error
        print("Error sending request: ${e.message}");
      }
    } catch (e) {
      // Handle any other type of error
      print("Unexpected error: $e");
    }
  }

  Stream<List<String>> getStreamData() {
    var data = Stream<List<String>>.fromIterable([
      List<String>.generate(20, (index) => "Item $index")
    ]);

    return data;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        title: Text("MLB FB"),
        backgroundColor: Colors.brown,
        actions: [
          IconButton(
            icon: Icon(Icons.exit_to_app),
            onPressed: () {
              PreferencesUtil.preferences.setBool("loggedIn", false);
              Navigator.pushReplacementNamed(context, "/login");
            },
          )
        ],
      ),
      body: StreamBuilder(
        stream: getStreamData() ,
        builder: (context, snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.none:
              return Center(
                child: Text("fetch something"),
              );
            case ConnectionState.active:
            case ConnectionState.waiting:
              return Center(
                child: CircularProgressIndicator(),
              );
            case ConnectionState.done:
              if (snapshot.hasError) {
                return Center(
                  child: Text("Some Error Occured"),
                );
              } else {
                return ListView.builder(
                  // gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: ListTile(
                          title: Text(snapshot.data![index]),
                        ),
                      );
                    },
                    itemCount: snapshot.data?.length);
              }
          }
        },
      ),
      // floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // myText = _nameController.text;
        },
        child: Icon(Icons.refresh),
        mini: false,
      ),
      drawer: MyDrawer(),
    );
  }
}
