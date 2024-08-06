import '../../providers/screen_states.dart';

abstract class AuthStates {}

class AuthInitialState extends AuthStates {}

class AuthLoadingState extends AuthStates {}

class AuthSuccessState extends AuthStates {}

class AuthErrorState extends AuthStates {
  AuthErrorState({required this.error, required this.errorType});

  final String error;
  final ErrorType errorType;
}
