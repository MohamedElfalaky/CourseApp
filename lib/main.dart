import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quizz_app/Data/Cubits/GetNews/get_news_cubit.dart';
import 'package:quizz_app/Helpers/helpers.dart';
import 'package:quizz_app/Screens/login_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => GetNewsCubit(),
        ),
      ],
      child: MaterialApp(
          debugShowCheckedModeBanner: false,
          locale: const Locale(
              'ar', 'SA'), // Change the language and region code as needed
          localizationsDelegates: const [
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
            // Add additional delegates for other packages you're using
          ],
          supportedLocales: const [
            Locale('en', 'US'), // English
            Locale('ar', 'SA'), // Arabic
            // Add additional locales as needed
          ],
          title: 'Flutter Demo',
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          home: LoginScreen()
          // const MyHomePage(title: 'Flutter Demo Home Page'),
          ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  void _decrementCounter() {
    setState(() {
      _counter--;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // its an attribute in scafffold, let us to make appbar for the applocation
      appBar: AppBar(
          title:

              // row is a widget that allow us to put widgets next each other
              Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: const [
          Icon(Icons.man),
          Text(" quizz app"),
          Icon(Icons.account_box_rounded)
        ],
      )),

      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'عدد المرات اللي دست فيها الزرار ده هي::',
            ),
            Text(
              "عدد المرات هو : $_counter ",
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            ElevatedButton(
                onPressed: _decrementCounter, child: const Text("-")),
            OutlinedButton(
                onPressed: () {
                  navigatePush(context, LoginScreen());
                },
                child: Text(
                  "انتقل لصفحة تسجيل الدخول",
                  style: GoogleFonts.cairo(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: const Color.fromARGB(255, 18, 112, 152)),
                ))
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        //لما ادوس
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
