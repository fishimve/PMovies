import 'package:flutter/widgets.dart';

// get image
// https://image.tmdb.org/t/p/original/wigZBAmNrIhxp2FNGOROUAeHvdh.jpg

const images_endpoint = 'https://image.tmdb.org/t/p';

class Movie {
  final String title;
  final num voteAverage;
  final num voteCount;
  final num revenue;
  final num popularity;
  final String overview;
  final String originalLanguage;
  final num id;
  final num budget;
  final String homepage;
  final bool adult;
  final String tagline;
  final String backdropPath;
  final String posterPath;
  final List<Genre> genres;
  Movie({
    @required this.title,
    @required this.voteAverage,
    @required this.voteCount,
    @required this.revenue,
    @required this.popularity,
    @required this.overview,
    @required this.originalLanguage,
    @required this.id,
    @required this.budget,
    @required this.homepage,
    @required this.adult,
    @required this.tagline,
    @required this.backdropPath,
    @required this.posterPath,
    @required this.genres,
  });

  static Movie fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return Movie(
      title: map.containsKey('title') ? map['title'] : null,
      voteAverage: map.containsKey('vote_average') ? map['vote_average'] : null,
      voteCount: map.containsKey('vote_count') ? map['vote_count'] : null,
      revenue: map.containsKey('revenue') ? map['revenue'] : null,
      popularity: map.containsKey('popularity') ? map['popularity'] : null,
      overview: map.containsKey('overview') ? map['overview'] : null,
      originalLanguage: map.containsKey('original_language')
          ? map['original_language']
          : null,
      id: map.containsKey('id') ? map['id'] : null,
      budget: map.containsKey('budget') ? map['budget'] : null,
      homepage: map.containsKey('homepage') ? map['homepage'] : null,
      adult: map.containsKey('adult') ? map['adult'] : false,
      tagline: map.containsKey('tagline') ? map['tagline'] : null,
      backdropPath: map.containsKey('backdrop_path')
          ? '$images_endpoint/w342${map['backdrop_path']}'
          : null,
      posterPath: map.containsKey('poster_path')
          ? '$images_endpoint/w92${map['poster_path']}'
          : null,
      genres: map.containsKey('genres')
          ? map['genres'].map<Genre>((g) => Genre.fromMap(g)).toList()
          : [],
    );
  }
}

class Genre {
  final num id;
  final String name;

  Genre(this.id, this.name);

  static Genre fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return Genre(
      map.containsKey('id') ? map['id'] : null,
      map.containsKey('name') ? map['name'] : null,
    );
  }
}
