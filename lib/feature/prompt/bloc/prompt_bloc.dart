import 'dart:async';
import 'dart:ffi';
import 'dart:io';
import 'dart:typed_data';

import 'package:bloc/bloc.dart';
import 'package:flutter_image_generation/feature/prompt/repos/prompt_repo.dart';
import 'package:meta/meta.dart';

part 'prompt_event.dart';
part 'prompt_state.dart';

class PromptBloc extends Bloc<PromptEvent, PromptState> {
  PromptBloc() : super(PromptInitial()) {
    on<PromptInitialEvent>(promptInitialEvent);

    on<PromptEnteredEvent>(onPromptEnteredEvent);
  }

  FutureOr<void> onPromptEnteredEvent(
      PromptEnteredEvent event, Emitter<PromptState> emit) async {
    emit(PromptGeneratingImageLoadState());
    Uint8List? bytes = await PromptRepo.generateImage(event.prompt);
    if (bytes != null) {
      emit(PromptGeneratingImageSuccessState(Uint8List.fromList(bytes)));
    } else {
      emit(PromptGeneratingImageErrorState());
    }
  }

  FutureOr<void> promptInitialEvent(event, Emitter<PromptState> emit) async {
    // Uint8List bytes = await File(
    //         "/home/siddhesh/Flutter_Projects/flutter_image_generation/assets/file.png")
    //     .readAsBytes();
    emit(PromptGeneratingImageLoadState());
  }
}
