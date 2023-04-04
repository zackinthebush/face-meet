import 'package:flutter/material.dart';

class Background extends StatelessWidget {
  final Widget child ;
  final Widget ? drawer;
  const Background({Key? key, required this.child, this.drawer,}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      drawer: drawer,
      body: SizedBox(
        height: size.height,
        width: double.infinity,
        child: Stack(
          alignment: Alignment.center,
          children: [
            Positioned(
              top: 0,
              left: 0,
              child: Image.asset(
                "images/edge1.png",
                height: size.width*0.3,
              ),
            ),
            // Positioned(
            //   top: size.height/9,
            //   right: size.width*0.25,
            //   child: Image.asset(
            //     "images/logo.png",
            //     width: size.width * 0.5,
            //   ),
            // ),
            child,
          ],
        ),
      ),
    );
  }
}

