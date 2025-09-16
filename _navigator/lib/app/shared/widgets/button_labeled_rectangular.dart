import 'package:flutter/material.dart';

class LabeledRectangularButton extends StatelessWidget {
  final String label;
  final Function callback;
  final Color backgroundColor;
  final Color textColor;

  const LabeledRectangularButton(
      {Key key,
      @required this.label,
      @required this.callback,
      @required this.backgroundColor,
      @required this.textColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: callback,
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(backgroundColor),
      ),
      child: Text(
        label,
        style: TextStyle(
          color: textColor,
        ),
      ),
    );
  }
}
