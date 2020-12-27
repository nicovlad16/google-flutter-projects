import 'package:built_collection/built_collection.dart';
import 'package:projects/movies_redux/actions/get_movies.dart';
import 'package:projects/movies_redux/actions/set_genres.dart';
import 'package:projects/movies_redux/actions/set_order_by.dart';
import 'package:projects/movies_redux/actions/set_quality.dart';
import 'package:projects/movies_redux/models/app_state.dart';

AppState reducer(AppState state, dynamic action) {
  final AppStateBuilder builder = state.toBuilder();

  if (action is GetMoviesStart) {
    builder.isLoading = true;
    if (action.page == 1) {
      builder.movies.clear();
    }
  } else if (action is GetMoviesSuccessful) {
    builder
      ..movies.addAll(action.movies)
      ..isLoading = false
      ..page = builder.page + 1;
  } else if (action is GetMoviesError) {
    builder.isLoading = false;
  } else if (action is SetQuality) {
    builder
      ..quality = action.quality
      ..movies.clear();
  } else if (action is SetGenres) {
    builder
      ..genres = ListBuilder<String>(action.genres)
      ..movies.clear();
  } else if (action is SetOrderBy) {
    builder
      ..orderBy = action.orderBy
      ..movies.clear();
  }

  return builder.build();
}
