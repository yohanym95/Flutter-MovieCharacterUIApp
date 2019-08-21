import 'package:flutter/material.dart';
import 'package:flutter_uitest1/models/character.dart';
import 'package:flutter_uitest1/widgets/characterAvengerWidget.dart';

import '../../styleguide.dart';

class CharacterAvengerListingScreen extends StatefulWidget {
  @override
  _CharacterAvengerListingScreenState createState() => _CharacterAvengerListingScreenState();
}

class _CharacterAvengerListingScreenState extends State<CharacterAvengerListingScreen> {
  PageController _pageController;
  int currentPage = 0;
  CharacterAvengers character;


  @override
  void initState() {
    super.initState();
    _pageController = PageController(
        //***** */
        viewportFraction: 1.0,
        initialPage: currentPage,
        keepPage: false);
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios,color: Colors.white,),
          onPressed: (){
            Navigator.pop(context); 
          },
        ),
        title: Text('Avenegrs',style: TextStyle(color: Colors.white),),
        backgroundColor: Colors.amber,
         actions: <Widget>[
          Padding(
            padding: const EdgeInsets.only(right: 16.0),
            child: Icon(Icons.search,color: Colors.white,),
          )
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(bottom: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(left: 32.0, top: 7.0),
                child: RichText(
                  text: TextSpan(children: [
                    TextSpan(text: "Avenegers", style: AppTheme.display1),
                    TextSpan(text: "\n"),
                    TextSpan(text: "Characters", style: AppTheme.display2)
                  ]),
                ),
              ),
              Expanded(
                child: PageView(children: <Widget>[
                  for(var i=0; i<character_Avengers.length; i++)
                  CharacterAvengerWidget(character :character_Avengers[i], pageController :_pageController,currentPage:i),
                ]), // image and box widget
              )
            ],
          ),
        ),
      ),
    );
  }
}