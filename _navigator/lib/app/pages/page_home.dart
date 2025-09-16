import 'package:flutter/material.dart';
import 'package:navegacao_angelo/app/shared/widgets/button_labeled_rectangular.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final int _maiorCntagem = ModalRoute.of(context).settings.arguments ?? 0;

    return WillPopScope(
        child: Scaffold(
          appBar: AppBar(
            title: Text('Início'),
          ),
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  'Teste de navegação',
                  style: TextStyle(
                    fontSize: 32.0,
                    color: Colors.purple[800],
                  ),
                ),
                Text(
                  'Último valor contado: $_maiorCntagem',
                  style: TextStyle(
                    fontSize: 16.0,
                    color: Colors.purple[800],
                  ),
                ),
                _ButtonsBox()
              ],
            ),
          ),
        ),
        onWillPop: () async {
          if (Navigator.canPop(context)) return Future.value(true);

          return Future.value(false);
        });
  }
}

class _ButtonsBox extends StatelessWidget {
  const _ButtonsBox({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          LabeledRectangularButton(
            label: 'Contador',
            callback: () =>
                {Navigator.pushReplacementNamed(context, '/contador')},
            backgroundColor: Colors.purple[600],
            textColor: Colors.amber[200],
          ),
          LabeledRectangularButton(
            label: 'Sobre',
            callback: () => {Navigator.pushNamed(context, '/sobre')},
            backgroundColor: Colors.purple[600],
            textColor: Colors.amber[200],
          ),
        ],
      ),
    );
  }
}
