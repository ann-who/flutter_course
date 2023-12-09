import 'package:firebase/data_layer/data_source/login_data_source.dart';
import 'package:firebase/resources/exceptions/logger.dart';
import 'package:firebase/resources/exceptions/login_exception.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FirebaseLoginDataSource implements LoginDataSource {
  final auth = FirebaseAuth.instance;

  @override
  Future<void> createOrSignIn(String email, String password) async {
    try {
      await auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
    } on FirebaseAuthException catch (e, s) {
      if (e.code == 'email-already-in-use') {
        auth.signInWithEmailAndPassword(
          email: email,
          password: password,
        );
      } else {
        logger.e('Login error', error: e, stackTrace: s);

        return Future.error(const LoginException('Login error'));
      }
    }
  }

  @override
  Future<void> signOut() async {
    await auth.signOut();
  }
}
