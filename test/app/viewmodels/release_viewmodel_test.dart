import 'package:cinetracker/app/models/movie.dart';
import 'package:cinetracker/app/services/movie_service.dart';
import 'package:cinetracker/app/viewmodels/release_viewmodel.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockMovieService extends Mock implements IMovieService {}

void main() {
  late ReleasesViewModel viewModel;
  late MockMovieService mockMovieService;

  final tMovie = Movie(
    id: 1,
    title: 'Filme Teste',
    imageUrl: '/teste.jpg',
    releaseDate: '2026-03-28',
    overview: 'Descrição teste',
  );
  final tMoviesList = [tMovie];

  setUp(() {
    mockMovieService = MockMovieService();
    viewModel = ReleasesViewModel(mockMovieService);
  });

  test('Deve buscar filmes em lançamento e preencher a lista moviesList', () async {
    when(() => mockMovieService.getUpcomingMovies())
        .thenAnswer((_) async => tMoviesList);

    final result = await viewModel.getUpcomingMovies();

    expect(result, tMoviesList);
    expect(viewModel.moviesList, tMoviesList);
    verify(() => mockMovieService.getUpcomingMovies()).called(1);
  });

  test('Deve retornar uma lista vazia caso não existam lançamentos (ou ocorra um erro na API)', () async {
    when(() => mockMovieService.getUpcomingMovies())
        .thenAnswer((_) async => <Movie>[]);

    final result = await viewModel.getUpcomingMovies();

    expect(result, isEmpty); // Garante que o retorno é uma lista vazia
    expect(viewModel.moviesList, isEmpty); // Garante que o estado interno também está vazio

    verify(() => mockMovieService.getUpcomingMovies()).called(1);
  });
}