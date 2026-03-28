import '../models/movie.dart';

abstract class SearchMoviesService {
  Future<List<Movie>> getMovies();
}
