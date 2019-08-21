import 'package:flutter/material.dart';
import 'package:flutter_uitest1/models/character.dart';
import 'package:flutter_uitest1/widgets/characterBlackPantherWidget.dart';

import '../../styleguide.dart';

class CharacterBlackPantherListingScreen extends StatefulWidget {
  @override
  _CharacterBlackPantherListingScreenState createState() => _CharacterBlackPantherListingScreenState();
}

class _CharacterBlackPantherListingScreenState extends State<CharacterBlackPantherListingScreen> {
  PageController _pageController;
  int currentPage = 0;
  CharacterBlackPanther character;

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
          icon: Icon(
            Icons.arrow_back_ios,
            color: Colors.white,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(
          'Black Panther',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.deepPurpleAccent,
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.only(right: 16.0),
            child: Icon(
              Icons.search,
              color: Colors.white,
            ),
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
                    TextSpan(text: "Black Panther", style: AppTheme.display1),
                    TextSpan(text: "\n"),
                    TextSpan(text: "Characters", style: AppTheme.display2)
                  ]),
                ),
              ),
              Expanded(
                child: PageView(children: <Widget>[
                  for (var i = 0; i < character_blackpanther.length; i++)
                    CharacterBlackPantherWidget(
                        character: character_blackpanther[i],
                        pageController: _pageController,
                        currentPage: i),
                ]), // image and box widget
              )
            ],
          ),
        ),
      ),
    );
  }
}