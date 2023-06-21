import 'package:carousel_slider/carousel_controller.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:fancy_drawer/fancy_drawer.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:wedding_web_ui/data/color.dart';
import 'package:wedding_web_ui/data/data.dart';
import 'package:wedding_web_ui/widgets/main_slider.dart';
import 'package:wedding_web_ui/widgets/shop_card1.dart';
import 'package:wedding_web_ui/widgets/shop_message.dart';
import 'package:wedding_web_ui/widgets/shop_widget.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  int currentIndex = 0;
  int currentPage = 0;
  FancyDrawerController fancyDrawerController;
  CarouselController carouselController;


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fancyDrawerController = FancyDrawerController(
        vsync: this, duration: Duration(milliseconds: 300))
      ..addListener(() {
        setState(() {});
      });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    fancyDrawerController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Material(
      child: FancyDrawerWrapper(
        backgroundColor: mainColor2,
        controller: fancyDrawerController,
        drawerItems: [
          ShopWidget()
        ],
        hideOnContentTap: true,
        child: Scaffold(
            backgroundColor: Color(0xffF5F5F5),
            body: Container(
                width: size.width,
                height: size.height,
                child: Stack(
                    alignment: Alignment.center,
                    children: [
                  Positioned(
                      top: size.height * .15,
                      left: size.width * .02,
                      child: Container(
                        width: size.width * .035,
                        height: size.width * .035,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle, color: Colors.white),
                        child: Center(
                          child: IconButton(
                            icon: Icon(Iconsax.arrow_right),
                            onPressed: () {
                              setState(() {
                                fancyDrawerController.toggle();
                              });
                            },
                          ),
                        ),
                      )),
                  Positioned(
                      left: size.width * .2,
                      top: size.height * .33,
                      child: Container(
                        width: size.width * .17,
                        height: size.height,
                        color: mainColor,
                      )),
                      Positioned(
                          right: size.width * .1,
                          bottom: size.height * .33,
                          child: Container(
                            width: size.width * .17,
                            height: size.height,
                            color: mainColor,
                          )),
                      Positioned(
                        top: size.height * .02,
                        left: size.width * .05,
                        child:Container(width: size.width*.12,
                          height: size.height*.1,
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  fit: BoxFit.cover,
                                  image: NetworkImage("https://s8.uupload.ir/files/logo_jh56.png")
                              )
                          ),
                        ),
                      ),
                  Positioned(
                      top: -size.width * .15,
                      right: -size.width * .15,
                      child: Container(
                        width: size.width * .3,
                        height: size.width * .3,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(
                                color: Colors.black.withOpacity(.3), width: 2)),
                      )),
                  Positioned(
                    right: size.width * .03,
                    top: size.height * .06,
                    child: Container(
                      height: size.height * .04,
                      width: size.width * .05,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            width: size.height * .04,
                            height: size.height * .04,
                            decoration: BoxDecoration(
                                color: Colors.black, shape: BoxShape.circle),
                            child: Center(
                              child: Icon(
                                Iconsax.menu_13,
                                color: Colors.white,
                              ),
                            ),
                          ),
                          Container(
                            width: size.height * .04,
                            height: size.height * .04,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                shape: BoxShape.circle,
                                border: Border.all(
                                    color: Colors.black.withOpacity(.3),
                                    width: 1)),
                            child: Center(
                              child: Icon(
                                Iconsax.menu_13,
                                color: Colors.black,
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  ShopMessage(collection: collectionList[currentIndex],),
                  MainSlider(),
                ]))),
      ),
    );
  }
}
