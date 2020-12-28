import 'dart:convert';

import 'package:http/http.dart';
import 'package:meta/meta.dart';
import 'package:projects/unsplash/models/unsplash_image.dart';

class UnsplashApi {
  const UnsplashApi({@required Client client})
      : assert(client != null),
        _client = client;

  final Client _client;

  static const String _accessKey = 'zJzhLw_CABYxL1GL2DdcyLq9XzwKF_xCJYoTVnId2Dw';
  static const String _apiVersion = 'v1';
  static const Map<String, String> headers = <String, String>{
    'Accept-Version': _apiVersion,
    'Authorization': 'Client-ID $_accessKey',
  };

  Future<List<UnsplashImage>> getImages() async {
    final Uri url = Uri.parse('https://api.unsplash.com/photos').replace(
      queryParameters: <String, String>{},
    );

    final Response response = await _client.get(url, headers: headers);

    final List<dynamic> data = jsonDecode(response.body);
    final List<UnsplashImage> images = data.map((dynamic json) => UnsplashImage.from(json)).toList();

    return images;
  }
}
