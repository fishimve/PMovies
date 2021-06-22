import 'package:flutter/material.dart';

import './ui/views/home.dart';
import './ui/router.dart';
import './services/navigation_service.dart';
import 'locator.dart';

void main() async {
  await setupLocator();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'PMovies',
      debugShowCheckedModeBanner: false,
      navigatorKey: locator<NavigationService>().navigationKey,
      onGenerateRoute: generateRoute,
      theme: ThemeData(
          primarySwatch: Colors.red,
          visualDensity: VisualDensity.adaptivePlatformDensity,
          textTheme: TextTheme(
            headline3: TextStyle(
              color: Colors.white,
              fontSize: 30.0,
              fontWeight: FontWeight.bold,
            ),
            headline4: TextStyle(
              color: Color(0xFF000000).withOpacity(.87),
              fontSize: 20.0,
              fontWeight: FontWeight.w600,
            ),
            headline5: TextStyle(
              color: Color(0xFF000000).withOpacity(.87),
              fontSize: 16.0,
            ),
            headline6: TextStyle(
              color: Color(0xFF000000).withOpacity(.60),
              fontSize: 12.0,
            ),
          )),
      home: HomeView(),
    );
  }
}
