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
      TypedMiddleware<AppState, GetMoviesStart>(_getMoviesStart),
    ];
  }

  Future<void> _getMoviesStart(Store<AppState> store, GetMoviesStart action, NextDispatcher next) async {
    next(action);

    try {
      final List<Movie> movies = await _moviesApi.getMovies(
          action.page, store.state.quality, store.state.genres.asList(), store.state.orderBy);

      final GetMoviesSuccessful successful = GetMovies.successful(movies);
      store.dispatch(successful);
    } catch (e) {
      final GetMoviesError error = GetMovies.error(e);
      store.dispatch(error);
    }
  }
}
