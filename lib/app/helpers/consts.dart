import '../api_key.dart';

const popularMoviesUrl = "https://api.themoviedb.org/3/movie/popular?language=pt-BR&page=1";
const String imageUrlPrefix = "https://image.tmdb.org/t/p/w500";
const String movieUrlPrefix = "https://api.themoviedb.org/3/search/movie?query=";
const String movieUrlFilterSulfix = "&include_adult=false&language=pt-BR&page=1";
const String upcomingUrl = "https://api.themoviedb.org/3/movie/upcoming?language=pt-BR&region=BR&page=1";

const requestHeader = {
  'accept': 'application/json',
  'Authorization': 'Bearer $apiToken',
};


