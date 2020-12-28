// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of get_images;

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

/// @nodoc
class _$GetImagesTearOff {
  const _$GetImagesTearOff();

// ignore: unused_element
  GetImagesStart start(int page) {
    return GetImagesStart(
      page,
    );
  }

// ignore: unused_element
  GetImagesSuccessful successful(List<UnsplashImage> images) {
    return GetImagesSuccessful(
      images,
    );
  }

// ignore: unused_element
  GetImagesError error(dynamic error) {
    return GetImagesError(
      error,
    );
  }
}

/// @nodoc
// ignore: unused_element
const $GetImages = _$GetImagesTearOff();

/// @nodoc
mixin _$GetImages {
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result start(int page),
    @required Result successful(List<UnsplashImage> images),
    @required Result error(dynamic error),
  });
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result start(int page),
    Result successful(List<UnsplashImage> images),
    Result error(dynamic error),
    @required Result orElse(),
  });
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result start(GetImagesStart value),
    @required Result successful(GetImagesSuccessful value),
    @required Result error(GetImagesError value),
  });
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result start(GetImagesStart value),
    Result successful(GetImagesSuccessful value),
    Result error(GetImagesError value),
    @required Result orElse(),
  });
}

/// @nodoc
abstract class $GetImagesCopyWith<$Res> {
  factory $GetImagesCopyWith(GetImages value, $Res Function(GetImages) then) =
      _$GetImagesCopyWithImpl<$Res>;
}

/// @nodoc
class _$GetImagesCopyWithImpl<$Res> implements $GetImagesCopyWith<$Res> {
  _$GetImagesCopyWithImpl(this._value, this._then);

  final GetImages _value;
  // ignore: unused_field
  final $Res Function(GetImages) _then;
}

/// @nodoc
abstract class $GetImagesStartCopyWith<$Res> {
  factory $GetImagesStartCopyWith(
          GetImagesStart value, $Res Function(GetImagesStart) then) =
      _$GetImagesStartCopyWithImpl<$Res>;
  $Res call({int page});
}

/// @nodoc
class _$GetImagesStartCopyWithImpl<$Res> extends _$GetImagesCopyWithImpl<$Res>
    implements $GetImagesStartCopyWith<$Res> {
  _$GetImagesStartCopyWithImpl(
      GetImagesStart _value, $Res Function(GetImagesStart) _then)
      : super(_value, (v) => _then(v as GetImagesStart));

  @override
  GetImagesStart get _value => super._value as GetImagesStart;

  @override
  $Res call({
    Object page = freezed,
  }) {
    return _then(GetImagesStart(
      page == freezed ? _value.page : page as int,
    ));
  }
}

/// @nodoc
class _$GetImagesStart implements GetImagesStart {
  const _$GetImagesStart(this.page) : assert(page != null);

  @override
  final int page;

  @override
  String toString() {
    return 'GetImages.start(page: $page)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is GetImagesStart &&
            (identical(other.page, page) ||
                const DeepCollectionEquality().equals(other.page, page)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(page);

  @override
  $GetImagesStartCopyWith<GetImagesStart> get copyWith =>
      _$GetImagesStartCopyWithImpl<GetImagesStart>(this, _$identity);

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result start(int page),
    @required Result successful(List<UnsplashImage> images),
    @required Result error(dynamic error),
  }) {
    assert(start != null);
    assert(successful != null);
    assert(error != null);
    return start(page);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result start(int page),
    Result successful(List<UnsplashImage> images),
    Result error(dynamic error),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (start != null) {
      return start(page);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result start(GetImagesStart value),
    @required Result successful(GetImagesSuccessful value),
    @required Result error(GetImagesError value),
  }) {
    assert(start != null);
    assert(successful != null);
    assert(error != null);
    return start(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result start(GetImagesStart value),
    Result successful(GetImagesSuccessful value),
    Result error(GetImagesError value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (start != null) {
      return start(this);
    }
    return orElse();
  }
}

abstract class GetImagesStart implements GetImages {
  const factory GetImagesStart(int page) = _$GetImagesStart;

  int get page;
  $GetImagesStartCopyWith<GetImagesStart> get copyWith;
}

/// @nodoc
abstract class $GetImagesSuccessfulCopyWith<$Res> {
  factory $GetImagesSuccessfulCopyWith(
          GetImagesSuccessful value, $Res Function(GetImagesSuccessful) then) =
      _$GetImagesSuccessfulCopyWithImpl<$Res>;
  $Res call({List<UnsplashImage> images});
}

/// @nodoc
class _$GetImagesSuccessfulCopyWithImpl<$Res>
    extends _$GetImagesCopyWithImpl<$Res>
    implements $GetImagesSuccessfulCopyWith<$Res> {
  _$GetImagesSuccessfulCopyWithImpl(
      GetImagesSuccessful _value, $Res Function(GetImagesSuccessful) _then)
      : super(_value, (v) => _then(v as GetImagesSuccessful));

  @override
  GetImagesSuccessful get _value => super._value as GetImagesSuccessful;

  @override
  $Res call({
    Object images = freezed,
  }) {
    return _then(GetImagesSuccessful(
      images == freezed ? _value.images : images as List<UnsplashImage>,
    ));
  }
}

/// @nodoc
class _$GetImagesSuccessful implements GetImagesSuccessful {
  const _$GetImagesSuccessful(this.images) : assert(images != null);

  @override
  final List<UnsplashImage> images;

  @override
  String toString() {
    return 'GetImages.successful(images: $images)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is GetImagesSuccessful &&
            (identical(other.images, images) ||
                const DeepCollectionEquality().equals(other.images, images)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(images);

  @override
  $GetImagesSuccessfulCopyWith<GetImagesSuccessful> get copyWith =>
      _$GetImagesSuccessfulCopyWithImpl<GetImagesSuccessful>(this, _$identity);

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result start(int page),
    @required Result successful(List<UnsplashImage> images),
    @required Result error(dynamic error),
  }) {
    assert(start != null);
    assert(successful != null);
    assert(error != null);
    return successful(images);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result start(int page),
    Result successful(List<UnsplashImage> images),
    Result error(dynamic error),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (successful != null) {
      return successful(images);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result start(GetImagesStart value),
    @required Result successful(GetImagesSuccessful value),
    @required Result error(GetImagesError value),
  }) {
    assert(start != null);
    assert(successful != null);
    assert(error != null);
    return successful(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result start(GetImagesStart value),
    Result successful(GetImagesSuccessful value),
    Result error(GetImagesError value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (successful != null) {
      return successful(this);
    }
    return orElse();
  }
}

abstract class GetImagesSuccessful implements GetImages {
  const factory GetImagesSuccessful(List<UnsplashImage> images) =
      _$GetImagesSuccessful;

  List<UnsplashImage> get images;
  $GetImagesSuccessfulCopyWith<GetImagesSuccessful> get copyWith;
}

/// @nodoc
abstract class $GetImagesErrorCopyWith<$Res> {
  factory $GetImagesErrorCopyWith(
          GetImagesError value, $Res Function(GetImagesError) then) =
      _$GetImagesErrorCopyWithImpl<$Res>;
  $Res call({dynamic error});
}

/// @nodoc
class _$GetImagesErrorCopyWithImpl<$Res> extends _$GetImagesCopyWithImpl<$Res>
    implements $GetImagesErrorCopyWith<$Res> {
  _$GetImagesErrorCopyWithImpl(
      GetImagesError _value, $Res Function(GetImagesError) _then)
      : super(_value, (v) => _then(v as GetImagesError));

  @override
  GetImagesError get _value => super._value as GetImagesError;

  @override
  $Res call({
    Object error = freezed,
  }) {
    return _then(GetImagesError(
      error == freezed ? _value.error : error as dynamic,
    ));
  }
}

/// @nodoc
class _$GetImagesError implements GetImagesError {
  const _$GetImagesError(this.error) : assert(error != null);

  @override
  final dynamic error;

  @override
  String toString() {
    return 'GetImages.error(error: $error)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is GetImagesError &&
            (identical(other.error, error) ||
                const DeepCollectionEquality().equals(other.error, error)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(error);

  @override
  $GetImagesErrorCopyWith<GetImagesError> get copyWith =>
      _$GetImagesErrorCopyWithImpl<GetImagesError>(this, _$identity);

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result start(int page),
    @required Result successful(List<UnsplashImage> images),
    @required Result error(dynamic error),
  }) {
    assert(start != null);
    assert(successful != null);
    assert(error != null);
    return error(this.error);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result start(int page),
    Result successful(List<UnsplashImage> images),
    Result error(dynamic error),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (error != null) {
      return error(this.error);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result start(GetImagesStart value),
    @required Result successful(GetImagesSuccessful value),
    @required Result error(GetImagesError value),
  }) {
    assert(start != null);
    assert(successful != null);
    assert(error != null);
    return error(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result start(GetImagesStart value),
    Result successful(GetImagesSuccessful value),
    Result error(GetImagesError value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class GetImagesError implements GetImages {
  const factory GetImagesError(dynamic error) = _$GetImagesError;

  dynamic get error;
  $GetImagesErrorCopyWith<GetImagesError> get copyWith;
}
