import 'package:flutter/material.dart';

import 'packages/data_provider_package/data_provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  final ProvidableValue<int> counter = ProvidableValue<int>(initial: 0);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      builder: (BuildContext context, Widget? child) =>
          DataProvider<ProvidableValue<int>>(
        builder: (BuildContext context) => child ?? Container(),
        data: counter,
      ),
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    final MyApp myApp = ancestorOf<MyApp>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            ProvidableValueConsumer<int>(
              builder: (BuildContext context, int counter) => Text(
                '$counter',
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              providableValue: myApp.counter,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => myApp.counter.value++,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
