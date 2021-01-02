import 'package:meta/meta.dart';
import 'package:projects/unsplash/actions/index.dart';
import 'package:projects/unsplash/data/unsplash_api.dart';
import 'package:projects/unsplash/models/index.dart';
import 'package:redux_epics/redux_epics.dart';
import 'package:rxdart/rxdart.dart';

class AppEpics {
  const AppEpics({@required UnsplashApi unsplashApi})
      : assert(unsplashApi != null),
        _unsplashApi = unsplashApi;

  final UnsplashApi _unsplashApi;

  Epic<AppState> get epics {
    return combineEpics(<Epic<AppState>>[
      TypedEpic<AppState, GetImagesStart>(_getImagesStart),
    ]);
  }

  Stream<dynamic> _getImagesStart(Stream<GetImagesStart> actions, EpicStore<AppState> store) {
    return actions
        .asyncMap((GetImagesStart action) => _unsplashApi.getImages(action.page))
        .map((List<UnsplashImage> images) => GetImages.successful(images))
        .onErrorReturnWith((dynamic error) => GetImages.error(error));
  }
}
