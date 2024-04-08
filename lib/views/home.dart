import 'package:flutter/material.dart';
import 'package:flutter_boilerplate_mvvm_pattern/core/models/user.dart';
import 'package:flutter_boilerplate_mvvm_pattern/core/viewmodels/user_view_model.dart';
import 'package:flutter_boilerplate_mvvm_pattern/utils/operation_runner.dart';
import 'package:provider/provider.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends OperationRunnerState<MyHomePage> {
  final int _counter = 0;
  late UserViewModel _userViewModel;

  @override
  Widget build(BuildContext context) {
    //you can now use this viewmodel to execute functions and read data.
    _userViewModel = context.read<UserViewModel>();

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  void _incrementCounter() async {
    const operation = 'increment counter';

    final result = await runOperation<User?>(
      operation,
      () async {
        return await _userViewModel.fetchUser();
      },
    );

    print("===> hey $result");
    //Do whatever you want with the response. eg: You can navigate user to a new page.
  }
}
