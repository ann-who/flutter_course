part of 'animal_bloc.dart';

enum AnimalLoadingState {
  initial,
  loading,
  loaded,
}

class AnimalState {
  final ZooAnimal animal;
  final AnimalLoadingState loadingState;

  const AnimalState({
    this.animal = const ZooAnimal(
      animalType: '',
      name: '',
      imageUrl: '',
    ),
    this.loadingState = AnimalLoadingState.initial,
  });

  AnimalState copyWith({
    ZooAnimal? animal,
    AnimalLoadingState? loadingState,
  }) {
    return AnimalState(
      animal: animal ?? this.animal,
      loadingState: loadingState ?? this.loadingState,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        other is AnimalState &&
            runtimeType == other.runtimeType &&
            hashCode == other.hashCode;
  }

  @override
  int get hashCode => Object.hash(animal, loadingState);
}
