import 'package:flutter/material.dart';
import 'package:navegacao_angelo/app/pages/page_about.dart';
import 'package:navegacao_angelo/app/pages/page_counter.dart';
import 'package:navegacao_angelo/app/pages/page_home.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Navegação - Ângelo',
      theme: appTheme(),
      initialRoute: '/',
      routes: {
        '/': (context) => HomePage(),
        '/contador': (context) => CounterPage(),
        '/sobre': (context) => AboutPage()
      },
    );
  }

  ThemeData appTheme() {
    return ThemeData(
      primaryColor: Colors.amber[300],
      buttonColor: Colors.amber[300],
      backgroundColor: Colors.amber[100],
      scaffoldBackgroundColor: Colors.amber[100],
      accentColor: Colors.amber[300],
      appBarTheme: AppBarTheme(
        textTheme: TextTheme(
          headline6: TextStyle(
            color: Colors.purple[800],
            fontSize: 20.0,
          ),
        ),
      ),
      iconTheme: IconThemeData(
        color: Colors.amber,
      ),
    );
  }
}
