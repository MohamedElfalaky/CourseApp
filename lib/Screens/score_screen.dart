import 'package:flutter/material.dart';
import 'package:quizz_app/Helpers/helpers.dart';
import 'package:quizz_app/Screens/login_screen.dart';
import 'package:quizz_app/Styles/styles.dart';
import '../Helpers/golobal_variables.dart';
import 'package:quizz_app/Helpers/shared_data.dart';
import './questions_screen.dart';

class ScoreScree extends StatelessWidget {
  int score;
  ScoreScree({super.key, required this.score});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Directionality(
        textDirection: TextDirection.rtl,
        child: Container(
          // height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          margin: EdgeInsets.all(12),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            // crossAxisAlignment: CrossAxisAlignment.center,
            // mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Spacer(),
              Text(
                "اهلا ${userName.text}، لقد قمت بانهاء الاختبار",
                style: secondaryAppTextStyle,
              ),
              Text(
                "نتيجتك هي $score /${quesList1.length}",
                style: primaryAppTextStyle.copyWith(fontSize: 16),
              ),
              Spacer(),
              TextButton(
                onPressed: () {
                  navigatePush(context, LoginScreen());
                },
                child: Text(
                  "قم باعادة الاختبار",
                  style: primaryAppTextStyle.copyWith(fontSize: 16),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
