import '../models/movie.dart';
import '../services/movie_service.dart';

class SearchMoviesViewModel {
  final IMovieService _movieService;

  SearchMoviesViewModel(this._movieService);

  List<Movie> _moviesList = <Movie>[];
  List<Movie> get moviesList => _moviesList;

  Future<List<Movie>> getMovie(String query) async {
    if (query.isEmpty) {
      _moviesList = await _movieService.getPopularMovies();
    } else {
      _moviesList = await _movieService.searchMovies(query);
    }
    return _moviesList;
  }
}
