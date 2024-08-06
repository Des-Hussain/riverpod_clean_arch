import 'package:riverpod_clean_arch/data/models/teacher_model.dart';
import 'package:riverpod_clean_arch/data/repositories/teacher_repositories.dart';
import 'package:riverpod_clean_arch/presentation/providers/screen_states.dart';
import 'package:riverpod_clean_arch/presentation/screens/teacher_module/teacher_states.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get_it/get_it.dart';

final teacherNotifierProvider =
    StateNotifierProvider<TeacherNotifier, TeacherStates>((ref) =>
        TeacherNotifier(
            ref: ref, studentRepository: GetIt.I<TeacherRepository>()));

class TeacherNotifier extends StateNotifier<TeacherStates> {
  final Ref ref;
  final TeacherRepository studentRepository;

  TeacherNotifier({required this.ref, required this.studentRepository})
      : super(TeacherInitialState());
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  Future getAllTeachersData() async {
    try {
      state = TeacherLoadingState();
      ref.read(teacherListProvider).clear();
      final response = await studentRepository.getAllTeachers();
      ref.read(teacherListProvider.notifier).update((state) => response);

      state = TeacherSuccessState();
    } catch (e) {
      state =
          TeacherErrorState(error: e.toString(), errorType: ErrorType.other);
    }
  }

  Future getTeacherById({required String teacherId}) async {
    try {
      state = TeacherLoadingState();
      final response = await studentRepository.getTeacherById(id: teacherId);
      ref.watch(singleTeacherDataProvider.notifier).update((state) => response);
      state = TeacherSuccessState();
    } catch (e) {
      state =
          TeacherErrorState(error: e.toString(), errorType: ErrorType.other);
    }
  }

  Future updateTeacherBy({required TeacherModel teacherModel}) async {
    try {
      state = TeacherLoadingState();
      final res =
          await studentRepository.updateTeacher(teacherModel: teacherModel);
      ref.read(teacherNotifierProvider.notifier).getAllTeachersData();

      state = TeacherSuccessState(message: res);
    } catch (e) {
      state =
          TeacherErrorState(error: e.toString(), errorType: ErrorType.other);
    }
  }

  Future addTeacher({required TeacherModel teacherModel}) async {
    try {
      state = TeacherLoadingState();

      final res =
          await studentRepository.addTeacher(teacherModel: teacherModel);
      ref.read(teacherNotifierProvider.notifier).getAllTeachersData();

      state = TeacherSuccessState(message: res);
    } catch (e) {
      state =
          TeacherErrorState(error: e.toString(), errorType: ErrorType.other);
    }
  }

  Future deleteTeacher({required String teacherId}) async {
    try {
      state = TeacherLoadingState();

      await studentRepository.deleteTeacher(id: teacherId);
      ref.read(teacherNotifierProvider.notifier).getAllTeachersData();

      state = TeacherSuccessState();
    } catch (e) {
      state =
          TeacherErrorState(error: e.toString(), errorType: ErrorType.other);
    }
  }

  Future searchTeacher({required String teacherName}) async {
    try {
      state = TeacherLoadingState();

      final res = await studentRepository.searchTeacher(name: teacherName);

      ref.read(teacherListProvider).clear();
      ref.read(teacherListProvider.notifier).update((state) => res);
      state = TeacherSuccessState();
    } catch (e) {
      state =
          TeacherErrorState(error: e.toString(), errorType: ErrorType.other);
    }
  }
}

final teacherListProvider = StateProvider<List<TeacherModel>>((ref) => []);
final singleTeacherDataProvider = StateProvider<TeacherModel>((ref) =>
    TeacherModel(
        name: 'name',
        phoneNumber: 'phoneNumber',
        address: 'address',
        emergencyNumber: 'emergencyNumber',
        designation: 'designation',
        isActive: false));
