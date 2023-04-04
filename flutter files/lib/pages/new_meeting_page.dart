import 'package:face_meet/component/background.dart';
import 'package:flutter/material.dart';

import '../component/custom_drawer.dart';

class NewMeeting extends StatelessWidget {
  const NewMeeting({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Background(
      drawer: const SafeArea(
        child: Drawer(
          child: CustomDrawer(),
        ),
      ),
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                  margin: const EdgeInsets.only(bottom: 30,),
                  child: Image.asset(
                    "images/logo.png",
                    width: size.height * 0.25,
                  )),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Builder(
                    builder: (context) => GestureDetector(
                      onTap: () {
                        Scaffold.of(context).openDrawer();
                      },
                      child: const Icon(
                        Icons.menu,
                        size: 50,
                        color: Colors.black,
                      ),
                    ),
                  ),

                  GestureDetector(
                    onTap: () {},
                    child: const Icon(Icons.account_circle,
                      size: 50.0,
                      color: Colors.deepOrange,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context)
                          .pushNamedAndRemoveUntil("/log_in", (route) => false);
                    },
                    child: const Icon(
                      Icons.arrow_circle_left_outlined,
                      size: 50,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
              const Divider(thickness: 2),
              const SizedBox(
                height: 25,
              ),
              const Text("Get a link you can share",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
              Container(
                  margin: const EdgeInsets.only(bottom: 30),
                  width: 260,
                  height: 50,
                  child: const Text(
                    "Tup New meeting to get a link you can send to people you want to meet with ",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 15),
                  )),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        minimumSize: const Size(130, 40),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                      ),
                      onPressed: () {
                        Navigator.of(context).pushNamedAndRemoveUntil(
                            "/MeetingPage", (route) => false);
                      },
                      child: const Text("New meeting",
                          style: TextStyle(
                              fontSize: 14, fontWeight: FontWeight.bold))),
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        minimumSize: const Size(130, 40),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                      ),
                      onPressed: () {},
                      child: const Text("Join with a code",
                          style: TextStyle(
                              fontSize: 14, fontWeight: FontWeight.bold))),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Image.asset("images/newmeet.png"),
            ],
          ),
        ),
      ),
    );
  }
}
