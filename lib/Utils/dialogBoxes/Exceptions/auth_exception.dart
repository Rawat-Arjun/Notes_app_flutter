// login_page
class UserNotFoundAuthException implements Exception {}

class WrongPasswordAuthException implements Exception {}

//register_page
class EmailAlreadyInUseAuthException implements Exception {}

//generic exception
class GenericAuthException implements Exception {}

class UserNotLoggedInAuthException implements Exception {}