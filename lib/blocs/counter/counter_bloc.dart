import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_bloc_counter/blocs/counter/counter_events.dart';
import 'package:my_bloc_counter/blocs/counter/counter_states.dart';
import 'package:my_bloc_counter/models/increment_model.dart';

class CounterBloc extends Bloc<CounterEvent, CounterState> {
  CounterBloc() : super(ViewCounter(IncrementModel(0)));

  @override
  Stream<CounterState> mapEventToState(CounterEvent event) async* {
    if (state is ViewCounter) {
      var previous = state as ViewCounter;
      if (event is Increment) {
        yield ViewCounter(IncrementModel(previous.incrementModel.value + event.count));
      }
    }
  }
}
