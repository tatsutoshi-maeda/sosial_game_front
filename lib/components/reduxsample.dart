import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';

class MyHomePage extends StatelessWidget {
  Store<AppState> store = Store(reducer, initialState: AppState(0)); // ※1

  @override
  Widget build(BuildContext context) {
    return StoreProvider( // ※2
        store: store,
        child: Scaffold(
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  'You have pushed the button this many times:',
                ),
                StoreConnector( // ※3
                  converter: (Store<AppState> store) => store.state.counter,
                  builder: (context, counter) => Text(
                    '$counter',
                    style: Theme.of(context).textTheme.display1,
                  ),
                ),
              ],
            ),
          ),
          floatingActionButton: StoreConnector( // ※4
              converter: (Store<AppState> store) {
                return () => store.dispatch(Actions.Increment);},
              builder: (context, callback) => FloatingActionButton(
                onPressed: callback,
                tooltip: 'Increment',
                child: Icon(Icons.add),
              )
          ), // This trailing comma makes auto-formatting nicer for build methods.
        ));
  }
}


@immutable
class AppState {
  final int counter;
  AppState(this.counter);
}

enum Actions { Increment }

AppState reducer(AppState prev, action) {
  if (action == Actions.Increment) {
    return AppState(prev.counter + 1);
  }
  return prev;
}
