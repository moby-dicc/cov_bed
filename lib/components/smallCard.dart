import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SmallCard extends StatefulWidget {
  final String iconSvg;
  final String value;
  final String unit;
  final double height, width;
  SmallCard({this.iconSvg, this.value, this.unit, this.height, this.width});
  @override
  _SmallCardState createState() => _SmallCardState();
}

class _SmallCardState extends State<SmallCard> {
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
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            SvgPicture.asset(
              widget.iconSvg,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
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
                fontSize: 11,
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
