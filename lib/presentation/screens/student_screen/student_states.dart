import '../../providers/screen_states.dart';

abstract class StudentStates {}

class StudentInitialState extends StudentStates {}

class StudentLoadingState extends StudentStates {}

class StudentSuccessState extends StudentStates {
  StudentSuccessState({this.message});

  final String? message;
}

class StudentErrorState extends StudentStates {
  StudentErrorState({required this.error, required this.errorType});

  final String error;
  final ErrorType errorType;
}
