import 'dart:convert';
import 'package:cinetracker/app/services/search_movies_service.dart';
import 'package:http/http.dart' as http;
import '../helpers/consts.dart';
import '../models/movie.dart';

class SearchForMovieService implements SearchMoviesService {
  List<Movie> movies = <Movie>[];
  final String query;
  SearchForMovieService({ required this.query });

  @override
  Future<List<Movie>> getMovies() async {
    try {
      final response = await http.get(
          Uri.parse(movieUrlPrefix + query + movieUrlFilterSulfix),
          headers:  requestHeader
      );
      if (response.statusCode == 200) {
        for (dynamic movie in json.decode(response.body)['results']) {
          movies.add(Movie.fromMap(movie));
        }
      } else {
        throw Exception(response.body);
      }
      return movies;
    } catch (e) {
      print(e);
      return movies;
    }
  }
}