import 'package:equatable/equatable.dart';
import 'package:my_bloc_counter/models/increment_model.dart';

abstract class CounterState extends Equatable {
  const CounterState();

  @override
  List<Object?> get props => [];
}

class ViewCounter extends CounterState {
  final IncrementModel incrementModel;

  const ViewCounter(this.incrementModel);

  @override
  List<Object?> get props => [incrementModel];
}
