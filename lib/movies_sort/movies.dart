import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';

Future<List<Movie>> getMovies() async {
  final Response response = await get('https://yts.mx/api/v2/list_movies.json');

  final Map<String, dynamic> responseData = jsonDecode(response.body) as Map<String, dynamic>;
  final Map<String, dynamic> data = responseData['data'];
  final List<dynamic> movies = data['movies'];

  final List<Movie> movieList = <Movie>[];

  for (int i = 0; i < movies.length; i++) {
    final Map<String, dynamic> item = movies[i];

    final Movie movie = Movie(
      id: item['id'],
      title: item['title'],
      year: item['year'],
      rating: item['rating'].toDouble(),
      runtime: item['runtime'],
      image: item['large_cover_image'],
    );

    movieList.add(movie);
  }

  return movieList;
}

int compareTitle(Movie movie, Movie other) {
  return movie.title.compareTo(other.title);
}

int compareRating(Movie movie, Movie other) {
  return movie.rating.compareTo(other.rating);
}

int compareYear(Movie movie, Movie other) {
  return movie.year.compareTo(other.year);
}

int compareRuntime(Movie movie, Movie other) {
  return movie.runtime.compareTo(other.runtime);
}

class Movie {
  Movie({
    @required this.id,
    @required this.title,
    @required this.year,
    @required this.rating,
    @required this.runtime,
    @required this.image,
  });

  final int id;
  final String title;
  final int year;
  final double rating;
  final int runtime;
  final String image;

  @override
  String toString() {
    return 'Movie{id: $id, title: $title, year: $year, rating: $rating, runtime: $runtime, image: $image}';
  }
}
