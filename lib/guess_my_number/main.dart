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
      title: 'Guess My Number',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      home: const MyHomePage(title: 'Guess My Number'),
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
  int randomNumber = Random().nextInt(100);
  String textInput;
  String guess;
  final String hintText = 'type number';

  Future<void> _showMyDialog() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('You guessed right'),
          content: SingleChildScrollView(
            child: Text('It was $randomNumber'),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('Try again'),
              onPressed: () {
                setState(() {
                  randomNumber = Random().nextInt(100);
                  textInput = null;
                  guess = null;
                });
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: const Text('OK'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
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
            const Text(
              'I\'m thinking of a number between 1 and 100.',
            ),
            const Text('It\'s your turn to guess my number!'),
            if (guess != null)
              Text(
                '$guess',
                style: Theme.of(context).textTheme.headline4,
              ),
            Card(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  children: <Widget>[
                    const Text('Try a number!'),
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
                    FlatButton(
                      child: const Text('GUESS'),
                      color: Colors.grey[300],
                      onPressed: () {
                        setState(() {
                          if (textInput == null) {
                          } else {
                            final int number = int.tryParse(textInput);
                            if (number == randomNumber) {
                              guess = 'You tried $number.\nYou guessed right.';
                              _showMyDialog();
                            } else if (number < randomNumber)
                              guess = 'You tried $number.\nTry higher.';
                            else if (number > randomNumber) guess = 'You tried $number.\nTry lower.';
                          }
                        });
                      },
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
