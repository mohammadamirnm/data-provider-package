# Data Provider Package

A simple implementation of a Flutter Data Provider.


This is an implementation of a state management package for the Flutter sample counter app.

<br></br>
### Sample Usage of “ProvidableValue” and “DataProvider”
```dart
class MyApp extends StatelessWidget {
  final counter = ProvidableValue(initial: 123);
  @override
  Widget build(BuildContext context) {
    return DataProvider<ProvidableValue<int>>(
        builder: (context) => MaterialApp(...), data: counter);
  }
}
```

### Sample Usage of “ProvidableValueConsumer”

```dart
  @override
  Widget build(BuildContext context) {
    final myApp = ancestorOf<MyApp>(context);
    return ProvidableValueConsumer<int>(
      builder: (context, counter) => Text('$counter'),
      providableValue: myApp.counter,
    );
  }
```

<br></br>
The source code of the package is available in the `data_provider_package` directory.