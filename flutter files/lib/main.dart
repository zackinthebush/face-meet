import 'package:face_meet/pages/introduction_page.dart';
import 'package:face_meet/pages/login_page.dart';
import 'package:face_meet/pages/meeting_page.dart';
import 'package:face_meet/pages/new_meeting_page.dart';
import 'package:face_meet/pages/register_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        fontFamily: "jaldi",
        primarySwatch: Colors.deepOrange,
      ),
      debugShowCheckedModeBanner: false,
      initialRoute: '/IntroductionPage',
      routes: {
        // When navigating to the "/" route, build the FirstScreen widget.
        // '/': (context) =>  const HomePage(),
        '/IntroductionPage': (context) => const IntroductionPage(),
        '/log_in': (context) => const LoginPage(),
        '/sign_up': (context) => const RegisterPage(),
        '/NewMeeting': (context) => const NewMeeting(),
        '/MeetingPage': (context) => MeetingPage(),

      },
    );
  }
}
