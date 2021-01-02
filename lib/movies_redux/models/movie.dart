part of models;

abstract class Movie implements Built<Movie, MovieBuilder> {
  factory Movie([void Function(MovieBuilder b) updates]) = _$Movie;

  factory Movie.from(dynamic json) {
    return serializers.deserializeWith(serializer, json);
  }

  Movie._();

  int get id;

  String get title;

  int get year;

  double get rating;

  int get runtime;

  @BuiltValueField(wireName: 'medium_cover_image')
  String get image;

  static Serializer<Movie> get serializer => _$movieSerializer;
}
