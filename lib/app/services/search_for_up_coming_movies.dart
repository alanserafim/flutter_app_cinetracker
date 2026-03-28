import 'dart:convert';
import 'package:cinetracker/app/services/search_movies_service.dart';
import 'package:http/http.dart' as http;
import '../helpers/consts.dart';
import '../models/movie.dart';

class SearchForUpcomingMovies implements SearchMoviesService {
  final List<Movie> movieList = <Movie>[];

  @override
  Future<List<Movie>> getMovies() async{
    try {
      final response = await http.get(Uri.parse(upcomingUrl), headers: requestHeader);
      if (response.statusCode == 200) {
        for (dynamic movie in jsonDecode(response.body)["results"]) {
          movieList.add(Movie.fromMap(movie));
        }
        return movieList;
      } else {
        throw Exception(response.body);
      }
    } catch (e) {
      print(e);
      return movieList;
    }
  }
}