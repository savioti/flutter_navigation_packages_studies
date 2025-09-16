import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'package:study_flutter_chopper/pages/home/home_page.dart';

import 'data/posts_api_service.dart';

void main() => runApp(const App());

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Provider(
      // The initialized PostApiService is now available down the widget tree
      create: (_) => PostsApiService.create(),
      // Always call dispose on the ChopperClient to release resources
      dispose: (context, PostsApiService service) => service.client.dispose(),
      child: const MaterialApp(
        title: 'Material App',
        home: HomePage(),
      ),
    );
  }
}
