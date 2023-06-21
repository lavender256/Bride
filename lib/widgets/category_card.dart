import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:wedding_web_ui/data/color.dart';
import 'package:wedding_web_ui/model/dress.dart';
import 'package:wedding_web_ui/model/pages.dart';

class CategoryCard extends StatelessWidget {
final Dress dress;
CategoryCard({this.dress});

  @override
  Widget build(BuildContext context) {var size = MediaQuery.of(context).size;
    return Container(
      child: Stack(alignment: Alignment.center,
        children: [
          Positioned(
            bottom: size.height*.05,
            top: size.height*.03,
            child: Container(
              width: size.width,
              height: size.height,
              color: mainColor,
            ),
          ),
          Positioned(bottom: size.height*.05,
              top: 0,
              child: Container(
            width: size.width,
            height: size.height,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(dress.imageUrl),fit: BoxFit.fitHeight
              )
            ),
          )),
          Positioned(
              bottom: 10,
              child: Text(dress.title))
        ],
      ),
    );
  }
}
