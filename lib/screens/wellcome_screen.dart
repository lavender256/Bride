import 'package:flutter/material.dart';
import 'package:wedding_web_ui/data/color.dart';
import 'package:wedding_web_ui/widgets/wellcom_title.dart';
import 'package:wedding_web_ui/widgets/wellcome_appbar.dart';
import 'package:wedding_web_ui/widgets/wellcome_big_image.dart';
import 'package:wedding_web_ui/widgets/wellcome_fade_button.dart';
import 'package:wedding_web_ui/widgets/wellcome_small_image.dart';

class WellComeScreen extends StatefulWidget {

  @override
  State<WellComeScreen> createState() => _WellComeScreenState();
}

class _WellComeScreenState extends State<WellComeScreen> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(width: size.width,
      height: size.height,
        child: Stack(alignment: Alignment.center,
          children: [
            Positioned(
              right: 0,
              child: WellComeBigImage()
            ),
            Positioned(
              bottom: size.height*.1,
              left: size.width*.15,
              child: WellComeSmallImage()
            ),
            Positioned(top: size.height*.3,
                right: size.width*.38,
                child: WellComeTitle()),
            Positioned(
                bottom: size.height*.3,
                left: size.width*.41,
                child: WellComeFadeButton()),
            Positioned(
              left: size.width*.14,
                top: size.height*.02,
                child: WellComeAppBar()),
            Positioned(
              top: size.height * .03,
              left: size.width * .04,
              child:Container(width: size.width*.12,
                height: size.height*.1,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        fit: BoxFit.cover,
                        image: NetworkImage("https://s8.uupload.ir/files/logo_jh56.png")
                    )
                ),
              )
            ),
          ],
        ),
      ),
    );
  }
}
