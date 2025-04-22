import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final apiUrl = Uri.parse("https://jsonplaceholder.typicode.com/posts");
  TextEditingController titleController = TextEditingController();
  TextEditingController bodyController = TextEditingController();

  Future<void> sendPostRequest() async {
    var response = await http.post(apiUrl,
        headers: {"Content-Type": "application/json"},
        body: jsonEncode({
          "title": titleController.text,
          "body": bodyController.text,
          "userId": 1,
        }));

    if (response.statusCode == 201) {
      // Scaffold.of(context).showSnackBar(SnackBar(
      //   content: Text("Post created successfully!"),
      // ));
      print('Post created successfully!');
    } else {
      // Scaffold.of(context).showSnackBar(SnackBar(
      //   content: Text("Failed to create post!"),
      // ));
      print('Failed to create post!');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter POST Request Example'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            TextField(
              controller: titleController,
              decoration: InputDecoration(hintText: "Title"),
            ),
            TextField(
              controller: bodyController,
              decoration: InputDecoration(hintText: "Body"),
            ),
            ElevatedButton(
              onPressed: sendPostRequest,
              child: Text("Create Post"),
            ),
          ],
        ),
      ),
    );
  }
}
