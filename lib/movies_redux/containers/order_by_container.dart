part of containers;

class OrderByContainer extends StatelessWidget {
  const OrderByContainer({Key key, @required this.builder}) : super(key: key);

  final ViewModelBuilder<String> builder;

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, String>(
      builder: builder,
      converter: (Store<AppState> store) => store.state.orderBy,
    );
  }
}
