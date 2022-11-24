import 'package:business_layer/business_layer.dart';
import 'package:get_it/get_it.dart';
import 'package:data_layer/data_layer.dart';

class ServiceLocatorBlocs {
  static final _getIt = GetIt.instance;

  T get<T extends Object>() => _getIt.get<T>();

  static final instance = ServiceLocatorBlocs();

  void initializeBlocs() {
    ServiceLocatorServices.instance.initializeServices();

    _getIt.registerLazySingleton<AnimalBloc>(
      () => AnimalBloc(
        animalRepository:
            ServiceLocatorServices.instance.get<AnimalRepository>(),
      ),
    );
  }
}
