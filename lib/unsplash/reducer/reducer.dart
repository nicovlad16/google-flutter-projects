import 'package:projects/unsplash/actions/index.dart';
import 'package:projects/unsplash/models/index.dart';
import 'package:redux/redux.dart';

Reducer<AppState> reducer = combineReducers(<Reducer<AppState>>[
  TypedReducer<AppState, GetImagesStart>(_getImagesStart),
  TypedReducer<AppState, GetImagesSuccessful>(_getImagesSuccessful),
  TypedReducer<AppState, GetImagesError>(_getImagesError),
]);

// else if (action is SetSearchTerm) {
//   builder.searchTerm = action.searchTerm;
// }

AppState _getImagesStart(AppState state, GetImagesStart action) {
  return state.rebuild((AppStateBuilder b) {
    if (action.page == 1) {
      b.images.clear();
    }
    b.isLoading = true;
  });
}

AppState _getImagesSuccessful(AppState state, GetImagesSuccessful action) {
  return state.rebuild((AppStateBuilder b) {
    b
      ..images.addAll(action.images)
      ..isLoading = false
      ..page = b.page + 1;
  });
}

AppState _getImagesError(AppState state, GetImagesError action) {
  return state.rebuild((AppStateBuilder b) => b.isLoading = false);
}
