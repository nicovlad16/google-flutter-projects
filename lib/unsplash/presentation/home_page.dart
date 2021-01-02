import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:projects/unsplash/actions/index.dart';
import 'package:projects/unsplash/containers/index.dart';
import 'package:projects/unsplash/models/index.dart';
import 'package:redux/redux.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  Widget build(BuildContext context) {
    return ImagesViewModelContainer(
      builder: (BuildContext context, ImagesViewModel imagesViewModel) {
        return Scaffold(
          appBar: AppBar(
            title: Text(title),
          ),
          body: Builder(
            builder: (BuildContext context) {
              if (imagesViewModel.isLoading) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }

              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Column(
                  children: <Widget>[
                    TextFormField(
                      decoration: const InputDecoration(
                        icon: Icon(Icons.search),
                        hintText: 'search',
                      ),
                      onSaved: (String value) {},
                      validator: (String value) {
                        return value.trim() == '' ? 'please input term or leave empty' : null;
                      },
                    ),
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
                ),
              );
            },
          ),
        );
      },
    );
  }
}
