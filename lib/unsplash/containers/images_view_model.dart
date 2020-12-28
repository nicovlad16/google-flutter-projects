import 'package:flutter/cupertino.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:projects/unsplash/models/app_state.dart';
import 'package:projects/unsplash/models/unsplash_image.dart';
import 'package:redux/redux.dart';

class ImagesViewModelContainer extends StatelessWidget {
  const ImagesViewModelContainer({Key key, @required this.builder}) : super(key: key);

  final ViewModelBuilder<ImagesViewModel> builder;

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, ImagesViewModel>(
      builder: builder,
      converter: (Store<AppState> store) {
        final AppState state = store.state;
        return ImagesViewModel(
          state.images.asList(),
          state.isLoading,
        );
      },
    );
  }
}

class ImagesViewModel {
  ImagesViewModel(this.images, this.isLoading);

  final List<UnsplashImage> images;
  final bool isLoading;
}
