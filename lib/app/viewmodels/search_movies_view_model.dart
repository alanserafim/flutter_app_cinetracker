import '../Services/search_movies_service.dart';
import '../models/movie.dart';

class SearchMoviesViewmodel {
  List<Movie> _moviesList = <Movie>[];

  Future<List<Movie>> getPopularMovies() async {
    final SearchMoviesService service = SearchPopularMoviesService();
    _moviesList = await service.getMovies();
    return _moviesList;
  }

  Future<List<Movie>> getMovie(String query) async {
    if (query.isEmpty) {
      _moviesList = await getPopularMovies();
    } else {
      final SearchMoviesService service = SearchForMovieService(query: query);
      _moviesList = await service.getMovies();
    }

    return _moviesList;
  }

  List<Movie> get moviesList => _moviesList;
}
