import 'package:flutter/material.dart';
import 'constants.dart';

class TileCard extends StatelessWidget {
  TileCard({this.title, this.dispicon, this.gesture});

  final String title;
  final IconData dispicon;
  final Function gesture;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Icon(
            dispicon,
            size: 80.0,
          ),
          SizedBox(
            height: 15.0,
          ),
          Center(
            child: Text(title, style: kLabelTextStyle)
          )
        ],
      ),
      onTap: gesture
    );
  }
}

class Tile extends StatelessWidget {
  Tile({@required this.colour, this.cardchild});

  final Color colour;
  final Widget cardchild;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: cardchild,
      margin: EdgeInsets.all(15),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: colour
      ),
    );
  }
}

class RoundIconButton extends StatelessWidget {

  RoundIconButton({this.gesture, this.buttonicon});

  final Function gesture;
  final IconData buttonicon;

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      child: Icon(buttonicon),
      elevation: 0.0,
      constraints: BoxConstraints.tightFor(
          width: 56.0,
          height: 56.0
      ),
      onPressed: gesture,
      shape: CircleBorder(),
      fillColor: Color(0xFF4C4F5E),
    );
  }
}

class BottomButton extends StatelessWidget {

  BottomButton({@required this.onPress,@required this.title});

  final Function onPress;
  final String title;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        child: Center(
          child: Text(
            title,
            style: kLabelTextStyle.copyWith(
                fontSize: 25.0, color: Colors.white),
          ),),
        color: Color(0xFFEB1555),
        margin: EdgeInsets.only(top: 10),
        width: double.infinity,
        height: kBottomHeight,
      ),
      onTap: onPress
    );
  }
}