// GENERATED CODE - DO NOT MODIFY BY HAND

part of unsplash_image;

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<UnsplashImage> _$unsplashImageSerializer = new _$UnsplashImageSerializer();
Serializer<ImageUrl> _$imageUrlSerializer = new _$ImageUrlSerializer();

class _$UnsplashImageSerializer implements StructuredSerializer<UnsplashImage> {
  @override
  final Iterable<Type> types = const [UnsplashImage, _$UnsplashImage];
  @override
  final String wireName = 'UnsplashImage';

  @override
  Iterable<Object> serialize(Serializers serializers, UnsplashImage object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      'id',
      serializers.serialize(object.id, specifiedType: const FullType(String)),
      'color',
      serializers.serialize(object.color, specifiedType: const FullType(String)),
      'likes',
      serializers.serialize(object.likes, specifiedType: const FullType(int)),
      'urls',
      serializers.serialize(object.urls, specifiedType: const FullType(ImageUrl)),
    ];
    if (object.description != null) {
      result..add('description')..add(serializers.serialize(object.description, specifiedType: const FullType(String)));
    }
    return result;
  }

  @override
  UnsplashImage deserialize(Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new UnsplashImageBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'id':
          result.id = serializers.deserialize(value, specifiedType: const FullType(String)) as String;
          break;
        case 'color':
          result.color = serializers.deserialize(value, specifiedType: const FullType(String)) as String;
          break;
        case 'description':
          result.description = serializers.deserialize(value, specifiedType: const FullType(String)) as String;
          break;
        case 'likes':
          result.likes = serializers.deserialize(value, specifiedType: const FullType(int)) as int;
          break;
        case 'urls':
          result.urls.replace(serializers.deserialize(value, specifiedType: const FullType(ImageUrl)) as ImageUrl);
          break;
      }
    }

    return result.build();
  }
}

class _$ImageUrlSerializer implements StructuredSerializer<ImageUrl> {
  @override
  final Iterable<Type> types = const [ImageUrl, _$ImageUrl];
  @override
  final String wireName = 'ImageUrl';

  @override
  Iterable<Object> serialize(Serializers serializers, ImageUrl object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      'small',
      serializers.serialize(object.small, specifiedType: const FullType(String)),
    ];

    return result;
  }

  @override
  ImageUrl deserialize(Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new ImageUrlBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'small':
          result.small = serializers.deserialize(value, specifiedType: const FullType(String)) as String;
          break;
      }
    }

    return result.build();
  }
}

class _$UnsplashImage extends UnsplashImage {
  @override
  final String id;
  @override
  final String color;
  @override
  final String description;
  @override
  final int likes;
  @override
  final ImageUrl urls;

  factory _$UnsplashImage([void Function(UnsplashImageBuilder) updates]) =>
      (new UnsplashImageBuilder()..update(updates)).build();

  _$UnsplashImage._({this.id, this.color, this.description, this.likes, this.urls}) : super._() {
    if (id == null) {
      throw new BuiltValueNullFieldError('UnsplashImage', 'id');
    }
    if (color == null) {
      throw new BuiltValueNullFieldError('UnsplashImage', 'color');
    }
    if (likes == null) {
      throw new BuiltValueNullFieldError('UnsplashImage', 'likes');
    }
    if (urls == null) {
      throw new BuiltValueNullFieldError('UnsplashImage', 'urls');
    }
  }

  @override
  UnsplashImage rebuild(void Function(UnsplashImageBuilder) updates) => (toBuilder()..update(updates)).build();

  @override
  UnsplashImageBuilder toBuilder() => new UnsplashImageBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is UnsplashImage &&
        id == other.id &&
        color == other.color &&
        description == other.description &&
        likes == other.likes &&
        urls == other.urls;
  }

  @override
  int get hashCode {
    return $jf(
        $jc($jc($jc($jc($jc(0, id.hashCode), color.hashCode), description.hashCode), likes.hashCode), urls.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('UnsplashImage')
          ..add('id', id)
          ..add('color', color)
          ..add('description', description)
          ..add('likes', likes)
          ..add('urls', urls))
        .toString();
  }
}

class UnsplashImageBuilder implements Builder<UnsplashImage, UnsplashImageBuilder> {
  _$UnsplashImage _$v;

  String _id;
  String get id => _$this._id;
  set id(String id) => _$this._id = id;

  String _color;
  String get color => _$this._color;
  set color(String color) => _$this._color = color;

  String _description;
  String get description => _$this._description;
  set description(String description) => _$this._description = description;

  int _likes;
  int get likes => _$this._likes;
  set likes(int likes) => _$this._likes = likes;

  ImageUrlBuilder _urls;
  ImageUrlBuilder get urls => _$this._urls ??= new ImageUrlBuilder();
  set urls(ImageUrlBuilder urls) => _$this._urls = urls;

  UnsplashImageBuilder();

  UnsplashImageBuilder get _$this {
    if (_$v != null) {
      _id = _$v.id;
      _color = _$v.color;
      _description = _$v.description;
      _likes = _$v.likes;
      _urls = _$v.urls?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(UnsplashImage other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$UnsplashImage;
  }

  @override
  void update(void Function(UnsplashImageBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$UnsplashImage build() {
    _$UnsplashImage _$result;
    try {
      _$result = _$v ??
          new _$UnsplashImage._(id: id, color: color, description: description, likes: likes, urls: urls.build());
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'urls';
        urls.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError('UnsplashImage', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$ImageUrl extends ImageUrl {
  @override
  final String small;

  factory _$ImageUrl([void Function(ImageUrlBuilder) updates]) => (new ImageUrlBuilder()..update(updates)).build();

  _$ImageUrl._({this.small}) : super._() {
    if (small == null) {
      throw new BuiltValueNullFieldError('ImageUrl', 'small');
    }
  }

  @override
  ImageUrl rebuild(void Function(ImageUrlBuilder) updates) => (toBuilder()..update(updates)).build();

  @override
  ImageUrlBuilder toBuilder() => new ImageUrlBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ImageUrl && small == other.small;
  }

  @override
  int get hashCode {
    return $jf($jc(0, small.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('ImageUrl')..add('small', small)).toString();
  }
}

class ImageUrlBuilder implements Builder<ImageUrl, ImageUrlBuilder> {
  _$ImageUrl _$v;

  String _small;
  String get small => _$this._small;
  set small(String small) => _$this._small = small;

  ImageUrlBuilder();

  ImageUrlBuilder get _$this {
    if (_$v != null) {
      _small = _$v.small;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ImageUrl other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$ImageUrl;
  }

  @override
  void update(void Function(ImageUrlBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$ImageUrl build() {
    final _$result = _$v ?? new _$ImageUrl._(small: small);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
