import 'dart:developer';
import 'package:categorize_student/src/model/student_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../services/api/api.dart';
import '../state/state.dart';

class StudentCubit extends Cubit<StudentState> {
  StudentCubit() : super(InitialState());
  List<String> feMaleModel = [];
  List<String> maleModel = [];

  void fetchData() async {
    emit(LoadingState());
    final response = await Api().fetchingStudentsData();
    log(response.toString());
    if (response is StudentModel) {
      categorizeStudent(response);
      emit(LoadedState());
    } else if (response == 'Network Error') {
      emit(NetworkErrorState());
    } else {
      emit(ErrorState());
    }
  }

  categorizeStudent(StudentModel studentModel) {
    studentModel.results![0].gender == 'female'
        ? feMaleModel.add(studentModel.results![0].name!.first!)
        : maleModel.add(studentModel.results![0].name!.first!);
  }
}
