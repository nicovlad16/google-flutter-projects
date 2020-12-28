// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of set_search_term;

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

/// @nodoc
class _$SetSearchTermTearOff {
  const _$SetSearchTermTearOff();

// ignore: unused_element
  _SetSearchTerm call(String searchTerm) {
    return _SetSearchTerm(
      searchTerm,
    );
  }
}

/// @nodoc
// ignore: unused_element
const $SetSearchTerm = _$SetSearchTermTearOff();

/// @nodoc
mixin _$SetSearchTerm {
  String get searchTerm;

  $SetSearchTermCopyWith<SetSearchTerm> get copyWith;
}

/// @nodoc
abstract class $SetSearchTermCopyWith<$Res> {
  factory $SetSearchTermCopyWith(SetSearchTerm value, $Res Function(SetSearchTerm) then) =
      _$SetSearchTermCopyWithImpl<$Res>;
  $Res call({String searchTerm});
}

/// @nodoc
class _$SetSearchTermCopyWithImpl<$Res> implements $SetSearchTermCopyWith<$Res> {
  _$SetSearchTermCopyWithImpl(this._value, this._then);

  final SetSearchTerm _value;
  // ignore: unused_field
  final $Res Function(SetSearchTerm) _then;

  @override
  $Res call({
    Object searchTerm = freezed,
  }) {
    return _then(_value.copyWith(
      searchTerm: searchTerm == freezed ? _value.searchTerm : searchTerm as String,
    ));
  }
}

/// @nodoc
abstract class _$SetSearchTermCopyWith<$Res> implements $SetSearchTermCopyWith<$Res> {
  factory _$SetSearchTermCopyWith(_SetSearchTerm value, $Res Function(_SetSearchTerm) then) =
      __$SetSearchTermCopyWithImpl<$Res>;
  @override
  $Res call({String searchTerm});
}

/// @nodoc
class __$SetSearchTermCopyWithImpl<$Res> extends _$SetSearchTermCopyWithImpl<$Res>
    implements _$SetSearchTermCopyWith<$Res> {
  __$SetSearchTermCopyWithImpl(_SetSearchTerm _value, $Res Function(_SetSearchTerm) _then)
      : super(_value, (v) => _then(v as _SetSearchTerm));

  @override
  _SetSearchTerm get _value => super._value as _SetSearchTerm;

  @override
  $Res call({
    Object searchTerm = freezed,
  }) {
    return _then(_SetSearchTerm(
      searchTerm == freezed ? _value.searchTerm : searchTerm as String,
    ));
  }
}

/// @nodoc
class _$_SetSearchTerm implements _SetSearchTerm {
  const _$_SetSearchTerm(this.searchTerm) : assert(searchTerm != null);

  @override
  final String searchTerm;

  @override
  String toString() {
    return 'SetSearchTerm(searchTerm: $searchTerm)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _SetSearchTerm &&
            (identical(other.searchTerm, searchTerm) ||
                const DeepCollectionEquality().equals(other.searchTerm, searchTerm)));
  }

  @override
  int get hashCode => runtimeType.hashCode ^ const DeepCollectionEquality().hash(searchTerm);

  @override
  _$SetSearchTermCopyWith<_SetSearchTerm> get copyWith =>
      __$SetSearchTermCopyWithImpl<_SetSearchTerm>(this, _$identity);
}

abstract class _SetSearchTerm implements SetSearchTerm {
  const factory _SetSearchTerm(String searchTerm) = _$_SetSearchTerm;

  @override
  String get searchTerm;
  @override
  _$SetSearchTermCopyWith<_SetSearchTerm> get copyWith;
}
