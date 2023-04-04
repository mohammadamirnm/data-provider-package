import 'dart:async';

import 'package:flutter/material.dart';

import 'providable_value.dart';

class ProvidableValueConsumer<T> extends StatefulWidget {
  final Widget Function(BuildContext, T) builder;
  final ProvidableValue<T> providableValue;
  const ProvidableValueConsumer({
    Key? key,
    required this.providableValue,
    required this.builder,
  }) : super(key: key);
  @override
  State<ProvidableValueConsumer<T>> createState() =>
      _ProvidableValueConsumerState<T>();
}

class _ProvidableValueConsumerState<T>
    extends State<ProvidableValueConsumer<T>> {
  StreamSubscription<T>? _subscription;
  late T _value;
  @override
  void initState() {
    super.initState();
    final ProvidableValue<T> providableValue = widget.providableValue;
    _value = providableValue.value;
    _subscription = providableValue.stream.listen((T data) {
      setState(() {
        _value = data;
      });
    });
  }

  @override
  void dispose() {
    _subscription?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return widget.builder(context, _value);
  }
}
