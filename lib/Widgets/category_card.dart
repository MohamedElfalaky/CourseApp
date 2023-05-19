import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quizz_app/Helpers/helpers.dart';
import 'package:quizz_app/Screens/questions_screen.dart';

class CategoryCard extends StatelessWidget {
  String name;
  Color color;
  CategoryCard({super.key, required this.name, required this.color});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: InkWell(
        onTap: () {
          navigatePush(context, QuestionsScreen());
        },
        child: Container(
          width: double.infinity,
          color: color,
          child: Center(
              child: Text(
            name,
            style: GoogleFonts.cairo(
                fontSize: 30, color: Colors.white, fontWeight: FontWeight.bold),
          )),
        ),
      ),
    );
  }
}
