
import 'package:flutter/material.dart';
import 'package:wedding_web_ui/data/data.dart';
import 'package:wedding_web_ui/model/collection.dart';
import 'package:wedding_web_ui/screens/category_screen.dart';
import 'package:wedding_web_ui/widgets/category_screen_card.dart';
class ViewCollectionWidget extends StatefulWidget {
  final Collection collection;

  ViewCollectionWidget({this.collection});

  @override
  State<ViewCollectionWidget> createState() => _ViewCollectionWidgetState();
}

class _ViewCollectionWidgetState extends State<ViewCollectionWidget> {
  @override
  Widget build(BuildContext context) {
    var size=MediaQuery.of(context).size;
    return GestureDetector(
      onTap: ()=>Navigator.push(context, MaterialPageRoute(builder: (_)=>CategoryScreen(collection: widget.collection,))),
      child: Container(
        width: size.width*.18,
        height: size.height*.14,
       decoration: BoxDecoration(
         color: Colors.white,
         borderRadius: BorderRadius.circular(5)
       ),
        child: Row(
          children: [
            Container(width: size.width*.07,
            height: size.height,
              decoration: BoxDecoration( borderRadius: BorderRadius.only(topLeft: Radius.circular(5),bottomLeft: Radius.circular(5)),
                image: DecorationImage(alignment: Alignment.topCenter,
                  image: NetworkImage(widget.collection.smallimageUrl),fit: BoxFit.cover
                )
              ),
            ),
            Container(
              width: size.width*.11,
              height: size.height,
              padding: EdgeInsets.only(left: size.width*.015),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("View Collection",style: TextStyle(color: Colors.black,fontWeight: FontWeight.w900),),
                  SizedBox(height: size.width*.01,),
                  Text("List of all collection",style: TextStyle(color: Colors.black,fontWeight: FontWeight.w900),),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
