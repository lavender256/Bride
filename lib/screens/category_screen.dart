import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:frino_icons/frino_icons.dart';
import 'package:wedding_web_ui/data/data.dart';
import 'package:wedding_web_ui/model/collection.dart';
import 'package:wedding_web_ui/model/pages.dart';
import '../widgets/category_screen_card.dart';

class CategoryScreen extends StatefulWidget {
  final Collection collection;

  CategoryScreen({this.collection});

  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  CarouselController carouselController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    carouselController = CarouselController();
  }

  int currentIndex = 0;


  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
          width: size.width,
          height: size.height,
          child: Stack(
            alignment: Alignment.center,
            children: [
              Container(
                width: size.width,
                height: size.height,
                child: CarouselSlider.builder(
                    carouselController: carouselController,
                    itemCount: categoryScreens.length,
                    itemBuilder:
                        (BuildContext context, int index, int realIndex) {
                      Pages pages=categoryScreens[index];

                      return CategoryScreenCard(pages: pages,collection: widget.collection,);
                    },
                    options: CarouselOptions(
                        initialPage: 0,
                        enableInfiniteScroll: false,
                        viewportFraction: 1,
                        autoPlay: false,
                        onPageChanged: (index, reason) {
                          setState(() {
                            currentIndex = index;
                          });
                        })),
              ),
              currentIndex!=categoryScreens.length-1?Positioned(
                  right: size.width * .02,
                  child: Container(
                    width: size.width * .035,
                    height: size.width * .035,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle, color: Colors.white),
                    child: Center(
                      child: IconButton(
                        icon: Icon(FrinoIcons.f_arrow_right),
                        onPressed: () {
                          carouselController.nextPage();
                        },
                      ),
                    ),
                  )):SizedBox.shrink(),
              currentIndex!=0?Positioned(
                  left: size.width * .02,
                  child: Container(
                    width: size.width * .035,
                    height: size.width * .035,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle, color: Colors.white),
                    child: Center(
                      child: IconButton(
                        icon: Icon(FrinoIcons.f_arrow_left),
                        onPressed: () {
                          carouselController.previousPage();
                        },
                      ),
                    ),
                  )):SizedBox.shrink(),
            ],
          )),
    );
  }
}
