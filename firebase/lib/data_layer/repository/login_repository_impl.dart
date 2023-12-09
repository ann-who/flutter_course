import 'package:firebase/data_layer/data_source/login_data_source.dart';
import 'package:firebase/data_layer/repository/login_repository.dart';

class LoginRepositoryImplementation implements LoginRepository {
  final LoginDataSource loginDataSource;

  const LoginRepositoryImplementation({required this.loginDataSource});

  @override
  Future<void> createOrSignIn(String email, String password) async {
    await loginDataSource.createOrSignIn(email, password);
  }

  @override
  Future<void> signOut() async {
    await loginDataSource.signOut();
  }
}
