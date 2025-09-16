import 'package:flutter/material.dart';
import 'package:navegacao_angelo/app/shared/widgets/button_labeled_rectangular.dart';
import 'package:navegacao_angelo/app/shared/widgets/circle_avatar_label_and_text.dart';

class CounterPage extends StatefulWidget {
  CounterPage({Key key}) : super(key: key);

  @override
  _CounterPageState createState() => _CounterPageState();
}

class _CounterPageState extends State<CounterPage> {
  int _counter = 0;
  int _highestValue = 0;
  int _lowestValue = 0;

  void _decrementCounter([int value = 1]) {
    setState(() {
      _counter -= value;

      if (_counter < _lowestValue) _lowestValue = _counter;
    });
  }

  void _incrementCounter([int value = 1]) {
    setState(() {
      _counter += value;

      if (_counter > _highestValue) _highestValue = _counter;
    });
  }

  void _resetValues() {
    setState(() {
      _counter = 0;
      _highestValue = 0;
      _lowestValue = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    double _counterCanvasHeight = MediaQuery.of(context).size.height / 2;
    double _counterCanvasWidth = MediaQuery.of(context).size.width;

    return WillPopScope(
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            'Contador',
          ),
        ),
        body: Center(
          child: SizedBox(
            width: _counterCanvasWidth,
            height: _counterCanvasHeight,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    CircleAvatarWidgetLabelAndName(
                        label: 'Lowest',
                        text: _lowestValue.toString(),
                        backgroundColor: Colors.purple[600],
                        textColor: Colors.amber[200]),
                    Text(
                      _counter.toString(),
                      style: TextStyle(
                        fontSize: 52.0,
                        color: Colors.purple[800],
                      ),
                    ),
                    CircleAvatarWidgetLabelAndName(
                        label: 'Highest',
                        text: _highestValue.toString(),
                        backgroundColor: Colors.purple[600],
                        textColor: Colors.amber[200]),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    LabeledRectangularButton(
                        label: '-1',
                        callback: _decrementCounter,
                        backgroundColor: Colors.purple[600],
                        textColor: Colors.amber[200]),
                    LabeledRectangularButton(
                        label: '+1',
                        callback: _incrementCounter,
                        backgroundColor: Colors.purple[600],
                        textColor: Colors.amber[200]),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    LabeledRectangularButton(
                        label: '-2',
                        callback: () => {_decrementCounter(2)},
                        backgroundColor: Colors.purple[600],
                        textColor: Colors.amber[200]),
                    LabeledRectangularButton(
                        label: '+2',
                        callback: () => {_incrementCounter(2)},
                        backgroundColor: Colors.purple[600],
                        textColor: Colors.amber[200]),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    LabeledRectangularButton(
                      label: 'Reset',
                      callback: _resetValues,
                      backgroundColor: Colors.purple[600],
                      textColor: Colors.amber[200],
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    LabeledRectangularButton(
                      label: 'Home',
                      callback: () => {
                        Navigator.pushReplacementNamed(context, '/',
                            arguments: _counter)
                      },
                      backgroundColor: Colors.purple[600],
                      textColor: Colors.amber[200],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
      onWillPop: () async {
        if (Navigator.canPop(context)) return Future.value(true);

        return Future.value(false);
      },
    );
  }
}
