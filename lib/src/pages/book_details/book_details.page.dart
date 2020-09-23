import 'package:flutter/material.dart';

import '../../models.dart';
import '../../services.dart';
import 'book_details.dart';

class BookDetailsPage extends StatefulWidget {
  final int id;

  BookDetailsPage(this.id);

  @override
  _BookDetailsPageState createState() => _BookDetailsPageState();
}

class _BookDetailsPageState extends State<BookDetailsPage> {
  Book book;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.5,
        title: Text('Book Details'),
      ),
      body: FutureBuilder<Book>(
        future: BookService.instance.getOne(widget.id),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done && !snapshot.hasError) {
            return BookDetails(book: snapshot.data);
          }

          if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error?.toString() ?? "Error loading book details"}'));
          }

          return Center(child: CircularProgressIndicator(backgroundColor: Colors.blue));
        },
      ),
    );
  }
}
