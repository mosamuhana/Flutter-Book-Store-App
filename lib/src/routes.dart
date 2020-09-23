import 'package:flutter/material.dart';

import 'pages.dart';

const HOME_ROUTE = '/home';
const BOOK_DETAILS_ROUTE = '/book_details';

Route<dynamic> generateRoute(RouteSettings settings) {
  print('Route: ${settings.name}');
  switch (settings.name) {
    case HOME_ROUTE:
      return _getHomeRoute(settings);
    case BOOK_DETAILS_ROUTE:
      return _getBookDetailsRoute(settings);
  }

  return _getNotFoundRoute(settings);
}

MaterialPageRoute _getNotFoundRoute(RouteSettings settings) {
  return MaterialPageRoute(settings: settings, builder: (context) => NotfoundPage());
}

MaterialPageRoute _getHomeRoute(RouteSettings settings) {
  return MaterialPageRoute(settings: settings, builder: (context) => HomePage());
}

MaterialPageRoute _getBookDetailsRoute(RouteSettings settings) {
  final id = settings.arguments as int;
  return MaterialPageRoute(
    settings: settings,
    builder: (context) => BookDetailsPage(id),
  );
}

/*
// https://flutter.dev/docs/cookbook/navigation/navigate-with-arguments
final ScreenArguments args = ModalRoute.of(context).settings.arguments;
*/
