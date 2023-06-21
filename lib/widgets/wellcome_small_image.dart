import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:wedding_web_ui/data/data.dart';
import 'package:wedding_web_ui/widgets/wellcome_small_image_card.dart';

class WellComeSmallImage extends StatefulWidget {
  @override
  _WellComeSmallImageState createState() => _WellComeSmallImageState();
}

class _WellComeSmallImageState extends State<WellComeSmallImage>
    with SingleTickerProviderStateMixin {
  AnimationController animationController;
  Animation animation;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    animationController = AnimationController(
        vsync: this, duration: Duration(milliseconds: 5000));
    animation = CurvedAnimation(
        parent: animationController, curve: Curves.fastLinearToSlowEaseIn);
    animationController.forward();
  }

  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return SizeTransition(
      axis: Axis.horizontal,
      sizeFactor: animation,
      child: AnimatedContainer(
        duration: Duration(milliseconds: 5000),
        width: size.width * .22,
        height: size.height * .7,
        child: CarouselSlider.builder(
            itemCount: wellComeList.length,
            itemBuilder: (BuildContext context, int index, int realIndex) {
              return WellComeSmallImageCard(
                currentIndex: index,
              );
            },
            options: CarouselOptions(
                scrollPhysics: NeverScrollableScrollPhysics(),
                autoPlayInterval: Duration(milliseconds: 4000),
                height: size.height,
                pauseAutoPlayOnTouch: false,
                autoPlay: true,
                reverse: true,
                viewportFraction: 1.0,
                scrollDirection: Axis.vertical,
                onPageChanged: (index, reason) {
                  setState(() {
                    currentIndex = index;
                  });
                })),
      ),
    );
  }
}
