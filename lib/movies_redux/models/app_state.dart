library app_state;

import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:projects/movies_redux/models/movie.dart';

part 'app_state.g.dart';

abstract class AppState implements Built<AppState, AppStateBuilder> {
  factory AppState() {
    return _$AppState((AppStateBuilder builder) {
      builder
        ..isLoading = false
        ..page = 1;
    });
  }

  AppState._();

  BuiltList<Movie> get movies;

  bool get isLoading;

  int get page;

  @nullable
  String get quality;

  BuiltList<String> genres;
}
