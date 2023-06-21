import 'package:flutter/material.dart';
import 'package:frino_icons/frino_icons.dart';
import 'package:iconsax/iconsax.dart';
import 'package:wedding_web_ui/data/color.dart';
import 'package:wedding_web_ui/data/data.dart';
import 'package:wedding_web_ui/model/collection.dart';
import 'package:wedding_web_ui/model/shop.dart';
import 'package:wedding_web_ui/widgets/shop_card1.dart';

class ShopMessage extends StatefulWidget {
  final Collection collection;

  ShopMessage({this.collection});

  @override
  State<ShopMessage> createState() => _ShopMessageState();
}

class _ShopMessageState extends State<ShopMessage> with SingleTickerProviderStateMixin{
  AnimationController animationController;
  Animation animation;
  bool isShowMessage = false;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    animationController=AnimationController(vsync: this,duration: Duration(milliseconds: 3000));
    animation=Tween<double>(begin: 0.0,end: 1.0).animate(CurvedAnimation(parent: animationController, curve: Curves.linear));
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Container(width: size.width,
      height: size.height,
      child: Stack(children: [



      ],),
    );
  }
}
