import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;
import '../services/movie_service.dart';
import '../viewmodels/release_viewmodel.dart';
import '../viewmodels/search_movies_viewmodel.dart';

final getIt = GetIt.instance;

void setupLocator() {
  getIt.registerLazySingleton<http.Client>(
          () => http.Client());
  getIt.registerLazySingleton<IMovieService>(
          () => MovieService(getIt()));
  getIt.registerFactory<ReleasesViewModel>(
          () => ReleasesViewModel(getIt()));
  getIt.registerFactory<SearchMoviesViewModel>(
          () => SearchMoviesViewModel(getIt()));
}