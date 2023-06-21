import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:wedding_web_ui/data/color.dart';
import 'package:wedding_web_ui/data/data.dart';
import 'package:wedding_web_ui/model/collection.dart';
import 'package:wedding_web_ui/model/shop.dart';
import 'package:wedding_web_ui/widgets/main_slider_card.dart';

import 'bride_card.dart';

class MainSlider extends StatefulWidget {
  @override
  State<MainSlider> createState() => _MainSliderState();
}

class _MainSliderState extends State<MainSlider> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Container(
        width: size.width * .9,
        height: size.height,
        child: Stack(
          children: [
            Container(
              width: size.width,
              height: size.height,
              child: CarouselSlider.builder(
                itemCount: collectionList.length,
                itemBuilder: (BuildContext context, int index, int realIndex) {
                  Collection collection = collectionList[index];
                  return MainSliderCard(
                    collection: collection,
                  );
                },
                options: CarouselOptions(
                    enableInfiniteScroll: true,
                    height: size.height,
                    viewportFraction: 1,
                    autoPlay: true,
                    onPageChanged: (index, reason) {
                      setState(() {
                        currentIndex = index;
                      });
                    }),
              ),
            ),
            Positioned(
                left: size.width * .1,
                bottom: size.height * .15,
                child: Container(
                  width: size.width * .1,
                  height: size.height * .03,
                  child: AnimatedSmoothIndicator(
                    activeIndex: currentIndex,
                    count: collectionList.length,
                    effect: SwapEffect(
                        dotHeight: size.width * .008,
                        dotWidth: size.width * .008,
                        dotColor: Colors.white,
                        paintStyle: PaintingStyle.fill,
                        offset: 20,
                        type: SwapType.yRotation,
                        activeDotColor: mainColor2),
                  ),
                )),

          ],
        ));
  }
}
