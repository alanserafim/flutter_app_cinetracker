import 'dart:convert';
import 'package:http/http.dart' as http;
import '../helpers/consts.dart';
import '../models/movie.dart';

abstract class IMovieService {
  Future<List<Movie>> getPopularMovies();
  Future<List<Movie>> searchMovies(String query);
  Future<List<Movie>> getUpcomingMovies();
}

class MovieService implements IMovieService {
  final http.Client client;

  MovieService(this.client);

  @override
  Future<List<Movie>> getPopularMovies() async {
    return await _fetchMovies(popularMoviesUrl);
  }

  @override
  Future<List<Movie>> searchMovies(String query) async {
    List<Movie> movies = await _fetchMovies(movieUrlPrefix + query + movieUrlFilterSulfix);
    return movies;
  }

  @override
  Future<List<Movie>> getUpcomingMovies() async {
    return await _fetchMovies(upcomingUrl);
  }

  Future<List<Movie>> _fetchMovies(String url) async {
    try {
      final response = await client.get(Uri.parse(url), headers: requestHeader);
      if (response.statusCode == 200) {
        final List<dynamic> results = json.decode(response.body)['results'];
        return results.map((movie) => Movie.fromMap(movie)).toList();
      } else {
        throw Exception("Erro ao buscar filmes: ${response.statusCode}");
      }
    } catch (e) {
      print(e);
      return [];
    }
  }
}