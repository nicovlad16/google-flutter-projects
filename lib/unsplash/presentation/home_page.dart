import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:projects/unsplash/containers/images_view_model_container.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  Widget build(BuildContext context) {
    return ImagesViewModelContainer(
      builder: (BuildContext context, GetImagesViewModel imagesViewModel) {
        return Scaffold(
          appBar: AppBar(title: Text(title)),
          body: Builder(
            builder: (BuildContext context) {
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
                ],
              );
            },
          ),
        );
      },
    );
  }
}
