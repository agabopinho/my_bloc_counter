import 'package:equatable/equatable.dart';

abstract class CounterEvent extends Equatable {
  const CounterEvent();

  @override
  List<Object?> get props => [];
}

class Increment extends CounterEvent {
  final int count;

  Increment({this.count = 1});

  @override
  List<Object?> get props => [count];
}
