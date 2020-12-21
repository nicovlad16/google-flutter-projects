import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:projects/movies_redux/containers/movie_container.dart';
import 'package:projects/movies_redux/models/movie.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return MoviesContainer(
      builder: (BuildContext context, List<Movie> movies) {
        return Scaffold(
          appBar: AppBar(
            title: Text(title),
          ),
          body: GridView.builder(
            itemCount: movies.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
            ),
            itemBuilder: (BuildContext context, int index) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Image.network(movies[index].image),
              );
            },
          ),
        );
      },
    );
  }
}
