import 'package:flutter/cupertino.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:projects/unsplash/models/app_state.dart';
import 'package:projects/unsplash/models/unsplash_image.dart';
import 'package:redux/redux.dart';

class ImagesViewModelContainer extends StatelessWidget {
  const ImagesViewModelContainer({Key key, @required this.builder}) : super(key: key);

  final ViewModelBuilder<GetImagesViewModel> builder;

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, GetImagesViewModel>(
      builder: builder,
      converter: (Store<AppState> store) {
        return GetImagesViewModel(store.state.images.asList());
      },
    );
  }
}

class GetImagesViewModel {
  GetImagesViewModel(this.images);

  final List<UnsplashImage> images;
}
