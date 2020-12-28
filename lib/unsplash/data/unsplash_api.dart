import 'dart:convert';

import 'package:http/http.dart';
import 'package:projects/unsplash/models/unsplash_image.dart';

class UnsplashApi {
  const UnsplashApi();

  static const String _accessKey = 'zJzhLw_CABYxL1GL2DdcyLq9XzwKF_xCJYoTVnId2Dw';
  static const String _apiVersion = 'v1';
  static const Map<String, String> headers = {
    'Accept-Version': _apiVersion,
    'Authorization': 'Client-ID $_accessKey',
  };

  Future<List<UnsplashImage>> getImages() async {
    final Uri url = Uri.parse('https://api.unsplash.com/photos').replace(
      queryParameters: <String, String>{
      },
    );

    final Response response = await get(url, headers: headers);

    print(response.body);

    final List<dynamic> data = jsonDecode(response.body);

    print(data);

    final List<UnsplashImage> images = [];
    for (int i = 0; i < data.length; i++) {
      final Map<String, dynamic> item = data[i];
      final UnsplashImage image = UnsplashImage(item['urls']['small']);
      images.add(image);
    }

    print(images);

    return images;
  }
}
