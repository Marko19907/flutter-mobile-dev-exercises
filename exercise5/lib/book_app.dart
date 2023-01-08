import 'package:exercise_e5/infrastructure/book_repository.dart';
import 'package:flutter/material.dart';

import 'infrastructure/book.dart';

/// An app showing books from a library (imaginary database)
class BookApp extends StatelessWidget {
  Stream<List<Book>> getBookStream() {
    return BookRepository.getInstance().fetchAllBooksAsAList();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(title: Text("Book app")),
        body: Padding(
          padding: const EdgeInsets.all(16),
          child: StreamBuilder<List<Book>>(
            stream: getBookStream(),
            builder: ((context, snapshot) {
              if (!snapshot.hasData) {
                return Center(child: CircularProgressIndicator());
              }

              return Column(
                children: snapshot.data!
                    .map<Widget>((book) => BookItem(book))
                    .toList(),
              );
            }),
          ),
        ),
      ),
    );
  }
}

/// A widget displaying a book as an item in a list
class BookItem extends StatelessWidget {
  final Book book;

  BookItem(this.book);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Center(child: Text(book.title)),
      ),
    );
  }
}
