import 'package:cinetracker/app/models/movie.dart';
import 'package:cinetracker/app/services/movie_service.dart';
import 'package:cinetracker/app/viewmodels/search_movies_viewmodel.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockMovieService extends Mock implements IMovieService {}

void main() {
  late SearchMoviesViewModel viewModel;
  late MockMovieService mockMovieService;

  final tMoviePop = Movie(
    id: 1,
    title: 'Popular',
    imageUrl: '/pop.jpg',
    releaseDate: '2026',
    overview: '...',
  );
  final tMovieSearch = Movie(
    id: 2,
    title: 'Batman',
    imageUrl: '/bat.jpg',
    releaseDate: '2026',
    overview: '...',
  );

  final tPopularList = [tMoviePop];
  final tSearchList = [tMovieSearch];

  setUp(() {
    mockMovieService = MockMovieService();
    viewModel = SearchMoviesViewModel(mockMovieService);
  });

  test(
    'Deve buscar filmes POPULARES quando a query for uma string vazia',
    () async {
      when(
        () => mockMovieService.getPopularMovies(),
      ).thenAnswer((_) async => tPopularList);

      final result = await viewModel.getMovie('');

      expect(result, tPopularList);
      expect(viewModel.moviesList, tPopularList);
      verify(() => mockMovieService.getPopularMovies()).called(1);
      verifyNever(
        () => mockMovieService.searchMovies(any()),
      );
    },
  );

  test('Deve buscar filmes ESPECÍFICOS quando a query conter texto', () async {
    final query = 'Batman';
    when(
      () => mockMovieService.searchMovies(query),
    ).thenAnswer((_) async => tSearchList);

    final result = await viewModel.getMovie(query);

    expect(result, tSearchList);
    expect(viewModel.moviesList, tSearchList);
    verify(() => mockMovieService.searchMovies(query)).called(1);
    verifyNever(
      () => mockMovieService.getPopularMovies(),
    ); // Garante que a busca por populares NÃO foi chamada
  });

  test('Deve retornar uma lista vazia quando a busca por texto não encontrar nenhum filme', () async {
    final query = 'FilmeQueNaoExiste123456';
    when(() => mockMovieService.searchMovies(query)).thenAnswer((_) async => <Movie>[]);

    final result = await viewModel.getMovie(query);

    expect(result, isEmpty);
    expect(viewModel.moviesList, isEmpty);

    verify(() => mockMovieService.searchMovies(query)).called(1);
    verifyNever(() => mockMovieService.getPopularMovies());
  });
}
