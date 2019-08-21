import 'package:flutter/material.dart';
import 'package:flutter_uitest1/pages/avengers/CharacterAvengersListingScreen.dart';
import 'package:flutter_uitest1/pages/blackpanther/CharacterBlackPantherListingScreen.dart';
import 'package:flutter_uitest1/pages/captainamerica/CharacterCaptainAmericaListingScreen.dart';
import 'package:flutter_uitest1/pages/des/CharacterListingScreen.dart';
import 'package:flutter_uitest1/pages/minions/CharacterMinionsListingScreen.dart';

import 'antman/CharacterAntmanListingScreen.dart';

class CharcaterHomePage extends StatefulWidget {
  @override
  _CharcaterHomePageState createState() => _CharcaterHomePageState();
}

class _CharcaterHomePageState extends State<CharcaterHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      margin: const EdgeInsets.only(top: 50.0),
      child: GridView(
        physics: BouncingScrollPhysics(),
        gridDelegate:
            SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        children: <Widget>[
          GestureDetector(
            child: Card(
                margin: EdgeInsets.all(10),
                color: Colors.blueGrey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Expanded(
                      child: Container(
                        width: 150.0,
                        height: 150.0,
                        child: Image(
                            image: AssetImage('assets/images/superman.png')),
                      ),
                    ),
                    Text(
                      "SuperMan",
                      style: TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                      textAlign: TextAlign.center,
                    )
                  ],
                )),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => CharacterMinionsListing()));
            },
          ),
          GestureDetector(
            child: Card(
                elevation: 10.0,
                margin: EdgeInsets.all(10),
                color: Colors.amber,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Expanded(
                      child: Container(
                        width: 150.0,
                        height: 150.0,
                        child: Image(
                            image: AssetImage('assets/images/avengers.png')),
                      ),
                    ),
                    Text(
                      "Avengers",
                      style: TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                      textAlign: TextAlign.center,
                    )
                  ],
                )),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => CharacterAvengerListingScreen()));
            },
          ),
          GestureDetector(
            child: Card(
                margin: EdgeInsets.all(10),
                color: Colors.redAccent,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Expanded(
                      child: Container(
                        width: 150.0,
                        height: 150.0,
                        child: Image(
                            image: AssetImage('assets/images/antman.png')),
                      ),
                    ),
                    Text(
                      "Ant-Man",
                      style: TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                      textAlign: TextAlign.center,
                    )
                  ],
                )),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => CharacterAntmanListingScreen()));
            },
          ),
          GestureDetector(
            child: Card(
                margin: EdgeInsets.all(10),
                color: Colors.lightBlueAccent,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Expanded(
                      child: Container(
                        width: 150.0,
                        height: 150.0,
                        child: Image(
                            image: AssetImage(
                                'assets/images/captain-america.png')),
                      ),
                    ),
                    Text(
                      "Captain America",
                      style: TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                      textAlign: TextAlign.center,
                    )
                  ],
                )),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          CharacterCaptainAmericaListingScreen()));
            },
          ),
          GestureDetector(
            child: Card(
                margin: EdgeInsets.all(10),
                color: Colors.pink,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Expanded(
                      child: Container(
                        width: 150.0,
                        height: 150.0,
                        child: Image(
                            image: AssetImage('assets/images/descapbleme.png')),
                      ),
                    ),
                    Text(
                      "Despicable Me",
                      style: TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                      textAlign: TextAlign.center,
                    )
                  ],
                )),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => CharacterListingScreen()));
            },
          ),
          GestureDetector(
            child: Card(
                margin: EdgeInsets.all(10),
                color: Colors.deepPurpleAccent,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Expanded(
                      child: Container(
                        width: 150.0,
                        height: 150.0,
                        child: Image(
                            image:
                                AssetImage('assets/images/black-panther.png')),
                      ),
                    ),
                    Text(
                      "Black Panther",
                      style: TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                      textAlign: TextAlign.center,
                    )
                  ],
                )),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => CharacterBlackPantherListingScreen()));
            },
          )
        ],
      ),
    ));
  }
}
