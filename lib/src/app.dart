import 'package:flutter/material.dart';

import 'constants.dart';
import 'pages.dart';
import 'routes.dart';
import 'theme.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: APP_NAME,
      theme: appTheme,
      home: HomePage(),
      onGenerateRoute: generateRoute,
    );
  }
}
