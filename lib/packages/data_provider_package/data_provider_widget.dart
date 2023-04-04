import 'package:flutter/material.dart';

class DataProvider<T> extends StatelessWidget {
  final WidgetBuilder builder;
  final T data;
  const DataProvider({Key? key, required this.builder, required this.data})
      : super(key: key);
  @override
  Widget build(BuildContext context) => builder(context);
}

T ancestorOf<T extends Widget>(BuildContext context) {
  final widget = context.findAncestorWidgetOfExactType<T>();
  if (widget != null) {
    return widget;
  }
  throw Exception('Ancestor widget "${T.toString()}" not found.');
}
