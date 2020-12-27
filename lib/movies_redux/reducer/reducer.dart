import 'package:projects/movies_redux/actions/get_movies.dart';
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
    builder.quality = action.quality;
  }

  return builder.build();
}
