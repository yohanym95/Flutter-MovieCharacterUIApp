import 'package:after_layout/after_layout.dart';
import 'package:flutter/material.dart';
import 'package:flutter_uitest1/models/character.dart';
import 'package:flutter_uitest1/styleguide.dart';

class CharacterDeatilScreen extends StatefulWidget {
  final CharacterDespicableMe character;
  final double _expandedBottomSheetBottomPosition = 0;
  final double _collapsedBottomSheetBottomPosition = -250;
  final double _completeCollapsedBottomSheetBottomPosition = -330;

  const CharacterDeatilScreen({Key key, this.character}) : super(key: key);

  @override
  _CharacterDetailScreenState createState() => _CharacterDetailScreenState();
}

class _CharacterDetailScreenState extends State<CharacterDeatilScreen>
    with AfterLayoutMixin<CharacterDeatilScreen> {
  double _bottomSheetBottomPosition = -330;
  bool isCollapsed = false;

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
        body: Stack(
      fit: StackFit.expand, // this expand its widget
      children: <Widget>[
        Hero(
          tag: "background-${widget.character.name}",
          child: DecoratedBox(
            decoration: BoxDecoration(
                gradient: LinearGradient(
              colors: widget.character.colors, //getting sent data
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
            )),
          ),
        ),
        SingleChildScrollView(
          // this cleared exceptions
          padding: EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SizedBox(
                height: 35,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 16.0, top: 8.0),
                child: IconButton(
                  iconSize: 30,
                  icon: Icon(
                    Icons.close,
                  ),
                  color: Colors.white.withOpacity(0.9),
                  onPressed: () {
                    setState(() {
                      _bottomSheetBottomPosition =
                          widget._completeCollapsedBottomSheetBottomPosition;
                    });
                    Navigator.pop(context);
                  },
                ),
              ),
              Align(
                  alignment: Alignment.topRight,
                  child: Hero(
                    tag: "image-${widget.character.imagePath}",
                    child: Image.asset(widget.character.imagePath,
                        height: screenHeight * 0.3),
                  )),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 30.0, vertical: 8.0),
                child: Hero(
                  //animate
                  tag: "name-${widget.character.name}",
                  child: Material(
                    color: Colors.transparent,
                    child: Container(
                      child: Text(
                        widget.character.name,
                        style: AppTheme.heading,
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(30, 0, 5, 30),
                child: Text(
                  widget.character.description,
                  style: AppTheme.subHeading,
                ),
              )
            ],
          ),
        ),
        AnimatedPositioned(
          duration: const Duration(microseconds: 500),
          curve: Curves.bounceInOut,
          bottom: _bottomSheetBottomPosition,
          right: 0,
          left: 0,
          child: Container(
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(40),
                    topRight: Radius.circular(40))),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                InkWell(
                  onTap: (){
                    _onTap();
                  },
                  child: Container(
                    alignment: Alignment.centerLeft,
                    padding: const EdgeInsets.symmetric(horizontal: 32),
                    height: 80,
                    child: Text(
                      "Cilps",
                      style:
                          AppTheme.subHeading.copyWith(color: Colors.black87),
                    ),
                  ),
                ),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal, // horizonatlly scroll
                  child: _clipsWidget(),
                )
              ],
            ),
          ),
        )
      ],
    ));
  }

  Widget _clipsWidget() {
    //////////////
    return Container(
      height: 250,
      margin: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        children: <Widget>[
          Column(
            children: <Widget>[
              roundedContainer(Colors.redAccent),
              SizedBox(height: 20),
              roundedContainer(Colors.greenAccent)
            ],
          ),
          SizedBox(
            width: 16,
          ),
          Column(
            children: <Widget>[
              roundedContainer(Colors.orangeAccent),
              SizedBox(height: 20),
              roundedContainer(Colors.purple),
            ],
          ),
          SizedBox(
            width: 16,
          ),
          Column(
            children: <Widget>[
              roundedContainer(Colors.grey),
              SizedBox(height: 20),
              roundedContainer(Colors.blueGrey),
            ],
          ),
          SizedBox(
            width: 16,
          ),
          Column(
            children: <Widget>[
              roundedContainer(Colors.lightGreenAccent),
              SizedBox(height: 20),
              roundedContainer(Colors.pinkAccent),
            ],
          ),
        ],
      ),
    );
  }

  Widget roundedContainer(Color color) {
    return Container(
      width: 100,
      height: 100,
      decoration: BoxDecoration(
          color: color, borderRadius: BorderRadius.all(Radius.circular(20))),
    );
  }

  _onTap (){
    setState(() {
      _bottomSheetBottomPosition = isCollapsed ? widget._expandedBottomSheetBottomPosition : widget._collapsedBottomSheetBottomPosition; 
      isCollapsed = !isCollapsed;
    });
  }

  @override
  void afterFirstLayout(BuildContext context) {
    Future.delayed(const Duration(milliseconds: 750), () {
      setState(() {
        isCollapsed = true;
        _bottomSheetBottomPosition = widget._collapsedBottomSheetBottomPosition;
      });
    });
  }
}
