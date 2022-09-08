import 'package:categorize_student/src/features/student/cubit/cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../config/light_theme.dart';
import '../../../widgets/widgets.dart';

class StudentsView extends StatelessWidget {
  const StudentsView({Key? key, required}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        backgroundColor: LightTheme.primary,
        appBar: AppBar(
          title: const CustomHead(
            text: 'Categorys',
            size: 40,
          ),
          toolbarHeight: 80,
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        body: BlocBuilder<StudentCubit, StudentState>(
          builder: (context, state) {
            if (state is LoadingState) {
              return Center(
                child: CircularProgressIndicator(
                  color: LightTheme.secondary,
                  strokeWidth: 10,
                ),
              );
            } else if (state is ErrorState) {
              return Center(
                child: Text(
                  'Something Went Wrong !',
                  style: TextStyle(
                    color: LightTheme.secondary,
                    fontWeight: FontWeight.w700,
                    fontSize: 25,
                  ),
                ),
              );
            } else if (state is NetworkErrorState) {
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Connection Refused !',
                      style: TextStyle(
                          color: LightTheme.secondary,
                          fontWeight: FontWeight.w700,
                          fontSize: 25),
                    ),
                    const SizedBox(height: 20),
                    CustomButton(
                      height: 50,
                      width: 100,
                      textSize: 18,
                      onTap: () => context.read<StudentCubit>().fetchData(),
                      label: 'Retry',
                    ),
                  ],
                ),
              );
            } else if (state is LoadedState) {
              return SingleChildScrollView(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        const CustomHead(text: '👨 Male'),
                        SizedBox(
                          height: size.height * 0.7,
                          width: size.width * 0.5,
                          child: ListView.separated(
                            itemCount:
                                context.read<StudentCubit>().maleModel.length,
                            primary: false,
                            shrinkWrap: true,
                            physics: const ScrollPhysics(),
                            separatorBuilder:
                                (BuildContext context, int index) {
                              return Container();
                            },
                            itemBuilder: (BuildContext context, int index) {
                              return ListTile(
                                title: Text(
                                  '* ${context.read<StudentCubit>().maleModel[index]}',
                                  style: TextStyle(
                                    color: LightTheme.secondary,
                                    fontSize: 23,
                                    fontWeight: FontWeight.w900,
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        const CustomHead(text: '👩 Female'),
                        SizedBox(
                          height: size.height * 0.7,
                          width: size.width * 0.5,
                          child: ListView.separated(
                            itemCount:
                                context.read<StudentCubit>().feMaleModel.length,
                            primary: false,
                            shrinkWrap: true,
                            physics: const ScrollPhysics(),
                            separatorBuilder:
                                (BuildContext context, int index) {
                              return Container();
                            },
                            itemBuilder: (BuildContext context, int index) {
                              return ListTile(
                                title: Text(
                                  '* ${context.read<StudentCubit>().feMaleModel[index]}',
                                  style: TextStyle(
                                    color: LightTheme.secondary,
                                    fontSize: 23,
                                    fontWeight: FontWeight.w900,
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              );
            } else {
              return Center(
                child: Text(
                  ' No Data Yet ! Make Action 👊',
                  style: TextStyle(
                    color: LightTheme.secondary,
                    fontWeight: FontWeight.w700,
                    fontSize: 25,
                  ),
                ),
              );
            }
          },
        ),
        floatingActionButton: FloatingActionButton.extended(
          onPressed: () => context.read<StudentCubit>().fetchData(),
          label: Text(
            'Action 👊',
            style: TextStyle(
              color: LightTheme.secondary,
              fontWeight: FontWeight.w700,
              fontSize: 25,
            ),
          ),
        ),
      ),
    );
  }
}
