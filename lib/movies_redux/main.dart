import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:http/http.dart';
import 'package:meta/meta.dart';
import 'package:projects/movies_redux/actions/index.dart';
import 'package:projects/movies_redux/data/movies_api.dart';
import 'package:projects/movies_redux/epics/app_epics.dart';
import 'package:projects/movies_redux/models/index.dart';
import 'package:projects/movies_redux/presentation/home_page.dart';
import 'package:projects/movies_redux/reducer/reducer.dart';
import 'package:redux/redux.dart';
import 'package:redux_epics/redux_epics.dart';

void main() {
  final Client client = Client();
  final MoviesApi api = MoviesApi(client: client);
  final AppEpics appEpics = AppEpics(moviesApi: api);
  final AppState initialState = AppState();
  final Store<AppState> store = Store<AppState>(
    reducer,
    initialState: initialState,
    middleware: <Middleware<AppState>>[
      EpicMiddleware<AppState>(appEpics.epics),
    ],
  );

  store.dispatch(const GetMovies.start(1));
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
