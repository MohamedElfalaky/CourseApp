import 'package:flutter/material.dart';

import 'package:quizz_app/Widgets/category_card.dart';

class CategoryScreen extends StatelessWidget {
  const CategoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: [
        ///
        ///
        ///////// hard coded (1)
        ///
        ///

        // Expanded(
        //   child: InkWell(
        //     onTap: () {
        //       navigatePush(context, QuestionsScreen());
        //     },
        //     child: Container(
        //       width: double.infinity,
        //       color: Colors.blue,
        //       child: Center(
        //           child: Text(
        //         "اختبار رياضي",
        //         style: GoogleFonts.cairo(
        //             fontSize: 30,
        //             color: Colors.white,
        //             fontWeight: FontWeight.bold),
        //       )),
        //     ),
        //   ),
        // ),
        // Expanded(
        //   child: InkWell(
        //     onTap: () {
        //       navigatePush(context, QuestionsScreen());
        //     },
        //     child: Container(
        //       width: double.infinity,
        //       color: const Color.fromARGB(255, 122, 223, 7),
        //       child: Center(
        //           child: Text(
        //         "اختبار تاريخي",
        //         style: GoogleFonts.cairo(
        //             fontSize: 30,
        //             color: Colors.white,
        //             fontWeight: FontWeight.bold),
        //       )),
        //     ),
        //   ),
        // ),
        // Expanded(
        //   child: Container(
        //     width: double.infinity,
        //     color: const Color.fromARGB(255, 234, 7, 60),
        //     child: Center(
        //         child: Text(
        //       "اختبار معلومات عامة",
        //       style: GoogleFonts.cairo(
        //           fontSize: 30,
        //           color: Colors.white,
        //           fontWeight: FontWeight.bold),
        //     )),
        //   ),
        // ),

        ///
        ///
        /// loop
        ///
        ///

// for loop - map function - foreach function - do while - while ...

        // ...categoryData.map(
        //   (AyEsm) =>
        // Expanded(
        //     child: InkWell(
        //       onTap: () {
        //         navigatePush(context, QuestionsScreen());
        //       },
        //       child: Container(
        //         width: double.infinity,
        //         color: AyEsm["color"],
        //         child: Center(
        //             child: Text(
        //           AyEsm["name"],
        //           style: GoogleFonts.cairo(
        //               fontSize: 30,
        //               color: Colors.white,
        //               fontWeight: FontWeight.bold),
        //         )),
        //       ),
        //     ),
        //   ),
        // ),

        // reusble components
        ////

        CategoryCard(
          name: "اختبار رياضي",
          color: Colors.blue,
        ),
        CategoryCard(
          name: "اختبار تاريخي",
          color: Colors.yellow,
        ),
        CategoryCard(
          name: "اختبار معلومات عامة",
          color: Colors.red,
        ),
      ],
    ));
  }
}
