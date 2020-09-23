import 'package:flutter/material.dart';

import '../../models.dart';
import '../../widgets.dart';

class BookDetails extends StatelessWidget {
  final Book book;

  BookDetails({this.book});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          //color: Theme.of(context).scaffoldBackgroundColor,
          padding: EdgeInsets.all(16),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Flexible(flex: 2, child: _topLeft),
              Flexible(flex: 3, child: _topRight),
            ],
          ),
        ),
        Container(
          height: 220,
          child: SingleChildScrollView(
            padding: EdgeInsets.all(16),
            child: Text(
              book.description,
              style: TextStyle(fontSize: 13, height: 1.5),
            ),
          ),
        ),
      ],
    );
  }

  Widget get _topLeft {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.only(bottom: 16, right: 16),
          child: Hero(
            tag: '${book.id}',
            child: Material(
              elevation: 15,
              shadowColor: Colors.yellow.shade900,
              child: Image(
                image: AssetImage(book.image),
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
        _buildText(
          '${book.pages} pages',
          color: Colors.black38,
          fontSize: 12,
        )
      ],
    );
  }

  Widget get _topRight {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildText(
          book.title,
          fontSize: 16,
          bold: true,
          padding: EdgeInsets.only(top: 16),
        ),
        _buildText(
          'by ${book.writer}',
          color: Colors.black54,
          fontSize: 12,
          padding: EdgeInsets.only(top: 8, bottom: 16),
        ),
        Row(
          children: [
            _buildText(
              '\$ ${book.price.toStringAsFixed(2)}',
              bold: true,
              padding: EdgeInsets.only(right: 8),
            ),
            RatingBar(value: book.rating)
          ],
        ),
        SizedBox(height: 32),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            RaisedButton(
              child: Text('BUY NOW'),
              color: Colors.blueAccent,
              onPressed: () {},
            ),
          ],
        ),
        /*
        Material(
          borderRadius: BorderRadius.circular(20),
          shadowColor: Colors.blue.shade200,
          elevation: 5,
          child: MaterialButton(
            onPressed: () {},
            minWidth: 160,
            color: Colors.blue,
            child: _buildText(
              'BUY NOW',
              color: Colors.white,
              fontSize: 13,
            ),
          ),
        ),
        */
      ],
    );
  }

  Widget _buildText(
    String data, {
    Color color = Colors.black87,
    double fontSize = 14,
    EdgeInsetsGeometry padding = EdgeInsets.zero,
    bool bold = false,
  }) {
    return Padding(
      padding: padding,
      child: Text(
        data,
        style: TextStyle(
          color: color,
          fontSize: fontSize,
          fontWeight: bold ? FontWeight.bold : FontWeight.normal,
        ),
      ),
    );
  }
}
