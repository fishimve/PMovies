import 'package:flutter/material.dart';

import '../models/movie.dart';
import '../ui/views/movie_view.dart';

PageRoute _getPageRoute({String routeName, Widget viewToShow}) {
  return MaterialPageRoute(
    settings: RouteSettings(
      name: routeName,
    ),
    builder: (_) => viewToShow,
  );
}

Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case 'MovieView':
      var movie = settings.arguments as Movie;
      return _getPageRoute(
        routeName: settings.name,
        viewToShow: MovieView(movie: movie),
      );

    default:
      return MaterialPageRoute(
        builder: (_) => Scaffold(
          body: Center(
            child: Text('No route defined for ${settings.name}'),
          ),
        ),
      );
  }
}
