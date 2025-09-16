import 'package:flutter/material.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({Key key}) : super(key: key);
  final displayText =
      'Este app foi desenvolvido para o bootcamp da Squadra em abril de 2021 por Ângelo Savioti.';

  @override
  Widget build(BuildContext context) {
    double _counterCanvasWidth = MediaQuery.of(context).size.width / 1.5;

    return Scaffold(
        appBar: AppBar(
          title: Text('Sobre'),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: _counterCanvasWidth,
                  child: Text(
                    displayText,
                    style: TextStyle(
                      color: Colors.purple[800],
                      fontSize: 24.0,
                    ),
                  ),
                ),
              ],
            )
          ],
        ));
  }
}
