import 'package:data_layer/src/data_source/animal_data_source.dart';
import 'package:data_layer/src/models/animal_model.dart';
import 'package:data_layer/src/repository/animal_repository.dart';

class AnimalRepositoryImplementation implements AnimalRepository {
  final AnimalDataSource animalDataSource;

  const AnimalRepositoryImplementation({required this.animalDataSource});

  @override
  Future<AnimalModel> getAnimal() async {
    AnimalModel result = await animalDataSource.getAnimal();

    return result;
  }
}
