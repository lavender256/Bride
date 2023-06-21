
import 'dart:async';

import 'package:flutter/animation.dart';
import 'package:flutter/material.dart';
import 'package:wedding_web_ui/data/data.dart';
import 'package:wedding_web_ui/model/collection.dart';

class BrideCard extends StatefulWidget {
  final Collection collection;
  BrideCard({this.collection});

  @override
  State<BrideCard> createState() => _BrideCardState();
}

class _BrideCardState extends State<BrideCard>
    with SingleTickerProviderStateMixin {
  AnimationController animationController;
  Animation opacityAnimation;
  Animation heightAnimation;
  double containerSize=3.0;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    animationController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 300));
    heightAnimation = Tween<double>(begin: 400.0, end: 1.0).animate(CurvedAnimation(
        parent: animationController, curve: Curves.fastLinearToSlowEaseIn));
    opacityAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(CurvedAnimation(
        parent: animationController, curve: Curves.fastLinearToSlowEaseIn));

    Timer(Duration(seconds: 2),(){
      setState(() {
        containerSize=1.0;
      });
    });
    animationController.forward();
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
    return AnimatedBuilder(animation: opacityAnimation, builder: (BuildContext context,Widget child){
      return AnimatedOpacity(    duration: Duration(milliseconds: 700),
        opacity: animationController.value,
        child: AnimatedContainer(duration: Duration(milliseconds: 300),
          width: size.width * .35,
          margin: EdgeInsets.only(top: heightAnimation.value),
          height: size.height,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: NetworkImage(widget.collection.imageUrl),fit: BoxFit.fitHeight,alignment: Alignment.topCenter
            )
          ),
        ),
      );
    });
  }
}