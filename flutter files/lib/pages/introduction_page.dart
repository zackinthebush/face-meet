import 'package:face_meet/component/background.dart';
import 'package:flutter/material.dart';

class IntroductionPage extends StatelessWidget {
  const IntroductionPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Background(
        child: SafeArea(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Container(
            margin: const EdgeInsets.only(bottom: 20),
            child: Image.asset(
              "images/logo.png",
              width: size.height * 0.25,
            ),
          ),
          const Text(
            "Get things done with FaceMeet",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          Container(
              margin: const EdgeInsets.only(bottom: 30),
              width: 260,
              height: 50,
              child: const Text(
                "Top New meeting to get a link you can send to people you want to meet with ",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 15),
              )),
          CircleAvatar(
            radius: size.height * 0.10,
            child: GestureDetector(
              onTap: () {
                Navigator.of(context)
                    .pushNamedAndRemoveUntil("/log_in", (route) => false);
              },
              child: const Icon(
                Icons.play_arrow_rounded,
                size: 100,
                color: Colors.black,
              ),
            ),
          ),
          const Text(
            "PUSH",
            style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
          ),
          Container(
            alignment: Alignment.bottomCenter,
            margin: const EdgeInsets.only(top: 30),
            child: Image.asset(
              "images/intro.png",height: 200,
            ),
          ),
        ],
      ),
    ));
  }
}
