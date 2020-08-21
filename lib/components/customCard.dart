import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomCard extends StatefulWidget {
  final String iconSvg;
  final String value;
  final String unit;
  final double height, width;
  CustomCard({this.iconSvg, this.value, this.unit, this.height, this.width});
  @override
  _CustomCardState createState() => _CustomCardState();
}

class _CustomCardState extends State<CustomCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: widget.height,
      width: widget.width,
      child: Card(
        color: Colors.white,
        margin: EdgeInsets.all(5.0),
        shadowColor: Colors.grey,
        elevation: 15.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(20.0)),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            SvgPicture.asset(widget.iconSvg,
                height: 50.0,
                width: 50.0,
               
                semanticsLabel: 'A red up arrow'),
            Padding(
              padding: const EdgeInsets.all(8),
              child: Text(
                widget.value,
                style: TextStyle(
                  fontFamily: 'Muli',
                  fontSize: 20,
                  color: Colors.black,
                  fontWeight: FontWeight.w800,
                ),
                textAlign: TextAlign.left,
              ),
            ),
            Text(
              widget.unit,
              style: TextStyle(
                fontFamily: 'Muli',
                fontSize: 13,
                color: Colors.black,
                fontWeight: FontWeight.w800,
              ),
              textAlign: TextAlign.left,
            ),
          ],
        ),
      ),
    );
  }
}
