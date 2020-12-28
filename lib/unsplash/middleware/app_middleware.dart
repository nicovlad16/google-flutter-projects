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
      _getImagesMiddleware,
    ];
  }

  Future<void> _getImagesMiddleware(Store<AppState> store, dynamic action, NextDispatcher next) async {
    next(action);

    if (action is! GetImagesStart) {
      return;
    }

    try {
      final GetImagesStart startAction = action as GetImagesStart;
      if (store.state.searchTerm == null) {
        final List<UnsplashImage> images = await _unsplashApi.getImages(startAction.page);
        final GetImagesSuccessful successful = GetImages.successful(images);
        store.dispatch(successful);
      } else {
        final List<UnsplashImage> images = await _unsplashApi.searchImages(startAction.page, store.state.searchTerm);
        final GetImagesSuccessful successful = GetImages.successful(images);
        store.dispatch(successful);
      }
    } catch (e) {
      final GetImagesError error = GetImages.error(e);
      store.dispatch(error);
    }
  }
}
