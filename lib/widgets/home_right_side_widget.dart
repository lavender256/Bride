import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:wedding_web_ui/data/data.dart';
import 'package:wedding_web_ui/model/collection.dart';

class HomeRightSideWidget extends StatefulWidget {

  final Collection collection;
  HomeRightSideWidget({this.collection});

  @override
  _HomeRightSideWidgetState createState() => _HomeRightSideWidgetState();
}

class _HomeRightSideWidgetState extends State<HomeRightSideWidget> {
  int currentSize=0;
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Container(
        width: size.width * .2,
        height: size.height * .43,
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
             Container(width: size.width*.2,
               height: size.height*.08,
               child: CarouselSlider.builder(itemCount: collectionList.length, itemBuilder: (BuildContext context,int index,int realIndex){
                 return Align(alignment: Alignment.centerLeft,
                   child: RichText(
                       text: TextSpan(children: [
                         TextSpan(
                             text:
                             "\$${widget.collection.price1.toString()}",
                             style: TextStyle(fontFamily: "Gaela",
                                 color: Colors.black,
                                 fontSize: size.width * .03)),
                         TextSpan(
                             text:
                             '.${widget.collection.price2.toString()}',
                             style: TextStyle(fontFamily: "Gaela",
                                 color: Colors.black,
                                 fontSize: size.width * .015))
                       ])),
                 );
               }, options: CarouselOptions(
                 autoPlay: true,
                 viewportFraction: 1.0
               )),
             ),
              SizedBox(
                height: size.height * .02,
              ),
              Container(width: size.width*.2,
                height: size.height*.08,
                child: CarouselSlider.builder(itemCount: collectionList.length, itemBuilder: (BuildContext context,int index,int realIndex){
                  return Align(alignment: Alignment.centerLeft,
                    child: Text(
                      collectionList[index].desc,
                      style: TextStyle(
                          color: Colors.black.withOpacity(.5)),
                    ),
                  );
                }, options: CarouselOptions(
                    autoPlay: true,
                    viewportFraction: 1.0
                )),
              ),
              SizedBox(
                height: size.height * .07,
              ),
              Container(
                  width: size.width * .12,
                  height: size.height * .05,
                  child: ListView.builder(
                      itemCount: sizes.length,
                      scrollDirection: Axis.horizontal,
                      physics: NeverScrollableScrollPhysics(),
                      itemBuilder:
                          (BuildContext context, int index) {
                        return GestureDetector(
                          onTap: () {
                            setState(() {
                              currentSize = index;
                            });
                          },
                          child: Container(
                            margin: EdgeInsets.only(
                                right: size.width * .015),
                            width: size.width * .022,
                            height: size.width * .022,
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: currentSize == index
                                    ? Colors.black
                                    : Colors.white),
                            child: Center(
                              child: Text(
                                sizes[index],
                                style: TextStyle(
                                    color: currentSize == index
                                        ? Colors.white
                                        : Colors.black,
                                    fontWeight: FontWeight.w600),
                              ),
                            ),
                          ),
                        );
                      })),

            ]));
  }
}
