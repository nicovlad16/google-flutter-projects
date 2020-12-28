library app_state;

import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:projects/unsplash/models/unsplash_image.dart';

part 'app_state.g.dart';

abstract class AppState implements Built<AppState, AppStateBuilder> {
  factory AppState() {
    return _$AppState((AppStateBuilder builder) {
      builder
        ..isLoading = false
        ..page = 1
        ..searchTerm = null;
    });
  }

  AppState._();

  BuiltList<UnsplashImage> get images;

  bool get isLoading;

  int get page;

  @nullable
  String get searchTerm;
}
