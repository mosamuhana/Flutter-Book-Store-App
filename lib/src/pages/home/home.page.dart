import 'package:flutter/material.dart';

import '../../constants.dart';
import '../../models.dart';
import '../../routes.dart';
import '../../services.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<_MenuData> _menuItems = const <_MenuData>[
    const _MenuData(id: 1, title: 'Two Columns', data: 2),
    const _MenuData(id: 2, title: 'Three Columns', data: 3),
  ];

  int columns = 3;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.5,
        title: Text(APP_NAME),
        leading: IconButton(
          icon: Icon(Icons.menu),
          onPressed: () {},
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {},
          ),
          PopupMenuButton<_MenuData>(
            onSelected: _onMenuSelect,
            itemBuilder: (_) {
              return _menuItems.map((_MenuData item) {
                return PopupMenuItem<_MenuData>(value: item, child: Text(item.title));
              }).toList();
            },
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        mini: true,
        child: Icon(Icons.refresh),
        onPressed: () => setState(() {}),
      ),
      body: FutureBuilder<List<Book>>(
        future: BookService.instance.getAll(),
        builder: (context, snapshot) {
          if (snapshot.connectionState != ConnectionState.done) {
            return Center(child: CircularProgressIndicator());
          }
          if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error.toString()}'));
          }
          return _buildGrid(context, snapshot.data);
        },
      ),
    );
  }

  Widget _buildGrid(BuildContext context, List<Book> books) {
    return CustomScrollView(
      primary: false,
      slivers: [
        SliverPadding(
          padding: EdgeInsets.all(16),
          sliver: SliverGrid.count(
            childAspectRatio: 2 / 3,
            crossAxisCount: columns,
            mainAxisSpacing: 10,
            crossAxisSpacing: 10,
            children: books.map((book) => _createTile(context, book)).toList(),
          ),
        )
      ],
    );
  }

  Widget _createTile(BuildContext context, Book book) {
    return Hero(
      tag: '${book.id}',
      child: Material(
        elevation: 15,
        shadowColor: Colors.yellow.shade900,
        child: InkWell(
          onTap: () => Navigator.pushNamed(context, BOOK_DETAILS_ROUTE, arguments: book.id),
          child: Image(
            image: AssetImage(book.image),
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }

  void _onMenuSelect(_MenuData data) {
    int c = columns;
    if (data.id == 1) {
      c = 2;
    } else if (data.id == 2) {
      c = 3;
    }
    if (c != columns) {
      setState(() => columns = c);
    }
  }
}

class _MenuData {
  final int id;
  final String title;
  final dynamic data;

  const _MenuData({this.id, this.title, this.data});
}
