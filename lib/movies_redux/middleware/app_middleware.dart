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

    if (action is! GetMovies) {
      return;
    }

    try {
      final List<Movie> movies = await _moviesApi.getMovies();
      final GetMoviesSuccessful successful = GetMoviesSuccessful(movies);
      store.dispatch(successful);
    } catch (e) {
      final GetMoviesError error = GetMoviesError(e);
      store.dispatch(error);
    }
  }
}
