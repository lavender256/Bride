import 'package:flutter/material.dart';
import 'package:frino_icons/frino_icons.dart';
import 'package:wedding_web_ui/data/color.dart';
import 'package:wedding_web_ui/data/data.dart';
import 'package:wedding_web_ui/model/collection.dart';
import 'package:wedding_web_ui/model/shop.dart';
import 'package:wedding_web_ui/widgets/bride_card.dart';

import 'home_left_side_widget.dart';
import 'home_right_side_widget.dart';

class MainSliderCard extends StatefulWidget {
final Collection collection;


MainSliderCard({this.collection});

  @override
  State<MainSliderCard> createState() => _MainSliderCardState();
}

class _MainSliderCardState extends State<MainSliderCard> with SingleTickerProviderStateMixin{
  AnimationController animationController;
  Animation animation;
  bool isShowMessage = false;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    animationController=AnimationController(vsync: this,duration: Duration(milliseconds: 3000));
    animation=Tween<double>(begin: 0.0,end: 1.0).animate(CurvedAnimation(parent: animationController, curve: Curves.linear));
  }
  @override
  Widget build(BuildContext context) {var size = MediaQuery.of(context).size;
    return Container(
      width: size.width,
      height: size.height,
      child: Stack(alignment: Alignment.center,
        children: [
          Positioned(
              right: size.width*.03,
              child: HomeRightSideWidget(collection: widget.collection,)),
          Positioned(
              left: size.width*.03,
              child: HomeLeftSideWidget(collection: widget.collection,)),
          Positioned(
              top: size.height*.03,
              left: size.width*.22,
              child: BrideCard(collection: widget.collection,)),
          Positioned( right: size.width * .1,
            bottom: size.height * .3,
            child: GestureDetector(
              onTap: () {
                setState(() {
                  isShowMessage=true;
                  animationController.forward();
                  shopList.add(Shop(
                      title: widget.collection.title,
                      image: widget.collection.smallimageUrl,
                      price: widget.collection.price1.toString(),
                      price2:
                      widget.collection.price2.toString()));
                });
              },
              child: Container(
                width: size.width * .15,
                height: size.height * .065,
                decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(25)),
                child: Center(
                  child: Text(
                    "Buy Now".toUpperCase(),
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w800,
                        fontSize: size.width * .01),
                  ),
                ),
              ),
            ),
          ),
          isShowMessage?Positioned(
            top: size.height * .029,
            right: size.width * .025,
            child: Container(
              width: size.width * .18,
              height: size.height * .16,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Positioned(
                    bottom: 0,
                    child: Container(
                      width: size.width * .16,
                      height: size.height * .13,
                      decoration: BoxDecoration(
                          color: greenColor,
                          borderRadius: BorderRadius.circular(25)),
                    ),
                  ),
                  Positioned(
                      top: 0,
                      left: size.width * .02,
                      child: Container(
                        width: size.width * .03,
                        height: size.width * .03,
                        decoration: BoxDecoration(
                          color: greenColor2,
                          shape: BoxShape.circle,
                        ),
                        child: Center(
                          child: Icon(
                            FrinoIcons.f_check,
                            color: Colors.white,
                          ),
                        ),
                      )),
                  Positioned(
                      bottom: 0,
                      child: Container(
                        width: size.width * .08,
                        height: size.height * .13,
                        child: Column(
                          crossAxisAlignment:
                          CrossAxisAlignment.start,
                          mainAxisAlignment:
                          MainAxisAlignment.spaceEvenly,
                          children: [
                            Text(
                              "Well done!",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: size.width * .013,
                                  fontWeight: FontWeight.w700),
                            ),
                            Text(
                              "Your choice has been add successfully.",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: size.width * .008,
                                  fontWeight: FontWeight.w500),
                            )
                          ],
                        ),
                      )),
                  Positioned(
                      top: size.height * .03,
                      right: size.width * .015,
                      child: IconButton(
                        icon: Icon(
                          FrinoIcons.f_close,
                          color: Colors.white,
                          size: size.width * .01,
                        ),
                        onPressed: () {
                          setState(() {
                            isShowMessage=false;
                          });
                        },
                      ))
                ],
              ),
            ),
          ):SizedBox.shrink(),
        ],
      ),
    );
  }
}
