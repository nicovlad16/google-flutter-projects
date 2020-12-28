import 'package:projects/unsplash/actions/get_images.dart';
import 'package:projects/unsplash/models/app_state.dart';

AppState reducer(AppState state, dynamic action) {
  final AppStateBuilder builder = state.toBuilder();

  if (action is GetImagesStart) {
  } else if (action is GetImagesSuccessful) {
    builder.images.addAll(action.images);
  }

  return builder.build();
}
