import 'package:meta/meta.dart';
import 'package:projects/unsplash/actions/get_images.dart';
import 'package:projects/unsplash/data/unsplash_api.dart';
import 'package:projects/unsplash/models/app_state.dart';
import 'package:projects/unsplash/models/unsplash_image.dart';
import 'package:redux/redux.dart';

class AppMiddleware {
  const AppMiddleware({@required UnsplashApi unsplashApi})
      : assert(unsplashApi != null),
        _unsplashApi = unsplashApi;

  final UnsplashApi _unsplashApi;

  List<Middleware<AppState>> get middleware {
    return <Middleware<AppState>>[
      TypedMiddleware<AppState, GetImagesStart>(_getImagesStart),
    ];
  }

  Future<void> _getImagesStart(Store<AppState> store, dynamic action, NextDispatcher next) async {
    next(action);
    try {
      if (store.state.searchTerm == null) {
        final List<UnsplashImage> images = await _unsplashApi.getImages(action.page);
        final GetImagesSuccessful successful = GetImages.successful(images);
        store.dispatch(successful);
      } else {
        final List<UnsplashImage> images = await _unsplashApi.searchImages(action.page, store.state.searchTerm);
        final GetImagesSuccessful successful = GetImages.successful(images);
        store.dispatch(successful);
      }
    } catch (e) {
      final GetImagesError error = GetImages.error(e);
      store.dispatch(error);
    }
  }
}
