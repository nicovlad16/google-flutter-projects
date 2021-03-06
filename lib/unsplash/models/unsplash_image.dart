part of models;

abstract class UnsplashImage implements Built<UnsplashImage, UnsplashImageBuilder> {
  factory UnsplashImage([void Function(UnsplashImageBuilder b) updates]) = _$UnsplashImage;

  factory UnsplashImage.from(dynamic json) {
    return serializers.deserializeWith(serializer, json);
  }

  UnsplashImage._();

  String get id;

  String get color;

  @nullable
  String get description;

  int get likes;

  ImageUrl get urls;

  static Serializer<UnsplashImage> get serializer => _$unsplashImageSerializer;
}

abstract class ImageUrl implements Built<ImageUrl, ImageUrlBuilder> {
  factory ImageUrl([void Function(ImageUrlBuilder b) updates]) = _$ImageUrl;

  ImageUrl._();

  String get small;

  static Serializer<ImageUrl> get serializer => _$imageUrlSerializer;
}
