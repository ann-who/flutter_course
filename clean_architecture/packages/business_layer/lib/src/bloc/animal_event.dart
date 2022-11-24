part of 'animal_bloc.dart';

abstract class AnimalEvent {
  const AnimalEvent();
}

class GetAnimalButtonPressed extends AnimalEvent {
  const GetAnimalButtonPressed();
}
