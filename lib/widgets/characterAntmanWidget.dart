import 'package:flutter/material.dart';
import 'package:flutter_uitest1/models/character.dart';
import 'package:flutter_uitest1/pages/antman/CharacterAntmanDetailScreen.dart';

import '../styleguide.dart';

class CharacterAntmanWidget extends StatelessWidget {
  final CharacterAntMan character;
  final PageController pageController;
  final int currentPage;

  const CharacterAntmanWidget(
      {Key key, this.character, this.pageController, this.currentPage})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    return InkWell(
      onTap: () {
        Navigator.push(
            context,
            PageRouteBuilder(
                transitionDuration: const Duration(milliseconds: 350),
                pageBuilder: (context, _, __) => CharacterAntmanDetailScreen(
                    character:
                        character) // send data into another page , send each character into next page
                ));
      },
      child: AnimatedBuilder(
        animation: pageController,
        builder: (context, child) {
          // double value =1;
          // if(pageController.position.haveDimensions){
          //   value = pageController.page- currentPage;
          //   value = (1- (value.abs() * 0.6)).clamp(0.0, 1.0);

          //   if(currentPage == 0)
          //   print("value : $value");
          // }
          return child;
        },
        child: Stack(children: [
          Align(
            alignment: Alignment.bottomCenter,
            child: ClipPath(
              clipper: CharacterCardBackgroundClipper(),
              child: Hero(
                tag:
                    "background-${character.name}", // because of statless we cant use widget.character
                child: Container(
                  height: 0.55 * screenHeight,
                  width: 0.9 * screenWidth,
                  decoration: BoxDecoration(
                      gradient: LinearGradient(
                    colors: character.colors,
                    begin: Alignment.topRight,
                    end: Alignment.bottomLeft,
                  )),
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment(0, 0),
            child: Padding(
              padding: const EdgeInsets.only(bottom: 90.0),
              child: Hero(
                tag: "image-${character.imagePath}",
                child: Image.asset(
                  character.imagePath,
                  height: screenHeight * 0.55,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 34, vertical: 10),
            child: Column(
              //because of
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                Hero(
                  tag: "name-${character.name}",
                  child: Material(
                    color: Colors.transparent,
                    child: Container(
                        child: Text(character.name, style: AppTheme.heading)),
                  ),
                ),
                Text("Tap to Read More", style: AppTheme.subHeading)
              ],
            ),
          )
        ]),
      ),
    );
  }
}

class CharacterCardBackgroundClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    // TODO: implement getClip
    Path clippedPath = Path();
    double curveDistance = 40;

    clippedPath.moveTo(0, size.height * 0.4);
    clippedPath.lineTo(0, size.height - curveDistance);
    clippedPath.quadraticBezierTo(
        1, size.height - 1, 0 + curveDistance, size.height);
    clippedPath.lineTo(size.width - curveDistance, size.height);
    clippedPath.quadraticBezierTo(size.width + 1, size.height - 1, size.width,
        size.height - curveDistance);
    clippedPath.lineTo(size.width, 0 + curveDistance);
    clippedPath.quadraticBezierTo(size.width - 1, 0,
        size.width - curveDistance - 5, 0 + curveDistance / 3);
    clippedPath.lineTo(curveDistance, size.height * 0.29);
    clippedPath.quadraticBezierTo(
        1, (size.height * 0.30) + 10, 0, size.height * 0.4);

    return clippedPath;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    // TODO: implement shouldReclip
    return true;
  }
}