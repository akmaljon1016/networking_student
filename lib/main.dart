import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Dio dio = Dio();
  Future<String>? response;

  Future<String> post(String title, String body, int userId) async {
    var response = await dio.post("https://jsonplaceholder.typicode.com/posts",
        data: {"title": title, "body": body, "userId": userId});
    return response.data.toString();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        width: MediaQuery.of(context).size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FutureBuilder(
                future: response,
                builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
                  return Text(snapshot.data.toString(),style: TextStyle(fontSize: 30),);
                }),
            MaterialButton(
              onPressed: () {
                setState(() {
                  response = post("Salom", "Hammaga", 2);
                });
              },
              child: Text("Post"),
              color: Colors.green,
            )
          ],
        ),
      ),
    );
  }
}
