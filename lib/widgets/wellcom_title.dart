import 'dart:async';

import 'package:flutter/material.dart';

class WellComeTitle extends StatefulWidget {
  @override
  State<WellComeTitle> createState() => _WellComeTitleState();
}

class _WellComeTitleState extends State<WellComeTitle>
    with SingleTickerProviderStateMixin {
  AnimationController animationController;
  Animation fadeAnimation;
  Animation offsetAnimation;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    animationController = AnimationController(
        vsync: this, duration: Duration(milliseconds: 5000));
    fadeAnimation = Tween<double>(begin: -1.0, end: 1.0).animate(
        CurvedAnimation(
            parent: animationController, curve: Curves.fastLinearToSlowEaseIn));
    offsetAnimation = Tween<Offset>(begin: Offset(2.5, 0), end: Offset(0, 0))
        .animate(CurvedAnimation(
            parent: animationController, curve: Curves.fastLinearToSlowEaseIn));
   Timer(Duration(milliseconds: 500),()=>animationController.forward());
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
    return Column(crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        FadeTransition(
          opacity: fadeAnimation,
          child: SlideTransition(
            position: offsetAnimation,
            child: Text(
              "Your Dream.",
              style: TextStyle(letterSpacing: 2,
                  color: Colors.white,
                  fontWeight: FontWeight.w800,
                  fontSize: size.width * .06),
            ),
          ),
        ),
        FadeTransition(
          opacity: fadeAnimation,
          child: SlideTransition(
            position: offsetAnimation,
            child: Text(
              "Your Dress.",
              style: TextStyle(letterSpacing: 1.2,
                  color: Colors.white,
                  fontWeight: FontWeight.w800,
                  fontSize: size.width * .04),
            ),
          ),
        )
      ],
    );
  }
}
