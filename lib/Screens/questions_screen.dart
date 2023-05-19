import 'package:flutter/material.dart';
import 'package:quizz_app/Helpers/helpers.dart';
import 'package:quizz_app/Helpers/shared_data.dart';
import 'package:quizz_app/Screens/score_screen.dart';

class QuestionsScreen extends StatefulWidget {
  QuestionsScreen({super.key});

  @override
  State<QuestionsScreen> createState() => _QuestionsScreenState();
}

class _QuestionsScreenState extends State<QuestionsScreen> {
  int questionsAnswersIndex = 0;
  int score = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(" ${questionsAnswersIndex + 1}/${quesList1.length}"),
            Text("اختبار رياضي")
          ],
        ),
      ),
      body: Container(
        width: double.infinity,
        margin: const EdgeInsets.all(15),
        child: Column(
          children: [
            RichText(
                text: TextSpan(style: const TextStyle(fontSize: 22), children: [
              TextSpan(
                  text: "السؤال رقم ${questionsAnswersIndex + 1}:\n",
                  style: TextStyle(
                      color: Colors.black, fontWeight: FontWeight.bold)),
              TextSpan(
                  text: quesList1[questionsAnswersIndex]["question"],

                  //  " كم عدد لاعبي كرة القدم",
                  style: const TextStyle(
                      fontSize: 18,
                      color: Colors.red,
                      fontWeight: FontWeight.bold)),
            ])),
            SizedBox(
              height: MediaQuery.of(context).size.height / 8,
            ),

            //list function
// map functions returens : a list
            // ماب بتلوب علي اللستة عنصر عنصر، وبترجع كل عنصر مرة تانية بالشكل الجديد اللي انا عايزه
            ...(quesList1[questionsAnswersIndex]["Answers"] as List)
                .map((oneItem) {
              return ElevatedButton(
                  onPressed: () {
                    // score = score +  oneItem["score"] as int;
                    score += oneItem["score"] as int;

                    if (questionsAnswersIndex != quesList1.length - 1) {
                      setState(() {
                        questionsAnswersIndex++;
                      });
                    } else {
                      navigatePush(
                          context,
                          ScoreScree(
                            score: score,
                          ));
                    }
                  },
                  child: Text(oneItem["Ans"]));
            })
          ],
        ),
      ),
    );
  }
}
