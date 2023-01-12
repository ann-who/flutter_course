import 'package:get_it/get_it.dart';
import 'package:data_layer/data_layer.dart';
import 'package:data_layer/src/data_source/animal_data_source.dart';
import 'package:data_layer/src/repository/animal_repository_implementation.dart';

class ServiceLocatorServices {
  static final _getIt = GetIt.instance;

  T get<T extends Object>() => _getIt.get<T>();

  static final instance = ServiceLocatorServices();

  void initializeServices() {
    _getIt.registerLazySingleton<AnimalRepository>(
      () => AnimalRepositoryImplementation(
        animalDataSource: _getIt<AnimalDataSource>(),
      ),
    );

    _getIt.registerLazySingleton<AnimalDataSource>(() => AnimalDataSource());
  }
}
