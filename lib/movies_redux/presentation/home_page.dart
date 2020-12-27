import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:projects/movies_redux/actions/get_movies.dart';
import 'package:projects/movies_redux/actions/set_genres.dart';
import 'package:projects/movies_redux/actions/set_order_by.dart';
import 'package:projects/movies_redux/actions/set_quality.dart';
import 'package:projects/movies_redux/containers/genres_container.dart';
import 'package:projects/movies_redux/containers/is_loading_container.dart';
import 'package:projects/movies_redux/containers/movie_container.dart';
import 'package:projects/movies_redux/containers/order_by_container.dart';
import 'package:projects/movies_redux/containers/quality_container.dart';
import 'package:projects/movies_redux/models/app_state.dart';
import 'package:projects/movies_redux/models/movie.dart';
import 'package:redux/redux.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key key, this.title}) : super(key: key);

  final String title;


  @override
  Widget build(BuildContext context) {
    return IsLoadingContainer(
      builder: (BuildContext context, bool isLoading) {
        return MoviesContainer(
          builder: (BuildContext context, List<Movie> movies) {
            return Scaffold(
              appBar: AppBar(
                title: Text(title),
                actions: <Widget>[
                  OrderByContainer(
                    builder: (BuildContext context, String orderBy) {
                      return IconButton(
                          icon: Icon(orderBy == 'desc' ? Icons.keyboard_arrow_down : Icons.keyboard_arrow_up),
                          onPressed: () {
                            StoreProvider.of<AppState>(context)
                              ..dispatch(SetOrderBy(orderBy == 'desc' ? 'asc' : 'desc'))
                              ..dispatch(const GetMovies.start(1));
                          });
                    },
                  )
                ],
              ),
              body: Builder(
                builder: (BuildContext context) {
                  if (isLoading) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }

                  return Column(
                    children: <Widget>[
                      GenresContainer(
                        builder: (BuildContext context, List<String> genres) {
                          return Wrap(
                            children: <String>[
                              'Comedy',
                              'Sci-Fi',
                              'Horror',
                              'Romance',
                              'Action',
                              'Thriller',
                              'Drama',
                              'Mystery',
                              'Crime',
                              'Animation',
                              'Adventure',
                              'Fantasy',
                              'Comedy-Romance',
                              'Action-Comedy',
                              'Superhero'
                            ].map((String genre) {
                              return ChoiceChip(
                                label: Text(genre),
                                selected: genres.contains(genre),
                                onSelected: (bool isSelected) {
                                  if (isSelected) {
                                    StoreProvider.of<AppState>(context)
                                      ..dispatch(SetGenres(<String>[genre]))
                                      ..dispatch(const GetMovies.start(1));
                                  } else {
                                    StoreProvider.of<AppState>(context)
                                      ..dispatch(const SetGenres(<String>[]))
                                      ..dispatch(const GetMovies.start(1));
                                  }
                                },
                              );
                            }).toList(),
                          );
                        },
                      ),
                      QualityContainer(
                        builder: (BuildContext context, String quality) {
                          return DropdownButton<String>(
                            value: quality,
                            hint: const Text('All'),
                            items: <String>['All', '720p', '1080p', '2160p', '3D'].map(
                              (String value) {
                                return DropdownMenuItem<String>(
                                  value: value,
                                  child: Text(value),
                                );
                              },
                            ).toList(),
                            onChanged: (String value) {
                              StoreProvider.of<AppState>(context)
                                ..dispatch(SetQuality(value))
                                ..dispatch(const GetMovies.start(1));
                            },
                          );
                        },
                      ),
                      Expanded(
                        child: GridView.builder(
                          itemCount: movies.length,
                          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 3,
                          ),
                          itemBuilder: (BuildContext context, int index) {
                            return Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Image.network(movies[index].image),
                            );
                          },
                        ),
                      ),
                      RaisedButton(
                        child: const Text('load more'),
                        onPressed: () {
                          final Store<AppState> store = StoreProvider.of<AppState>(context);
                          store.dispatch(GetMovies.start(store.state.page));
                        },
                      ),
                    ],
                  );
                },
              ),
            );
          },
        );
      },
    );
  }
}
