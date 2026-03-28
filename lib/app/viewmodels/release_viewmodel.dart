import '../models/movie.dart';
import '../services/movie_service.dart';

class ReleasesViewModel {
  final IMovieService _movieService;

  ReleasesViewModel(this._movieService);

  List<Movie> _moviesList = [];
  List<Movie> get moviesList => _moviesList;

  Future<List<Movie>> getUpcomingMovies() async {
    _moviesList = await _movieService.getUpcomingMovies();
    return _moviesList;
  }
}