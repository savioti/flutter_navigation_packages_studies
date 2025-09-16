import 'package:flutter/material.dart';
import 'package:study_flutter_navigator_2_0/app/shared/models/book_model.dart';

class BookDetailsScreen extends StatelessWidget {
  final Book? book;

  const BookDetailsScreen({
    Key? key,
    this.book,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (book != null) ...[
              Text(
                book!.title,
                style: Theme.of(context).textTheme.headline6,
              ),
              Text(
                book!.author,
                style: Theme.of(context).textTheme.subtitle1,
              ),
            ],
          ],
        ),
      ),
    );
  }
}
