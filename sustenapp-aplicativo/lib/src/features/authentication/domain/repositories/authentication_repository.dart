abstract class AuthenticationRepository {
  Future<bool> isUserAlreadyLogged();

  Future<void> login({required String email, required String password});

  Future<void> register(
      {required String name,
      required String email,
      required String cpf,
      required String password});
}
