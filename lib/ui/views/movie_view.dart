import 'package:PMovies/ui/widgets/backdrop_widget.dart';
import 'package:flutter/material.dart';

import '../../models/movie.dart';

class MovieView extends StatelessWidget {
  final Movie movie;
  const MovieView({Key key, this.movie}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFEDEEF0),
      appBar: AppBar(
        title: Text(movie.title),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(10),
        child: Container(
          color: Colors.white,
          padding: const EdgeInsets.all(10),
          child: Column(
            children: [
              SizedBox(height: 5),
              BackdropWidget(
                title: movie.title,
                imageUrl: movie.backdropPath,
              ),
              SizedBox(height: 15),
              Text(
                movie.overview,
                style: Theme.of(context).textTheme.headline5,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
