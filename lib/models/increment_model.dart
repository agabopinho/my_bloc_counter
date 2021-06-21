import 'package:equatable/equatable.dart';

class IncrementModel extends Equatable {
  final int value;

  IncrementModel(this.value);

  @override
  List<Object?> get props => [value];
}
