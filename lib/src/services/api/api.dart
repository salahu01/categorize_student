import 'dart:developer';
import 'dart:io';
import 'package:categorize_student/src/model/student_model.dart';
import 'package:dio/dio.dart';

class Api {
  final studentsUri = 'https://randomuser.me/api';

  Future<dynamic> fetchingStudentsData()async{
    try {
      final response = await Dio().get(studentsUri);
      log(response.toString());
      return StudentModel.fromJson(response.data);
    } on DioError catch (e) {
      if (e.error is SocketException) {
        return 'Network Error';
      }
      log(e.error.toString());
      return 'error';
    }
  }
}
