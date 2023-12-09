abstract class LoginDataSource {
  Future<void> createOrSignIn(String email, String password);
  Future<void> signOut();
}
