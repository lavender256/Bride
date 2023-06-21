import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:wedding_web_ui/data/data.dart';
import 'package:wedding_web_ui/model/collection.dart';
import 'package:wedding_web_ui/widgets/view_collection_widget.dart';

class HomeLeftSideWidget extends StatefulWidget {
  final Collection collection;


  HomeLeftSideWidget({this.collection});

  @override
  State<HomeLeftSideWidget> createState() => _HomeLeftSideWidgetState();
}

class _HomeLeftSideWidgetState extends State<HomeLeftSideWidget> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Container(
      width: size.width * .25,
      height: size.height * .44,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CarouselSlider.builder(itemCount: collectionList.length, itemBuilder: (BuildContext context, int index,int realIndex){
            return Text(
              widget.collection.title,
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w500,
                  fontSize: size.width * .03),
            );
          }, options: CarouselOptions(
            viewportFraction: 1,
            autoPlay: true
          )),
          Container(
            width: size.width*.18,
            height: size.height*.14,
            child: ViewCollectionWidget(collection: widget.collection)
    )
          ]));
  }
}
