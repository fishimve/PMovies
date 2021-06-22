import 'dart:convert';

import 'package:http/http.dart' as http;

import '../models/movie.dart';

class ApiService {
  static const endpoint = 'https://api.themoviedb.org';
  static const api_key = '9f8aa5a7258792f9d0a29d70ee401538';

  static const images_endpoint = 'https://image.tmdb.org/t/p/original/';

  var client = http.Client();

// movie
// https://api.themoviedb.org/3/movie/550?api_key=9f8aa5a7258792f9d0a29d70ee401538

// most popular
// https://api.themoviedb.org/3/discover/movie?api_key=9f8aa5a7258792f9d0a29d70ee401538&sort_by=popularity.desc

// get image
// https://image.tmdb.org/t/p/original/wigZBAmNrIhxp2FNGOROUAeHvdh.jpg


// Future getPosterImage


  Future getAMovieById(int id) async {
    final response = await client.get('$endpoint/3/movie/$id?api_key=$api_key');
    var parsed = await json.decode(response.body);
    var movie = Movie.fromMap(parsed);
    return movie;
  }

  Future getPopularMovies() async {
    List<Movie> movies = [];
    var response = await client.get(
        '$endpoint/3/discover/movie?api_key=$api_key&sort_by=popularity.desc');
    var parsed = json.decode(response.body);
    var moviesArray = parsed['results'];

    for (var movie in moviesArray) {
      var m = Movie.fromMap(movie);
      movies.add(m);
    }

    return movies;
  }
}
