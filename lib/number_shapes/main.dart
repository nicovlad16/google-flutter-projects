import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Number Shapes',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      home: const MyHomePage(title: 'Number Shapes'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String textInput;
  int number;
  String result;
  final String hintText = 'type number';

  Future<void> _showMyDialog() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: true, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('$number'),
          content: SingleChildScrollView(
            child: Text(result),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: <Widget>[
            const Text('Please input a number to see if it is square or cube.'),
            TextFormField(
              inputFormatters: <FilteringTextInputFormatter>[FilteringTextInputFormatter.digitsOnly],
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                hintText: hintText,
                border: const UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.blue),
                ),
              ),
              onChanged: (String value) {
                setState(() {
                  textInput = value;
                });
              },
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          if (textInput == null) {
          } else {
            number = int.tryParse(textInput);

            if (_isSquare(number) && _isCube(number)) {
              result = 'Number $number is both SQUARE and CUBE.';
            } else if (_isSquare(number)) {
              result = 'Number $number is SQUARE.';
            } else if (_isCube(number)) {
              result = 'Number $number is CUBE.';
            } else {
              result = 'Number $number is neither SQUARE nor CUBE.';
            }
          }

          _showMyDialog();
        },
        child: const Icon(Icons.verified),
        backgroundColor: Colors.blue,
      ),
    );
  }
}

bool _isCube(int number) {
  return number == pow(pow(number, 1 / 3), 3);
}

bool _isSquare(int number) {
  return sqrt(number) == sqrt(number).toInt();
}
