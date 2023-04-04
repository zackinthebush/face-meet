import 'package:flutter/material.dart';
import 'package:face_meet/component/icon_button.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:face_meet/constant/constants.dart';

class MeetingPage extends StatefulWidget {
  const MeetingPage({Key? key}) : super(key: key);

  @override
  State<MeetingPage> createState() => _MeetingPageState();
}

class _MeetingPageState extends State<MeetingPage> {
  bool micMuted = true;
  bool cameraOff = true;
  bool screenShareOff = true;

  @override
  Widget build(BuildContext context) {
    return Material(
      child: SafeArea(
        child: Scaffold(
          body: Column(
            children: [
              Container(
                height: 60.0,
                padding: const EdgeInsets.all(7.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Image.asset(
                      "images/logo.png",
                      width: 120.0,
                      height: 100.0,
                    ),
                    GestureDetector(
                      onTap: () {
                        // user profile
                      },
                      child: const Icon(
                        Icons.account_circle,
                        size: 50.0,
                        color: Colors.deepOrange,
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                  child: Container(
                color: Colors.white,
                //TODO: Create user cameras containers and functions here
                child: const Center(
                  // can be removed later
                  child: Text(
                    'Meeting room Cameras',
                    style: TextStyle(
                      fontSize: 30.0,
                    ),
                  ),
                ),
              )),
              Container(
                padding: const EdgeInsets.all(8.0),
                height: 60.0,
                color: Colors.grey.shade700,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    RoundIconButton(
                      onPress: () {
                        setState(() {
                          micMuted = !micMuted; // bang statement, reverses bool values

                        });
                      },
                      icon: micMuted
                          ? FontAwesomeIcons.microphone
                          : FontAwesomeIcons.microphoneSlash,
                    ),
                    RoundIconButton(
                        onPress: () {
                          setState(() {
                            cameraOff = !cameraOff;

                          });
                        },
                        icon: cameraOff
                            ? FontAwesomeIcons.video
                            : FontAwesomeIcons.videoSlash),
                    RoundIconButton(
                        onPress: () {
                          Navigator.of(context).pushNamedAndRemoveUntil(
                              "/NewMeeting", (route) => false);
                        },
                        icon: Icons.chat),
                    RoundIconButton(
                        onPress: () {
                          setState(() {
                            screenShareOff = !screenShareOff;
                          });
                        },
                        icon: screenShareOff
                            ? Icons.screen_share
                            : Icons.stop_screen_share),
                    // SizedBox(width: size.width*0.05,),
                    RoundIconButton(onPress: () {}, icon: Icons.call_end),
                    PopupMenuButton(
                      icon: const Icon(
                        Icons.more_vert,
                        color: Colors.white,
                      ),
                      itemBuilder: (BuildContext context) {
                        return PopUpConstants.popUpItems.map((String choice) {
                          return PopupMenuItem(
                            child: Text(choice),
                            value: choice,
                          );
                        }).toList();
                      },
                      onSelected: popUpButtonChoicesAction,
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  void popUpButtonChoicesAction(String choice) {
    if (choice == PopUpConstants.signOut ){
      Navigator.of(context).pushNamedAndRemoveUntil("/log_in", (route) => false);
    }

  }
}
