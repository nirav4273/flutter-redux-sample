import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:flutter_direction/store/store.dart';

class About extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            RaisedButton(
              child: new StoreConnector<MainReducer, UserRedcuer>(
                converter: (store) => store.state.userRedcuer,
                builder: (context, count) {
                  return new Text(
                    count.direction,
                    style: Theme.of(context).textTheme.display1,
                  );
                },
              ),
              onPressed: (){

              },
            )
          ],
        )
      ),
      floatingActionButton: new StoreConnector<MainReducer, VoidCallback>(
        converter: (store) {
          // Return a `VoidCallback`, which is a fancy name for a function
          // with no parameters. It only dispatches an Increment action.
          return () {
            print(store.state.userRedcuer.direction);
            return store.dispatch(ActionType(action: StoreAction.CHANGE_DIRECTOIN, data: store.state.userRedcuer.direction == 'LTR' ? "RTL" : "LTR"));
          };
        },
        builder: (context, callback) {
          return new FloatingActionButton(
            onPressed: callback,
            tooltip: 'Increment',
            child: new Icon(Icons.swap_horiz),
          );
        },
      ),
    );
  }
}