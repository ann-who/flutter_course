import 'package:data_layer/src/models/animal_model.dart';

abstract class AnimalRepository {
  Future<AnimalModel> getAnimal();
}
