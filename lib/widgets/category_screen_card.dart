import 'package:flutter/material.dart';
import 'package:wedding_web_ui/data/color.dart';
import 'package:wedding_web_ui/data/data.dart';
import 'package:wedding_web_ui/model/dress.dart';
import 'package:wedding_web_ui/model/collection.dart';
import 'package:wedding_web_ui/model/pages.dart';
import 'package:wedding_web_ui/widgets/category_card.dart';

class CategoryScreenCard extends StatefulWidget {
  final Pages pages;
final Collection collection;
  CategoryScreenCard({this.pages,this.collection});

  @override
  State<CategoryScreenCard> createState() => _CategoryScreenCardState();
}

class _CategoryScreenCardState extends State<CategoryScreenCard> {
  @override
  Widget build(BuildContext context) { var size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: scaffoldColor,
      body: Container( padding: EdgeInsets.symmetric(horizontal: size.width*.05,),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
                width: size.width*.18,
                height: size.height*.1,
                child: Row(children: [
                  Container(width: size.width*.04,
                  height: size.width*.04,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      image: DecorationImage(
                          fit: BoxFit.fill,
                          image: NetworkImage(widget.collection.smallimageUrl))
                    ),
                  ),
                  Spacer(),
                  Text("List of all collection",style: TextStyle(color: Colors.black,fontWeight: FontWeight.w900,fontSize: size.width*.015),)
                ],)),
            Container(
              width: size.width,
              height: size.height*.75,
              child: GridView.builder(gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 4,
                  mainAxisSpacing: size.width*.04,
                  crossAxisSpacing: size.height*.09,
                  childAspectRatio: 1.2
              ), itemBuilder: (BuildContext context,int index){
                Dress dress=widget.pages.list[index];
                return CategoryCard(dress: dress,);
              },itemCount: widget.pages.list.length,),
            ),
        Container(
          width: size.width*.18,
          height: size.height*.1,
          child: Text("Page ${widget.pages.page}",style: TextStyle(color: mainColor2,fontWeight: FontWeight.w800,fontSize: size.width*.012),))
          ],
        ),
      )
    );
  }
}
