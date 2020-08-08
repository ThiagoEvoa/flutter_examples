class LoginException implements Exception {
  String message;

  LoginException(this.message);

  String getMessage() => message;
}
