import 'package:projects/movies_redux/actions/get_movies.dart';
import 'package:projects/unsplash/actions/get_images.dart';
import 'package:projects/unsplash/models/app_state.dart';

AppState reducer(AppState state, dynamic action) {
  final AppStateBuilder builder = state.toBuilder();

  if (action is GetImagesStart) {
    if (action.page == 1) {
      builder.images.clear();
    }
    builder.isLoading = true;
  } else if (action is GetImagesSuccessful) {
    builder
      ..images.addAll(action.images)
      ..isLoading = false
      ..page = builder.page + 1;
  } else if (action is GetMoviesError) {
    builder.isLoading = false;
  }
  // else if (action is SetSearchTerm) {
  //   builder.searchTerm = action.searchTerm;
  // }

  return builder.build();
}
