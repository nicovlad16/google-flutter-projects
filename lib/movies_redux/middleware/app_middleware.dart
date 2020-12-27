import 'package:meta/meta.dart';
import 'package:projects/movies_redux/actions/get_movies.dart';
import 'package:projects/movies_redux/data/movies_api.dart';
import 'package:projects/movies_redux/models/app_state.dart';
import 'package:projects/movies_redux/models/movie.dart';
import 'package:redux/redux.dart';

class AppMiddleware {
  const AppMiddleware({@required MoviesApi moviesApi})
      : assert(moviesApi != null),
        _moviesApi = moviesApi;

  final MoviesApi _moviesApi;

  List<Middleware<AppState>> get middleware {
    return <Middleware<AppState>>[
      _getMoviesMiddleware,
    ];
  }

  Future<void> _getMoviesMiddleware(Store<AppState> store, dynamic action, NextDispatcher next) async {
    next(action);

    if (action is! GetMoviesStart) {
      return;
    }

    try {
      final GetMoviesStart startAction = action as GetMoviesStart;

      final List<Movie> movies =
          await _moviesApi.getMovies(startAction.page, store.state.quality, store.state.genres.asList());

      final GetMoviesSuccessful successful = GetMovies.successful(movies);
      store.dispatch(successful);
    } catch (e) {
      final GetMoviesError error = GetMovies.error(e);
      store.dispatch(error);
    }
  }
}
