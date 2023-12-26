import 'package:firebase_auth/firebase_auth.dart';

// Login exceptions

class UserNotFoundAuthException implements Exception {}

class WrongPasswordAuthException implements Exception {}

// Register exceptions

class WeakPasswordAuthExpection implements Exception {}

class EmailAlreadyInUseAuthExpection implements Exception {}

class InvalidEmailAuthExpection implements Exception {}

// Generic exceptions

class GenericAuthException implements Exception {}

class UserNotLoggedInAuthException implements Exception {}
