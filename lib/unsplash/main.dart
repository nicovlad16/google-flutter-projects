import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:http/http.dart';
import 'package:meta/meta.dart';
import 'package:projects/unsplash/actions/get_images.dart';
import 'package:projects/unsplash/data/unsplash_api.dart';
import 'package:projects/unsplash/presentation/home_page.dart';
import 'package:projects/unsplash/reducer/reducer.dart';
import 'package:redux/redux.dart';

import 'middleware/app_middleware.dart';
import 'models/app_state.dart';

void main() {
  final Client client = Client();
  final UnsplashApi api = UnsplashApi(client: client);
  final AppMiddleware appMiddleware = AppMiddleware(unsplashApi: api);
  final AppState initialState = AppState();
  final Store<AppState> store = Store<AppState>(
    reducer,
    initialState: initialState,
    middleware: appMiddleware.middleware,
  );

  store.dispatch(const GetImages.start(1));
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
        title: 'unsplash',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        debugShowCheckedModeBanner: false,
        home: const HomePage(title: 'unsplash'),
      ),
    );
  }
}
