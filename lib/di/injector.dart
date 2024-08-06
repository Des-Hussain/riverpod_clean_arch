import 'package:riverpod_clean_arch/data/repositories/auth_repository.dart';
import 'package:riverpod_clean_arch/data/repositories/student_repository.dart';
import 'package:riverpod_clean_arch/data/repositories/teacher_repositories.dart';
import 'package:get_it/get_it.dart';

class Injector {
  Injector._();

  static final _dependency = GetIt.instance;

  static void setup() {
    _dependency
        .registerLazySingleton<AuthRepository>(() => AuthRepositoryImpl());
    _dependency.registerLazySingleton<StudentRepository>(
        () => StudentRepositoryImpl());
    _dependency.registerLazySingleton<TeacherRepository>(
        () => TeacherRepositoryImpl());
  }
}
