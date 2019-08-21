import 'package:flutter/material.dart';
import 'package:flutter_uitest1/models/character.dart';
import 'package:flutter_uitest1/widgets/characterMinionWidget.dart';
import 'package:flutter_uitest1/widgets/characterwidgets.dart';

import '../../styleguide.dart';

class CharacterMinionsListing extends StatefulWidget {
  @override
  _CharacterMinionsListingState createState() => _CharacterMinionsListingState();
}

class _CharacterMinionsListingState extends State<CharacterMinionsListing> {
  PageController _pageController;
  int currentPage = 0;
  CharacterMinons character;

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
        title: Text('SuperMan',style: TextStyle(color: Colors.white),),
        backgroundColor: Colors.blueGrey,
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
                    TextSpan(text: "SuperMan", style: AppTheme.display1),
                    TextSpan(text: "\n"),
                    TextSpan(text: "Characters", style: AppTheme.display2)
                  ]),
                ),
              ),
              Expanded(
                child: PageView(children: <Widget>[
                  for(var i=0; i<characters_minons.length; i++)
                  CharacterMinionWidget(character :characters_minons[i], pageController :_pageController,currentPage:i),
                ]), // image and box widget
              )
            ],
          ),
        ),
      ),
    );
  }
}