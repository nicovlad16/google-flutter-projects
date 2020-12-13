import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import 'movies.dart';

class MovieDetailsPage extends StatefulWidget {
  const MovieDetailsPage(this.movie);

  final Movie movie;

  @override
  _MovieDetailsPageState createState() => _MovieDetailsPageState(movie);
}

class _MovieDetailsPageState extends State<MovieDetailsPage> {
  _MovieDetailsPageState(this.movie);

  final Movie movie;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(movie.title),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Image.network(movie.image),
              const Padding(padding: EdgeInsets.only(bottom: 24)),
              Text(
                movie.title,
                style: const TextStyle(fontSize: 32.0),
              ),
              const Padding(padding: EdgeInsets.only(bottom: 16)),
              Text('Year - ${movie.year}'),
              const Padding(padding: EdgeInsets.only(bottom: 8)),
              Text('Runtime - ${movie.runtime}'),
              const Padding(padding: EdgeInsets.only(bottom: 16)),
              RatingBar.builder(
                initialRating: movie.rating,
                minRating: 0,
                direction: Axis.horizontal,
                allowHalfRating: true,
                itemCount: 10,
                itemPadding: const EdgeInsets.symmetric(horizontal: 16.0),
                itemBuilder: (BuildContext context, _) => const Icon(Icons.star),
                onRatingUpdate: (double value) {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}
