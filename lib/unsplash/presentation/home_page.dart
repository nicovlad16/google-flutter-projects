import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:projects/unsplash/actions/get_images.dart';
import 'package:projects/unsplash/containers/images_view_model.dart';
import 'package:projects/unsplash/models/app_state.dart';
import 'package:redux/redux.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  Widget build(BuildContext context) {
    return ImagesViewModelContainer(
      builder: (BuildContext context, ImagesViewModel imagesViewModel) {
        return Scaffold(
          appBar: AppBar(title: Text(title)),
          body: Builder(
            builder: (BuildContext context) {
              if (imagesViewModel.isLoading) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }

              return Column(
                children: <Widget>[

                  Expanded(
                    child: GridView.builder(
                      itemCount: imagesViewModel.images.length,
                      itemBuilder: (BuildContext context, int index) {
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Image.network(imagesViewModel.images[index].urls.small),
                        );
                      },
                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
                    ),
                  ),
                  RaisedButton(
                    child: const Text('load more'),
                    onPressed: () {
                      final Store<AppState> store = StoreProvider.of<AppState>(context);
                      store.dispatch(GetImages.start(store.state.page));
                    },
                  ),
                ],
              );
            },
          ),
        );
      },
    );
  }
}
