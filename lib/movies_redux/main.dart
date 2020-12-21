import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:http/http.dart';
import 'package:meta/meta.dart';
import 'package:projects/movies-redux/actions/get_movies.dart';
import 'package:projects/movies-redux/data/movies_api.dart';
import 'package:projects/movies-redux/middleware/app_middleware.dart';
import 'package:projects/movies-redux/models/app_state.dart';
import 'package:projects/movies-redux/presentation/home_page.dart';
import 'package:projects/movies-redux/reducer/reducer.dart';
import 'package:redux/redux.dart';

void main() {
  final Client client = Client();
  final MoviesApi api = MoviesApi(client: client);
  final AppMiddleware appMiddleware = AppMiddleware(moviesApi: api);
  final AppState initialState = AppState();
  final Store<AppState> store = Store<AppState>(
    reducer,
    initialState: initialState,
    middleware: appMiddleware.middleware,
  );

  store.dispatch(const GetMovies());
  runApp(MyApp(store: store));
}

class MyApp extends StatelessWidget {
  const MyApp({Key key, @required this.store}) : super(key: key);

  final Store<AppState> store;

  @override
  Widget build(BuildContext context) {
    return StoreProvider<AppState>(
      store: store,
      child: MaterialApp(
        title: 'movies',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        debugShowCheckedModeBanner: false,
        home: const HomePage(title: 'movies'),
      ),
    );
  }
}
