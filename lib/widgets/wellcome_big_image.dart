import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:wedding_web_ui/data/color.dart';
import 'package:wedding_web_ui/widgets/wellcome_big_image_card.dart';
import 'package:wedding_web_ui/data/data.dart';

class WellComeBigImage extends StatefulWidget {
  @override
  _WellComeBigImageState createState() => _WellComeBigImageState();
}

class _WellComeBigImageState extends State<WellComeBigImage>  with SingleTickerProviderStateMixin {
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
int currentIndex=0;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Container(
          width: size.width * .69,
          height: size.height,
          child: Stack(alignment: Alignment.center,
            children: [
              Positioned.fill(child: Align(alignment: Alignment.centerRight,
                child: SizeTransition(
                  axis: Axis.horizontal,
                  sizeFactor: animation,
                  child: AnimatedContainer(
                    duration: Duration(milliseconds: 5000),
                    child: CarouselSlider.builder(itemCount: wellComeList.length, itemBuilder: (BuildContext context,int index,int realIndex){
                      return WellComeBigImageCard(currentIndex: currentIndex,);
                    }, options: CarouselOptions(  scrollPhysics: NeverScrollableScrollPhysics(),
                      height: size.height,
                      autoPlay: true,
                      viewportFraction: 1.0,
                      autoPlayInterval: Duration(milliseconds: 4000),
                      scrollDirection: Axis.vertical,
                      onPageChanged: (index,reason){
                        setState(() {
                         currentIndex=index;
                        });
                      }
                    )),
                  ),
                ),
              )),
              Positioned.fill(
                  child: Container(
                color: mainColor.withOpacity(.8),
              )),
              Positioned(
                  bottom: size.width * .015,
                  right: size.width * .02,
                  child: RotatedBox(
                      quarterTurns: 3,
                      child: Text(
                        "Shake Us".toUpperCase(),
                        style: TextStyle(color: Colors.black,fontWeight: FontWeight.w700),
                      ))),
              Positioned(
                  right: size.width * .02,
                  child: RotatedBox(quarterTurns: 3,
                    child: AnimatedSmoothIndicator(count:wellComeList.length, activeIndex: currentIndex,
                      effect: ExpandingDotsEffect(
                        paintStyle:PaintingStyle.stroke,
                        dotColor: mainColor2,
                        dotWidth: size.width*.005,
                        dotHeight: size.width*.005,
                        activeDotColor: mainColor2,
                        strokeWidth: 2
                      ),
                    ),
                  ))
            ],
    ));
  }
}
