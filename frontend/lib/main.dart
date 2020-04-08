import 'dart:convert';
import 'dart:developer';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:frontend/BuildCheck.dart';
import 'package:http/http.dart' as http;

import 'BuildCheck.dart';
import 'number.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter spring demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Get random number'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Future<Number> futureNumber;
  Number _randomNumber = Number();
  static String base = BuildCheck.checkIf();

  @override
  void initState() {
    super.initState();
    _getRandomNumber();
  }

  void _getRandomNumber() async {
    _randomNumber = await fetchRandomNumber();
    setState(() {});
  }

  Future<Number> fetchRandomNumber() async {
    CircularProgressIndicator();
    final response = await http.get(base + '/v1/randomnumber');

    if (response.statusCode == 200) {
      // If the server did return a 200 OK response,
      // then parse the JSON.
      return Number.fromJson(json.decode(response.body));
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to load random number');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[new Text(_randomNumber.value.toString())]),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _getRandomNumber,
        tooltip: 'Get Random NUmber',
        child: Icon(Icons.refresh),
      ),
    );
  }
}
