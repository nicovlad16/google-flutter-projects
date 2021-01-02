import 'package:flutter/cupertino.dart';
import 'package:meta/meta.dart';
import 'package:projects/movies_redux/actions/index.dart';
import 'package:projects/movies_redux/data/movies_api.dart';
import 'package:projects/movies_redux/models/index.dart';
import 'package:redux_epics/redux_epics.dart';
import 'package:rxdart/rxdart.dart';

class AppEpics {
  const AppEpics({@required MoviesApi moviesApi})
      : assert(moviesApi != null),
        _moviesApi = moviesApi;

  final MoviesApi _moviesApi;

  Epic<AppState> get epics {
    return combineEpics(<Epic<AppState>>[
      TypedEpic<AppState, GetMoviesStart>(_getMoviesStart),
    ]);
  }

  Stream<dynamic> _getMoviesStart(Stream<GetMoviesStart> actions, EpicStore<AppState> store) {
    return actions
        .asyncMap((GetMoviesStart action) {
          return _moviesApi.getMovies(
            action.page,
            store.state.quality,
            store.state.genres.asList(),
            store.state.orderBy,
          );
        })
        .map((List<Movie> movies) => GetMovies.successful(movies))
        .onErrorReturnWith((dynamic error) => GetMovies.error(error));
  }
}
