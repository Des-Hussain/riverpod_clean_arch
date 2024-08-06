import '../../providers/screen_states.dart';

abstract class TeacherStates {}

class TeacherInitialState extends TeacherStates {}

class TeacherLoadingState extends TeacherStates {}

class TeacherSuccessState extends TeacherStates {
  TeacherSuccessState({
    this.message,
  });

  final String? message;
}

class TeacherErrorState extends TeacherStates {
  TeacherErrorState({required this.error, required this.errorType});

  final String error;
  final ErrorType errorType;
}
