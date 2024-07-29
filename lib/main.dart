import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/rendering.dart';


void main() {
  runApp(MyApp());
}
 class  MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

void getChat() async {
    String _responseBody = '';
    Uri url = Uri.parse('http://65.108.148.136:8085/Chat/get-chats');

    try {
      var response = await http.get(url);
      if (response.statusCode == 200) {
        var jsonResponse = json.decode(response.body);
        setState(() {
          _responseBody = jsonResponse.toString();
        });
      } else {
        setState(() {
          _responseBody = 'Request failed with status: ${response.statusCode}';
        });
      }
    } catch (e) {
      setState(() {
        _responseBody = 'Failed to connect to the server: $e';
      });
    }
  }
class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          actions: const [
             Text("idiev.18"),
            Icon(Icons.keyboard_arrow_down_outlined),
            SizedBox(width: 350,),
            Padding(
              padding: EdgeInsets.all(20.0),
              child: Icon(Icons.edit),
            )
          ],
        ),
        body: Column(children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: "Search...",
                focusedBorder: OutlineInputBorder(),
              ),
            ),
          )
        ],),
      ),
    );
  }
}

