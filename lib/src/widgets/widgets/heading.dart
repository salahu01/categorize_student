import 'package:categorize_student/src/config/light_theme.dart';
import 'package:flutter/material.dart';

class CustomHead extends StatelessWidget {
  const CustomHead({Key? key,required this.text, this.size}) : super(key: key);
  final String text;
  final double? size;

  @override
  Widget build(BuildContext context) {
    return Text(text,style: TextStyle(
      color: LightTheme.secondary,
      fontSize: size ?? 30,
      fontWeight: FontWeight.w900,
    ),);
  }
}