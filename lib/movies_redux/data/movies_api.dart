import 'dart:convert';

import 'package:http/http.dart';
import 'package:meta/meta.dart';

import '../models/movie.dart';

class MoviesApi {
  const MoviesApi({@required Client client})
      : assert(client != null),
        _client = client;

  final Client _client;

  Future<List<Movie>> getMovies() async {
    final Response response = await _client.get('https://yts.mx/api/v2/list_movies.json?limit=48');

    final List<dynamic> data = jsonDecode(response.body)['data']['movies'];

    final List<Movie> movies = data.map((dynamic json) => Movie.from(json)).toList();

    return movies;
  }
}
