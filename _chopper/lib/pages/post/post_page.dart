import 'dart:convert';

import 'package:chopper/chopper.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:study_flutter_chopper/data/posts_api_service.dart';

class PostPage extends StatelessWidget {
  final int postId;

  const PostPage({
    Key? key,
    required this.postId,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Post details'),
      ),
      body: FutureBuilder<Response>(
        future: Provider.of<PostsApiService>(context).getPost(postId),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done &&
              snapshot.data != null) {
            final Map post = json.decode(snapshot.data!.bodyString);
            return _buildPost(post);
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }

  Padding _buildPost(Map post) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: <Widget>[
          Text(
            post['title'],
            style: const TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8),
          Text(post['body']),
        ],
      ),
    );
  }
}
