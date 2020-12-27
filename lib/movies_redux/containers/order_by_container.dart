import 'package:flutter/cupertino.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:projects/movies_redux/models/app_state.dart';
import 'package:redux/redux.dart';

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
