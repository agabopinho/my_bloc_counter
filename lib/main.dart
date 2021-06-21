import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_bloc_counter/blocs/blocs.dart';

import 'blocs/blocs.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MultiBlocProvider(
        providers: [
          BlocProvider<CounterBloc>(
            create: (context) => CounterBloc(),
          ),
        ],
        child: MyHomePage(title: 'Flutter Demo Home Page'),
      ),
    );
  }
}

class MyHomePage extends StatelessWidget {
  final String title;

  MyHomePage({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(title),
        ),
        body: BlocBuilder<CounterBloc, CounterState>(
          builder: (context, state) {
            var viewState = state as ViewCounter;

            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'You have pushed the button this many times:',
                  ),
                  Text(
                    '${viewState.incrementModel.value}',
                    style: Theme.of(context).textTheme.headline4,
                  ),
                ],
              ),
            );
          },
        ),
        floatingActionButton: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(vertical: 5.0),
              child: FloatingActionButton(
                child: Icon(Icons.add),
                onPressed: () => context.read<CounterBloc>().add(Increment(count: 10)),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 5.0),
              child: FloatingActionButton(
                child: Icon(Icons.add),
                onPressed: () => context.read<CounterBloc>().add(Increment(count: 1)),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 5.0),
              child: FloatingActionButton(
                child: Icon(Icons.remove),
                onPressed: () => context.read<CounterBloc>().add(Increment(count: -1)),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 5.0),
              child: FloatingActionButton(
                child: Icon(Icons.remove),
                onPressed: () => context.read<CounterBloc>().add(Increment(count: -10)),
              ),
            ),
          ],
        ));
  }
}
