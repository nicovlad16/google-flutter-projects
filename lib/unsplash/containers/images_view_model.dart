part of containers;

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
