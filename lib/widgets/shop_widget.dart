import 'package:flutter/material.dart';
import 'package:frino_icons/frino_icons.dart';
import 'package:iconsax/iconsax.dart';
import 'package:wedding_web_ui/data/data.dart';
import 'package:wedding_web_ui/model/shop.dart';
import 'package:wedding_web_ui/widgets/shop_card1.dart';

class ShopWidget extends StatefulWidget {
  @override
  State<ShopWidget> createState() => _ShopWidgetState();
}

class _ShopWidgetState extends State<ShopWidget> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Container(
        width: size.width * .17,
        height: size.height,
        child: StreamBuilder(
          stream: myStream(),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            return Stack(
              alignment: Alignment.center,
              children: [
                Positioned(
                    top: size.height * .18,
                    left: size.width * .01,
                    child: Column(
                      children: [
                        Text("Your Shop List is Empty",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w800,
                                fontSize: size.width * .015)),
                        SizedBox(
                          height: size.height * .01,
                        ),
                        Icon(
                          FrinoIcons.f_face_sad,
                          color: Colors.white,
                        )
                      ],
                    )),
                Positioned(
                  left: 0,
                  top: size.height * .1,
                  child: Container(
                    width: size.width * .17,
                    height: size.height * .8,
                    child: ListView.builder(
                        physics: NeverScrollableScrollPhysics(),
                        itemCount: shopList.length,
                        itemBuilder: (BuildContext context, int index) {
                          Shop shop = shopList[index];
                          return ShopCard(
                            shop: shop,
                            index: index,
                          );
                        }),
                  ),
                ),
               shopList.isNotEmpty?Positioned(
                  left: size.width * .002,
                  bottom: size.height * .07,
                  child: Container(
                      width: size.width * .16,
                      height: size.height * .06,
                      decoration: BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.circular(25)),
                      child: Center(
                          child: Text(
                        "Continue",
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.w800),
                      ))),
                ):SizedBox.shrink(),
              ],
            );
          },
        ));
  }

  myStream() async* {
    yield* Stream.periodic(Duration(milliseconds: 100), (int) {});
  }
}
