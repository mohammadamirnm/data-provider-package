import 'dart:async';
import 'package:flutter/material.dart';

class ProvidableValue<T> {
  final _controller = StreamController<T>();
  late Stream<T> _stream;
  late T _value;

  ProvidableValue({
    required T initial,
  }) {
    _value = initial;
    _stream = _controller.stream.asBroadcastStream();
  }
  T get value => _value;
  Stream<T> get stream => _stream;
  void notify(T data) => _controller.add(data);
  set value(T data) {
    _value = data;
    notify(data);
  }
}
