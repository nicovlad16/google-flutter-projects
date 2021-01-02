import 'dart:convert';

import 'package:http/http.dart';
import 'package:meta/meta.dart';
import 'package:projects/movies_redux/models/index.dart';

class MoviesApi {
  const MoviesApi({@required Client client})
      : assert(client != null),
        _client = client;

  final Client _client;

  Future<List<Movie>> getMovies(int page, String quality, List<String> genres, String orderBy) async {
    final Uri url = Uri.parse('https://yts.mx/api/v2/list_movies.json').replace(
      queryParameters: <String, String>{
        'limit': '48',
        'page': '$page',
        'order_by': orderBy,
        if (quality != null) 'quality': quality,
        if (genres.isNotEmpty) 'genre': genres[0],
      },
    );

    final Response response = await _client.get(url);

    final List<dynamic> data = jsonDecode(response.body)['data']['movies'];
    final List<Movie> movies = data.map((dynamic json) => Movie.from(json)).toList();

    return movies;
  }
}
