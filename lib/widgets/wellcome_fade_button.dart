import 'dart:async';

import 'package:flutter/material.dart';
import 'package:wedding_web_ui/screens/home_screen.dart';

class WellComeFadeButton extends StatefulWidget {
  @override
  State<WellComeFadeButton> createState() => _WellComeFadeButtonState();
}

class _WellComeFadeButtonState extends State<WellComeFadeButton>
    with SingleTickerProviderStateMixin {
  AnimationController animationController;
  Animation animation;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    animationController = AnimationController(
        vsync: this, duration: Duration(milliseconds: 5000));
    animation = Tween<double>(begin: -1.0, end: 1.0).animate(CurvedAnimation(
        parent: animationController, curve: Curves.fastLinearToSlowEaseIn));
    Timer(Duration(milliseconds: 2000), () => animationController.forward());
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    animationController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return FadeTransition(
        opacity: animation,
        child: Container(
          height: size.height * .14,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "affordable luxury for every bride".toUpperCase(),
                style: TextStyle(fontSize: size.width*.011,
                    color: Colors.black.withOpacity(.8),
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1.2),
              ),
              GestureDetector(
                onTap: () => Navigator.push(
                    context, MaterialPageRoute(builder: (_) => HomeScreen())),
                child: Container(
                    width: size.width * .15,
                    height: size.height * .065,
                    color: Colors.white,
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        Text(
                          "See New Collections".toUpperCase(),
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w900,
                              wordSpacing: 1.2,
                              fontSize: size.width * .009),
                        ),
                        Positioned(
                          top: 0,
                          child: Container(
                            width: size.width * .03,
                            height: 2,
                            color: Colors.black,
                          ),
                        ),
                        Positioned(
                          bottom: 0,
                          child: Container(
                            width: size.width * .03,
                            height: 2,
                            color: Colors.black,
                          ),
                        )
                      ],
                    )),
              ),
            ],
          ),
        ));
  }
}
