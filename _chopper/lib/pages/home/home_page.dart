import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:chopper/chopper.dart';
import 'package:provider/provider.dart';
import 'package:study_flutter_chopper/data/posts_api_service.dart';
import 'package:study_flutter_chopper/pages/post/post_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Chopper Blog'),
      ),
      body: _buildBody(context),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () async {
          // The JSONPlaceholder API always responds with whatever was passed in the POST request
          await Provider.of<PostsApiService>(context, listen: false)
              .postPost({'key': 'value'}).then(
            (response) => ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text('Post ${response.body['id']} added!'),
              ),
            ),
          );
        },
      ),
    );
  }

  FutureBuilder<Response> _buildBody(BuildContext context) {
    // FutureBuilder is perfect for easily building UI when awaiting a Future
    // Response is the type currently returned by all the methods of PostApiService
    return FutureBuilder<Response>(
      // In real apps, use some sort of state management (BLoC is cool)
      // to prevent duplicate requests when the UI rebuilds
      future: Provider.of<PostsApiService>(context).getPosts(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done &&
            snapshot.data != null) {
          // Snapshot's data is the Response
          // You can see there's no type safety here (only List<dynamic>)
          final List posts = json.decode(snapshot.data!.bodyString);
          return _buildPosts(context, posts);
        } else {
          // Show a loading indicator while waiting for the posts
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }

  ListView _buildPosts(BuildContext context, List posts) {
    return ListView.builder(
      itemCount: posts.length,
      padding: const EdgeInsets.all(8),
      itemBuilder: (context, index) {
        return Card(
          elevation: 4,
          child: ListTile(
            title: Text(
              posts[index]['title'],
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            subtitle: Text(posts[index]['body']),
            onTap: () => _navigateToPost(context, posts[index]['id']),
          ),
        );
      },
    );
  }

  void _navigateToPost(BuildContext context, int id) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => PostPage(postId: id),
      ),
    );
  }
}
