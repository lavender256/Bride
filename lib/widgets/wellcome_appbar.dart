import 'package:flutter/material.dart';
import 'package:frino_icons/frino_icons.dart';

class WellComeAppBar extends StatefulWidget {

  @override
  State<WellComeAppBar> createState() => _WellComeAppBarState();
}

class _WellComeAppBarState extends State<WellComeAppBar> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Container(
      padding: EdgeInsets.symmetric(horizontal: size.width*.04),
      width:size.width*.86,
      height: size.height*.1,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
        SizedBox(width: size.width*.035,),
        Text("Collection".toUpperCase(),style: TextStyle(
            color: Colors.black,fontWeight: FontWeight.w700,letterSpacing: 1.2)),
          SizedBox(width: size.width*.035,),
        Container(width: size.width*.1,
        height: size.height*.06,
         child: Center(
           child: TextField(cursorColor: Colors.black,

             decoration: InputDecoration(
               prefixIcon: Icon(FrinoIcons.f_search,color: Colors.black,size: size.width*.01,),
               hintText: "Search".toUpperCase(),
               hintStyle: TextStyle(color: Colors.black,letterSpacing: 1.1,fontWeight: FontWeight.w700,fontSize: size.width*.009)
             ),
           ),
         ),
        ),
        Spacer(),
       Container(width: size.width*.05,
       height: size.width*.03,
         child: Stack(alignment: Alignment.center,
         children: [
           Text("Log in".toUpperCase(),style: TextStyle(color: Colors.black,fontWeight: FontWeight.w700,letterSpacing: 1.2,wordSpacing: 1.2),),
           Positioned(
               top: 0,
               child: Container(width: size.width*.025,
           height: 1.5,
                 color: Colors.black,
           )),
           Positioned(
               bottom: 0,
               child: Container(width: size.width*.025,
                 height: 1.5, color: Colors.black,
               ))
         ],
         ),
       ) ,SizedBox(width: size.width*.03,),
        Text("wish List".toUpperCase(),style: TextStyle(
          color: Colors.black,fontWeight: FontWeight.w700,wordSpacing: 1.2,letterSpacing: 1.2
        ),),SizedBox(width: size.width*.02,),
          Container(width: size.width*.03,
          height: size.width*.03,  color: Colors.white,
            child:Icon(FrinoIcons.f_menu,color: Colors.black,size: size.width*.012,),
          )
      ],),
    );
  }
}
