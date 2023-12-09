import 'package:firebase/data_layer/data_source/resources_data_source.dart';
import 'package:firebase/data_layer/repository/resources_repository.dart';

class ResourcesRepositoryImplementation implements ResourcesRepository {
  final ResourcesDataSource resourcesDataSource;

  const ResourcesRepositoryImplementation({required this.resourcesDataSource});

  @override
  Future<String> getImage(String imagePath) async {
    return await resourcesDataSource.getImage(imagePath);
  }
}
