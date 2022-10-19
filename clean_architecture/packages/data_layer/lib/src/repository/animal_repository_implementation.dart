import 'package:data_layer/src/data_source/animal_data_source.dart';
import 'package:data_layer/src/models/animal_model.dart';
import 'package:data_layer/src/repository/animal_repository.dart';
import 'package:injectable/injectable.dart';

@LazySingleton()
class AnimalRepositoryImplementation implements AnimalRepository {
  AnimalDataSource? _animalDataSource;

  @override
  Future<ZooAnimal> getAnimal() async {
    ZooAnimal result = await _animalDataSource!.getAnimal();

    return result;
  }
}
