import 'package:flutter/material.dart';

class CircleAvatarWidgetLabelAndName extends StatelessWidget {
  final String label;
  final String text;
  final Color backgroundColor;
  final Color textColor;

  const CircleAvatarWidgetLabelAndName(
      {Key key,
      @required this.label,
      @required this.text,
      @required this.backgroundColor,
      @required this.textColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      backgroundColor: backgroundColor,
      radius: 32.0,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text(
            label,
            style: TextStyle(
              color: textColor,
              fontSize: 11.0,
            ),
          ),
          Text(
            text,
            style: TextStyle(
              color: textColor,
              fontSize: 28.0,
            ),
          ),
        ],
      ),
    );
  }
}
