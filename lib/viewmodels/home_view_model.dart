// import '../routes/route_names.dart';

import '../services/api_service.dart';
import '../services/navigation_service.dart';
import '../models/movie.dart';
import '../locator.dart';
import 'base_model.dart';

class HomeViewModel extends BaseModel {
  final _apiService = locator<ApiService>();
  final _navigationService = locator<NavigationService>();

  List<Movie> _popularMovies;
  List<Movie> get popularMovies => _popularMovies;

  Future<Movie> getAMovie(int index) async {
    Movie movie;
    setBusy(true);
    movie = await _apiService.getAMovieById(_popularMovies[index].id);
    setBusy(false);
    return movie;
  }

  void getPopularMovies() async {
    setBusy(true);
    List<Movie> popMovies = await _apiService.getPopularMovies();
    _popularMovies = popMovies;
    setBusy(false);
  }

  Future navigateToMovieView(int index) async {
    await _navigationService.navigateTo(
      'MovieView',
      arguments: _popularMovies[index],
    );
  }
}
