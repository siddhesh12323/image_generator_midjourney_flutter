import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'prompt_event.dart';
part 'prompt_state.dart';

class PromptBloc extends Bloc<PromptEvent, PromptState> {
  PromptBloc() : super(PromptInitial()) {
    on<PromptEvent>((event, emit) {
      // TODO: implement event handler
    });

    on<PromptEnteredEvent>(onPromptEnteredEvent);
  }

  FutureOr<void> onPromptEnteredEvent(
      PromptEnteredEvent event, Emitter<PromptState> emit) {}
}
