import 'package:flutter/material.dart';
import 'package:frino_icons/frino_icons.dart';
import 'package:iconsax/iconsax.dart';
import 'package:wedding_web_ui/data/color.dart';
import 'package:wedding_web_ui/data/data.dart';
import 'package:wedding_web_ui/model/collection.dart';
import 'package:wedding_web_ui/model/shop.dart';

class ShopCard extends StatefulWidget {
final Shop shop;
final int index;
ShopCard({this.shop,this.index});

  @override
  State<ShopCard> createState() => _ShopCardState();
}

class _ShopCardState extends State<ShopCard> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.only(top: size.height*.01),
      width: size.width * .1,
      height: size.height * .2,
      color: Colors.white,
      child: Stack(
        children: [
          Positioned(child: Container(
            margin: EdgeInsets.all(10),
            width: size.width*.06,
            height: size.height,
            decoration: BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.cover,alignment: Alignment.topCenter,
                image: NetworkImage(widget.shop.image)
              )
            ),
          )),
          Positioned(
            left: size.width*.07,
              top: size.height*.02,
              child: Text(widget.shop.title,style: TextStyle(
            color: Colors.black,fontSize: size.width*.011,fontWeight: FontWeight.w800
          ),)),
          Positioned(
              left: size.width*.07,
              top: size.height*.13,
              child: RichText(
                  text: TextSpan(children: [
                    TextSpan(
                        text:
                        "\$${widget.shop.price.toString()}",
                        style: TextStyle(fontFamily: "Gaela",
                            color: mainColor2,
                            fontSize: size.width * .02)),
                    TextSpan(
                        text:
                        '.${widget.shop.price2.toString()}',
                        style: TextStyle(fontFamily: "Gaela",
                            color: mainColor2,
                            fontSize: size.width * .015))
                  ])),),
          Positioned( left: size.width*.14,
              bottom: size.height*.02,
              child: IconButton(icon: Icon(Iconsax.trash,color: mainColor2,size: size.width*.02,),onPressed: (){
                setState(() {
                  shopList.remove(shopList[widget.index]);
                });
              },)),
        ],
      )
    );
  }
}
