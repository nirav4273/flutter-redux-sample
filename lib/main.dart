import 'package:flutter/material.dart';
import 'package:flutter_direction/screens/About.dart';
import 'package:flutter_direction/screens/Home.dart';
import 'package:flutter_direction/store/store.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';

void main() {
  final store = new Store<MainReducer>(mainReducer, initialState: MainReducer.initial());
  runApp(MyApp(store: store,));
}

class MyApp extends StatelessWidget {
  final Store<MainReducer> store;

  MyApp({Key key, this.store}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new StoreProvider<MainReducer>(
      // Pass the store to the StoreProvider. Any ancestor `StoreConnector`
      // Widgets will find and use this value as the `Store`.
      store: store,
      child: MaterialApp(
        initialRoute: '/',
        routes: {
          '/': (context) => Home(),
          '/about': (context) => About(),
        },
        builder: (BuildContext context, Widget child) {
          return StoreConnector<MainReducer, UserRedcuer>(
            converter: (store) => store.state.userRedcuer,
            builder: (context, user) {
              return Directionality(
                  child: child,
                  textDirection: user.direction == 'RTL' ? TextDirection.rtl : TextDirection.ltr
              );
            },
          );
        },
      ),
    );
  }
}
