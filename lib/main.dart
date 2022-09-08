import 'package:categorize_student/src/features/student/cubit/cubit.dart';
import 'package:categorize_student/src/features/student/view/view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => StudentCubit(),
        ),
      ],
      child:const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: StudentsView(), 
      ),
    );
  }
}
