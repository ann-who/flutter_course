import 'package:firebase/data_layer/data_source/resources_data_source.dart';
import 'package:firebase/resources/exceptions/logger.dart';
import 'package:firebase_storage/firebase_storage.dart';

class FirebaseStorageDataSource implements ResourcesDataSource {
  final storage = FirebaseStorage.instance;

  @override
  Future<String> getImage(String imagePath) async {
    String url;
    try {
      url = await storage.ref(imagePath).getDownloadURL();
    } on FirebaseException catch (e, s) {
      logger.e('Loading error', error: e, stackTrace: s);
      return Future.error(Exception('Login error'));
    }

    return url;
  }
}
