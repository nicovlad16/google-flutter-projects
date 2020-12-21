import 'package:flutter/material.dart';

import 'movie_details.dart';
import 'movies.dart';

typedef IntCallback = int Function(Movie movie, Movie other);

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'movies',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      home: const MyHomePage(title: 'movies'),
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
  List<Movie> movies = <Movie>[];
  String initialSort;

  Map<String, IntCallback> dropdownItems = <String, IntCallback>{
    'title': compareTitle,
    'year': compareYear,
    'rating': compareRating,
    'runtime': compareRuntime,
  };

  @override
  void initState() {
    super.initState();
    _init();
  }

  Future<void> _init() async {
    movies = await getMovies();
    movies.sort(compareTitle);
    setState(() {
      initialSort = 'title';
    });
  }

  DropdownButton<String> get dropdownButton {
    return DropdownButton<String>(
      value: initialSort,
      icon: const Icon(Icons.arrow_downward),
      items: dropdownItems.keys.map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
      onChanged: (String newValue) {
        movies.sort(dropdownItems[newValue]);
        setState(() {
          initialSort = newValue;
        });
      },
    );
  }

  void showMovieDetailsPage(Movie movie) {
    Navigator.of(context).push(MaterialPageRoute<void>(builder: (BuildContext context) {
      return MovieDetailsPage(movie);
    }));
  }

  ListView get listView {
    return ListView.builder(
      itemCount: movies.length,
      padding: const EdgeInsets.all(16.0),
      itemBuilder: (BuildContext context, int index) {
        return Card(
          child: ListTile(
            title: Text(movies[index].title),
            trailing: IconButton(
              icon: const Icon(Icons.assessment_rounded),
              onPressed: () {
                showMovieDetailsPage(movies[index]);
              },
            ),
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
      body: Column(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[const Text('Sort by:'), const SizedBox(width: 16), dropdownButton],
          ),
          Expanded(
            child: listView,
          ),
        ],
      ),
    );
  }
}
