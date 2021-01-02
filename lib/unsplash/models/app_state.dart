part of models;

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
