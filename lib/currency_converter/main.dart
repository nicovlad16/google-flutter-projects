import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'currency converter',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      home: const MyHomePage(title: 'Currency Converter'),
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
  String error;
  String result;
  final String hintText = 'enter the amount in eur';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Column(
        children: <Widget>[
          Image.network(
              'https://images.unsplash.com/photo-1526304640581-d334cdbbf45e?ixlib=rb-1.2.1&ixid=MXwxMjA3fDB8MHxleHBsb3JlLWZlZWR8NXx8fGVufDB8fHw%3D&auto=format&fit=crop&w=900&q=60'),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: TextFormField(
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                hintText: hintText,
                errorText: error,
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
          ),
          FlatButton(
            child: const Text('CONVERT'),
            color: Colors.grey[300],
            onPressed: () {
              setState(() {
                if (textInput == null || double.tryParse(textInput) == null) {
                  error = 'please enter a valid number';
                } else {
                  error = null;
                  result = (4.5 * double.parse(textInput)).toStringAsFixed(2) + ' RON';
                }
              });
            },
          ),
          if (result != null)
            Text(
              '$result',
              style: Theme.of(context).textTheme.headline4,
            ),
        ],
      ),
    );
  }
}
