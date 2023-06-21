import 'package:flutter/material.dart';
import 'package:wedding_web_ui/data/data.dart';

class WellComeBigImageCard extends StatefulWidget {
   final int currentIndex;

  WellComeBigImageCard({this.currentIndex});

  @override
  State<WellComeBigImageCard> createState() => _WellComeBigImageCardState();
}

class _WellComeBigImageCardState extends State<WellComeBigImageCard>
{


  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Container(
        width: size.width * .69,
        height: size.height,
        decoration: BoxDecoration(
            image: DecorationImage(
                alignment: Alignment.topRight,
                image: NetworkImage(wellComeList[widget.currentIndex]),
               fit: BoxFit.fitWidth)));
  }
}
