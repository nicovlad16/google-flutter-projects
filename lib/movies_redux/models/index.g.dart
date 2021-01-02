// GENERATED CODE - DO NOT MODIFY BY HAND

part of models;

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<Movie> _$movieSerializer = new _$MovieSerializer();

class _$MovieSerializer implements StructuredSerializer<Movie> {
  @override
  final Iterable<Type> types = const [Movie, _$Movie];
  @override
  final String wireName = 'Movie';

  @override
  Iterable<Object> serialize(Serializers serializers, Movie object, {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      'id',
      serializers.serialize(object.id, specifiedType: const FullType(int)),
      'title',
      serializers.serialize(object.title, specifiedType: const FullType(String)),
      'year',
      serializers.serialize(object.year, specifiedType: const FullType(int)),
      'rating',
      serializers.serialize(object.rating, specifiedType: const FullType(double)),
      'runtime',
      serializers.serialize(object.runtime, specifiedType: const FullType(int)),
      'medium_cover_image',
      serializers.serialize(object.image, specifiedType: const FullType(String)),
    ];

    return result;
  }

  @override
  Movie deserialize(Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new MovieBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'id':
          result.id = serializers.deserialize(value, specifiedType: const FullType(int)) as int;
          break;
        case 'title':
          result.title = serializers.deserialize(value, specifiedType: const FullType(String)) as String;
          break;
        case 'year':
          result.year = serializers.deserialize(value, specifiedType: const FullType(int)) as int;
          break;
        case 'rating':
          result.rating = serializers.deserialize(value, specifiedType: const FullType(double)) as double;
          break;
        case 'runtime':
          result.runtime = serializers.deserialize(value, specifiedType: const FullType(int)) as int;
          break;
        case 'medium_cover_image':
          result.image = serializers.deserialize(value, specifiedType: const FullType(String)) as String;
          break;
      }
    }

    return result.build();
  }
}

class _$AppState extends AppState {
  @override
  final BuiltList<Movie> movies;
  @override
  final bool isLoading;
  @override
  final int page;
  @override
  final String quality;
  @override
  final BuiltList<String> genres;
  @override
  final String orderBy;

  factory _$AppState([void Function(AppStateBuilder) updates]) => (new AppStateBuilder()..update(updates)).build();

  _$AppState._({this.movies, this.isLoading, this.page, this.quality, this.genres, this.orderBy}) : super._() {
    if (movies == null) {
      throw new BuiltValueNullFieldError('AppState', 'movies');
    }
    if (isLoading == null) {
      throw new BuiltValueNullFieldError('AppState', 'isLoading');
    }
    if (page == null) {
      throw new BuiltValueNullFieldError('AppState', 'page');
    }
    if (genres == null) {
      throw new BuiltValueNullFieldError('AppState', 'genres');
    }
    if (orderBy == null) {
      throw new BuiltValueNullFieldError('AppState', 'orderBy');
    }
  }

  @override
  AppState rebuild(void Function(AppStateBuilder) updates) => (toBuilder()..update(updates)).build();

  @override
  AppStateBuilder toBuilder() => new AppStateBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is AppState &&
        movies == other.movies &&
        isLoading == other.isLoading &&
        page == other.page &&
        quality == other.quality &&
        genres == other.genres &&
        orderBy == other.orderBy;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc($jc($jc($jc($jc(0, movies.hashCode), isLoading.hashCode), page.hashCode), quality.hashCode),
            genres.hashCode),
        orderBy.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('AppState')
          ..add('movies', movies)
          ..add('isLoading', isLoading)
          ..add('page', page)
          ..add('quality', quality)
          ..add('genres', genres)
          ..add('orderBy', orderBy))
        .toString();
  }
}

class AppStateBuilder implements Builder<AppState, AppStateBuilder> {
  _$AppState _$v;

  ListBuilder<Movie> _movies;
  ListBuilder<Movie> get movies => _$this._movies ??= new ListBuilder<Movie>();
  set movies(ListBuilder<Movie> movies) => _$this._movies = movies;

  bool _isLoading;
  bool get isLoading => _$this._isLoading;
  set isLoading(bool isLoading) => _$this._isLoading = isLoading;

  int _page;
  int get page => _$this._page;
  set page(int page) => _$this._page = page;

  String _quality;
  String get quality => _$this._quality;
  set quality(String quality) => _$this._quality = quality;

  ListBuilder<String> _genres;
  ListBuilder<String> get genres => _$this._genres ??= new ListBuilder<String>();
  set genres(ListBuilder<String> genres) => _$this._genres = genres;

  String _orderBy;
  String get orderBy => _$this._orderBy;
  set orderBy(String orderBy) => _$this._orderBy = orderBy;

  AppStateBuilder();

  AppStateBuilder get _$this {
    if (_$v != null) {
      _movies = _$v.movies?.toBuilder();
      _isLoading = _$v.isLoading;
      _page = _$v.page;
      _quality = _$v.quality;
      _genres = _$v.genres?.toBuilder();
      _orderBy = _$v.orderBy;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(AppState other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$AppState;
  }

  @override
  void update(void Function(AppStateBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$AppState build() {
    _$AppState _$result;
    try {
      _$result = _$v ??
          new _$AppState._(
              movies: movies.build(),
              isLoading: isLoading,
              page: page,
              quality: quality,
              genres: genres.build(),
              orderBy: orderBy);
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'movies';
        movies.build();

        _$failedField = 'genres';
        genres.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError('AppState', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$Movie extends Movie {
  @override
  final int id;
  @override
  final String title;
  @override
  final int year;
  @override
  final double rating;
  @override
  final int runtime;
  @override
  final String image;

  factory _$Movie([void Function(MovieBuilder) updates]) => (new MovieBuilder()..update(updates)).build();

  _$Movie._({this.id, this.title, this.year, this.rating, this.runtime, this.image}) : super._() {
    if (id == null) {
      throw new BuiltValueNullFieldError('Movie', 'id');
    }
    if (title == null) {
      throw new BuiltValueNullFieldError('Movie', 'title');
    }
    if (year == null) {
      throw new BuiltValueNullFieldError('Movie', 'year');
    }
    if (rating == null) {
      throw new BuiltValueNullFieldError('Movie', 'rating');
    }
    if (runtime == null) {
      throw new BuiltValueNullFieldError('Movie', 'runtime');
    }
    if (image == null) {
      throw new BuiltValueNullFieldError('Movie', 'image');
    }
  }

  @override
  Movie rebuild(void Function(MovieBuilder) updates) => (toBuilder()..update(updates)).build();

  @override
  MovieBuilder toBuilder() => new MovieBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Movie &&
        id == other.id &&
        title == other.title &&
        year == other.year &&
        rating == other.rating &&
        runtime == other.runtime &&
        image == other.image;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc($jc($jc($jc($jc(0, id.hashCode), title.hashCode), year.hashCode), rating.hashCode), runtime.hashCode),
        image.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('Movie')
          ..add('id', id)
          ..add('title', title)
          ..add('year', year)
          ..add('rating', rating)
          ..add('runtime', runtime)
          ..add('image', image))
        .toString();
  }
}

class MovieBuilder implements Builder<Movie, MovieBuilder> {
  _$Movie _$v;

  int _id;
  int get id => _$this._id;
  set id(int id) => _$this._id = id;

  String _title;
  String get title => _$this._title;
  set title(String title) => _$this._title = title;

  int _year;
  int get year => _$this._year;
  set year(int year) => _$this._year = year;

  double _rating;
  double get rating => _$this._rating;
  set rating(double rating) => _$this._rating = rating;

  int _runtime;
  int get runtime => _$this._runtime;
  set runtime(int runtime) => _$this._runtime = runtime;

  String _image;
  String get image => _$this._image;
  set image(String image) => _$this._image = image;

  MovieBuilder();

  MovieBuilder get _$this {
    if (_$v != null) {
      _id = _$v.id;
      _title = _$v.title;
      _year = _$v.year;
      _rating = _$v.rating;
      _runtime = _$v.runtime;
      _image = _$v.image;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(Movie other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$Movie;
  }

  @override
  void update(void Function(MovieBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$Movie build() {
    final _$result =
        _$v ?? new _$Movie._(id: id, title: title, year: year, rating: rating, runtime: runtime, image: image);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
