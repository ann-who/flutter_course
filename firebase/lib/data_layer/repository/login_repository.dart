abstract class LoginRepository {
  Future<void> createOrSignIn(String email, String password);
  Future<void> signOut();
}
