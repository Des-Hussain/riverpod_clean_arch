import 'package:riverpod_clean_arch/data/models/class_model.dart';
import 'package:riverpod_clean_arch/data/models/student_model.dart';
import 'package:riverpod_clean_arch/data/repositories/student_repository.dart';
import 'package:riverpod_clean_arch/presentation/providers/screen_states.dart';
import 'package:riverpod_clean_arch/presentation/screens/student_screen/student_states.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get_it/get_it.dart';

final studentNotifierProvider =
    StateNotifierProvider<StudentNotifier, StudentStates>((ref) =>
        StudentNotifier(
            ref: ref, studentRepository: GetIt.I<StudentRepository>()));

class StudentNotifier extends StateNotifier<StudentStates> {
  final Ref ref;
  final StudentRepository studentRepository;

  StudentNotifier({required this.ref, required this.studentRepository})
      : super(StudentInitialState());

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final GlobalKey<FormState> classFormKey = GlobalKey<FormState>();
  final searchController = TextEditingController();
  final String selectedSearchItem = 'Search By Name';
  int selectedOption = 0;

  Future getAllStudentsData() async {
    try {
      state = StudentLoadingState();
      ref.read(studentListProvider).clear();
      final response = await studentRepository.getAllStudents();
      ref.read(studentListProvider.notifier).update((state) => response);
      await getFreezeCount();
      state = StudentSuccessState();
    } catch (e) {
      state =
          StudentErrorState(error: e.toString(), errorType: ErrorType.other);
    }
  }

  Future getStudentById({required String studentId}) async {
    try {
      state = StudentLoadingState();
      print(studentId);
      final response = await studentRepository.getStudentById(id: studentId);
      ref.watch(singlestudentProvider.notifier).update((state) => response);
      print(response.toJson());
      state = StudentSuccessState();
    } catch (e) {
      state =
          StudentErrorState(error: e.toString(), errorType: ErrorType.other);
    }
  }

  Future addStudent({required StudentModel studentModel}) async {
    try {
      state = StudentLoadingState();

      final response =
          await studentRepository.addStudent(studentModel: studentModel);
      ref.read(studentNotifierProvider.notifier).getAllStudentsData();

      state = StudentSuccessState(message: response);
    } catch (e) {
      state =
          StudentErrorState(error: e.toString(), errorType: ErrorType.other);
    }
  }

  Future updateStudent({required StudentModel studentModel}) async {
    try {
      state = StudentLoadingState();

      final res = await studentRepository.updateStudent(model: studentModel);
      ref.read(studentNotifierProvider.notifier).getAllStudentsData();

      state = StudentSuccessState(message: res);
    } catch (e) {
      state =
          StudentErrorState(error: e.toString(), errorType: ErrorType.other);
    }
  }

  Future deleteStudent({required String studentId}) async {
    try {
      state = StudentLoadingState();

      final response = await studentRepository.deleteStudent(id: studentId);
      ref.read(studentNotifierProvider.notifier).getAllStudentsData();

      state = StudentSuccessState();
    } catch (e) {
      state =
          StudentErrorState(error: e.toString(), errorType: ErrorType.other);
    }
  }

  Future searchByName({required String name}) async {
    try {
      state = StudentLoadingState();
      ref.read(studentListProvider).clear();
      final response = await studentRepository.searchByName(name: name);
      ref.read(studentListProvider.notifier).update((state) => response);

      state = StudentSuccessState();
    } catch (e) {
      state =
          StudentErrorState(error: e.toString(), errorType: ErrorType.other);
    }
  }

  Future searchByFatherName({required String fatherName}) async {
    try {
      state = StudentLoadingState();
      ref.read(studentListProvider).clear();
      final response =
          await studentRepository.searchByFatherName(fatherName: fatherName);
      ref.read(studentListProvider.notifier).update((state) => response);

      state = StudentSuccessState();
    } catch (e) {
      state =
          StudentErrorState(error: e.toString(), errorType: ErrorType.other);
    }
  }

  Future searchByGrNum({required String number}) async {
    try {
      state = StudentLoadingState();
      ref.read(studentListProvider).clear();
      final response = await studentRepository.searchByGRNum(number: number);
      ref
          .read(studentListProvider.notifier)
          .update((state) => state = [response]);

      state = StudentSuccessState();
    } catch (e) {
      state =
          StudentErrorState(error: e.toString(), errorType: ErrorType.other);
    }
  }

  Future toggleFreezeStatus({required String id}) async {
    try {
      state = StudentLoadingState();
      final response = await studentRepository.toggleFreezeStatus(id: id);
      getAllStudentsData();

      state = StudentSuccessState();
    } catch (e) {
      state =
          StudentErrorState(error: e.toString(), errorType: ErrorType.other);
    }
  }

  Future getFreezeCount() async {
    try {
      state = StudentLoadingState();
      final res = await studentRepository.getFreezeCount();
      ref
          .read(freezeCountProvider.notifier)
          .update((state) => int.tryParse(res) ?? 0);
      state = StudentSuccessState();
    } catch (e) {
      state =
          StudentErrorState(error: e.toString(), errorType: ErrorType.other);
    }
  }

  Future getFeeDeatilsById({required String id}) async {
    try {
      state = StudentLoadingState();
      final response = await studentRepository.getFeeDetailsById(id: id);
      ref.read(feeDetailsByIdProvider.notifier).state = response;

      state = StudentSuccessState();
    } catch (e) {
      state =
          StudentErrorState(error: e.toString(), errorType: ErrorType.other);
    }
  }

  Future createFeeChallan({required FeesModel model}) async {
    try {
      state = StudentLoadingState();
      final response = await studentRepository.createFeeChallan(model: model);
      // ref.read(feeDetailsByIdProvider.notifier).state = response;
      getAllStudentsData();
      
      state = StudentSuccessState(message: response);
    } catch (e) {
      state =
          StudentErrorState(error: e.toString(), errorType: ErrorType.other);
    }
  }

  Future getClassList() async {
    try {
      state = StudentLoadingState();

      final response = await studentRepository.getClassList();
      ref.read(classListProvider).clear();
      ref.read(classListProvider).addAll(response);
      state = StudentSuccessState();
    } catch (e) {
      state =
          StudentErrorState(error: e.toString(), errorType: ErrorType.other);
    }
  }

  Future addClass(ClassModel classModel) async {
    try {
      state = StudentLoadingState();

      final response = await studentRepository.addClass(classModel);
      state = StudentSuccessState(message: response);
    } catch (e) {
      state =
          StudentErrorState(error: e.toString(), errorType: ErrorType.other);
    }
  }

  Future deleteClass({required String id}) async {
    try {
      state = StudentLoadingState();
      final response = await studentRepository.deleteClass(id);
      getClassList();
      state = StudentSuccessState(message: response);
    } catch (e) {
      state =
          StudentErrorState(error: e.toString(), errorType: ErrorType.other);
    }
  }
}

final classListProvider = StateProvider<List<ClassModel>>((ref) => []);
final studentListProvider = StateProvider<List<StudentModel>>((ref) => []);
final singlestudentProvider =
    StateProvider<StudentModel>((ref) => StudentModel());
final feeDetailsByIdProvider = StateProvider<FeesModel>((ref) => FeesModel());
final isFreezedProvider = StateProvider((ref) => false);
final freezeCountProvider = StateProvider<int>((ref) => 0);
