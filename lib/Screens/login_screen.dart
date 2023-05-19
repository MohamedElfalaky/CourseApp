import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quizz_app/Helpers/helpers.dart';
import 'package:quizz_app/Screens/category_screen.dart';
import 'package:quizz_app/Screens/news_app_screen.dart';
import 'package:quizz_app/Screens/news_app_screen_whith_cubit.dart';
import 'package:quizz_app/Styles/styles.dart';
import 'package:rive/rive.dart';

import '../Helpers/golobal_variables.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen();

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen>
    with TickerProviderStateMixin {
  late AnimationController _slideAnimationController;
  late AnimationController _fadeAnimationController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _slideAnimationController = AnimationController(
        vsync: this, duration: Duration(milliseconds: 2000));
    _slideAnimationController.forward();

    _fadeAnimationController =
        AnimationController(vsync: this, duration: Duration(seconds: 3));
    _fadeAnimationController.forward();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _slideAnimationController.dispose();
    _fadeAnimationController.dispose();
  }

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          // automaticallyImplyLeading: true,
          // centerTitle: true,
          title: Text(
            "تسجيل الدخول",
            style: GoogleFonts.cairo(),
          ),

          actions: [
            IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: Icon(Icons.arrow_back))
          ],
        ),
        body: GestureDetector(
          behavior: HitTestBehavior.opaque,
          onTap: () {
            FocusScope.of(context).unfocus(); // dismiss keyboard
          },
          child: Container(
            decoration: BoxDecoration(border: Border.all(width: 1)),
            margin: EdgeInsets.all(20),
            padding: EdgeInsets.all(20),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SlideTransition(
                    position:
                        Tween<Offset>(begin: Offset(0, -1), end: Offset(0, 0))
                            .animate(_slideAnimationController),
                    child: Text(
                      "الرجاء ادخال الاسم الذي ترغب به للتسجيل في الاختبار",
                      style: secondaryAppTextStyle.copyWith(fontSize: 18),
                    ),
                  ),
                  SlideTransition(
                    position:
                        Tween<Offset>(begin: Offset(0, 4), end: Offset(0, 0))
                            .animate(_slideAnimationController),
                    child: Padding(
                      padding: EdgeInsets.symmetric(vertical: 20),
                      child: TextFormField(
                        controller: userName,
                        validator: (t) {
                          if (t!.isEmpty) {
                            return "الفيلد فاضي";
                          } else if (t.length != 5) {
                            return "اليوزر لازم يكون ٥ حروف";
                          } else {
                            return null;
                          }
                        },
                        decoration: InputDecoration(
                            filled: true,
                            fillColor: Color.fromARGB(255, 233, 227, 209),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                            label: Text("اسم المستخدم"),
                            hintText: "اسم المستخم لا يقل عن ٥ احرف"),
                      ),
                    ),
                  ),
                  Center(
                    child: FadeTransition(
                      opacity: _fadeAnimationController,
                      child: TextButton(
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              navigatePush(context, CategoryScreen());
                            }
                          },
                          child: Text(
                            "تسجيل الدخول",
                            style: secondaryAppTextStyle.copyWith(
                                fontSize: 14, fontWeight: FontWeight.bold),
                          )),
                    ),
                  ),
                  Center(
                    child: FadeTransition(
                      opacity: _fadeAnimationController,
                      child: TextButton(
                          onPressed: () {
                            navigatePush(context, NewsAppScreenWithCubit());
                          },
                          child: Text(
                            "توجه الى تطبيق الاخبار",
                            style: secondaryAppTextStyle.copyWith(
                                fontSize: 14, fontWeight: FontWeight.bold),
                          )),
                    ),
                  ),
                  Spacer(),
                  Center(
                    child: ElevatedButton(
                        onPressed: () {
                          // _slideAnimationController.forward();
                          // _fadeAnimationController.forward();
                        },
                        child: Text(
                          "تحكم بال animation",
                          style: secondaryAppTextStyle.copyWith(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        )),
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
