import 'package:flutter/material.dart';
import 'package:study_flutter_navigator_2_0/app/core/navigation/models/book_route_path.dart';
import 'package:study_flutter_navigator_2_0/app/core/navigation/pages/book_details_page.dart';
import 'package:study_flutter_navigator_2_0/app/screens/book_list/book_list_screen.dart';
import 'package:study_flutter_navigator_2_0/app/screens/not_found/not_found_screen.dart';
import 'package:study_flutter_navigator_2_0/app/shared/models/book_model.dart';

class BookRouterDelegate extends RouterDelegate<BookRoutePath>
    with ChangeNotifier, PopNavigatorRouterDelegateMixin<BookRoutePath> {
  @override
  final GlobalKey<NavigatorState> navigatorKey;

  Book? _selectedBook;
  bool isPageFound = true;

  List<Book> books = [
    Book('If Tomorrow Comes', 'Sidney Sheldon'),
    Book('Clean Code', 'Robert C. Martin'),
    Book('Red Dragon', 'Thomas Harris'),
  ];

  BookRouterDelegate() : navigatorKey = GlobalKey<NavigatorState>();

  @override
  BookRoutePath get currentConfiguration {
    if (!isPageFound) {
      return BookRoutePath.unknown();
    }

    return _selectedBook == null
        ? BookRoutePath.home()
        : BookRoutePath.details(books.indexOf(_selectedBook!));
  }

  @override
  Future<void> setNewRoutePath(BookRoutePath configuration) async {
    if (configuration.isUnknown) {
      _selectedBook = null;
      isPageFound = false;
      return;
    }

    if (configuration.isDetailsPage && configuration.id != null) {
      if (configuration.id! < 0 || configuration.id! > books.length - 1) {
        isPageFound = false;
        return;
      }

      _selectedBook = books[configuration.id!];
    } else {
      _selectedBook = null;
    }

    isPageFound = true;
  }

  void _handleBookTapped(Book book) {
    _selectedBook = book;
    notifyListeners();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Books App',
      home: Navigator(
        pages: [
          MaterialPage(
            key: const ValueKey('BooksListPage'),
            child: BooksListScreen(
              books: books,
              onTapped: _handleBookTapped,
            ),
          ),
          if (!isPageFound)
            const MaterialPage(
              key: ValueKey('UnknownPage'),
              child: NotFoundScreen(),
            )
          else if (_selectedBook != null)
            BookDetailsPage(book: _selectedBook)
        ],
        onPopPage: (route, result) {
          if (!route.didPop(result)) {
            return false;
          }

          // Update the list of pages by setting _selectedBook to null
          _selectedBook = null;
          isPageFound = true;
          notifyListeners();

          return true;
        },
      ),
    );
  }
}
