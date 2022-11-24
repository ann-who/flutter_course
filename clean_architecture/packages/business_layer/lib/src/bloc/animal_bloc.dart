import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:data_layer/data_layer.dart';

part 'animal_event.dart';
part 'animal_state.dart';

class AnimalBloc extends Bloc<AnimalEvent, AnimalState> {
  AnimalRepository animalRepository;
  AnimalBloc({
    required this.animalRepository,
  }) : super(const AnimalState()) {
    on<GetAnimalButtonPressed>(_onGetAnimalButtonPressed);
  }

  void _onGetAnimalButtonPressed(
    GetAnimalButtonPressed event,
    Emitter<AnimalState> emit,
  ) async {
    emit(
      state.copyWith(
        loadingState: AnimalLoadingState.loading,
      ),
    );

    ZooAnimal animal;

    try {
      animal = await animalRepository.getAnimal();
    } catch (e) {
      emit(
        state.copyWith(
          loadingState: AnimalLoadingState.initial,
        ),
      );
      return;
    }

    emit(
      state.copyWith(
        animal: animal,
        loadingState: AnimalLoadingState.loaded,
      ),
    );
  }
}
