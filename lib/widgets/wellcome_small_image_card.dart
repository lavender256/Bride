import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:wedding_web_ui/data/data.dart';

class WellComeSmallImageCard extends StatefulWidget {
  final int currentIndex;
  WellComeSmallImageCard({this.currentIndex});

  @override
  State<WellComeSmallImageCard> createState() => _WellComeSmallImageCardState();
}

class _WellComeSmallImageCardState extends State<WellComeSmallImageCard>
    with SingleTickerProviderStateMixin {
  AnimationController animationController;
  Animation animation;


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    animationController = AnimationController(
        vsync: this, duration: Duration(milliseconds: 5000));
    animation = Matrix4Tween(
            begin: Matrix4.identity(),
            end: Matrix4.identity()
              ..translate(-5, 20, 0)
              ..scale(2))
        .animate(CurvedAnimation(
            parent: animationController, curve: Curves.fastLinearToSlowEaseIn));

  }
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    animationController.dispose();
  }

  bool isHover = false;

  @override
  Widget build(BuildContext context) {
    final hoverTransform = Matrix4.identity()..translate(-5, 8, 20);
    final transform = isHover ? hoverTransform : Matrix4.identity();
    var size = MediaQuery.of(context).size;
    return MouseRegion(
      onEnter: (value) {
        setState(() {
          isHover = true;
        });
      },
      onExit: (value) {
        setState(() {
          isHover = false;
        });
      },
      child: AnimatedContainer(
        duration: Duration(milliseconds: 100),
        transform: transform,
        width: size.width * .22,
        height: size.height * .7,
        decoration: BoxDecoration(
          image: DecorationImage(
            alignment: Alignment.topCenter,
            fit: BoxFit.cover
              ,image: NetworkImage(wellComeList[widget.currentIndex])
          )
        ),
        child: Stack(
          children: [
            Positioned.fill(child:Container(color: Colors.black.withOpacity(.1))),
            Positioned(
                top: size.width * .015,
                left: size.width * .015,
                child: Container(
                  width: size.width * .05,
                  height: size.width * .05,
                  decoration: BoxDecoration(
                      border: Border(
                          top: BorderSide(color: Colors.white, width: 1),
                          left: BorderSide(color: Colors.white, width: 1))),
                )),
            Positioned(
                bottom: size.width * .015,
                right: size.width * .015,
                child: Container(
                  width: size.width * .05,
                  height: size.width * .05,
                  decoration: BoxDecoration(
                      border: Border(
                          bottom: BorderSide(color: Colors.white, width: 1),
                          right: BorderSide(color: Colors.white, width: 1))),
                )),
          ],
        ),
      ),
    );
  }
}
