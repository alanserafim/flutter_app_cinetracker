import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

import '../../app/viewmodels/release_viewmodel.dart';
import '../widgets/movie_card.dart';
import 'movie_details.dart';

class Releases extends StatefulWidget {
  Releases({super.key});

  @override
  State<Releases> createState() => _ReleasesState();
}

class _ReleasesState extends State<Releases> {
  final ReleasesViewModel viewmodel = GetIt.I<ReleasesViewModel>();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: viewmodel.getUpcomingMovies(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return CustomScrollView(
            slivers: <Widget>[
              SliverToBoxAdapter(
                child: Image.asset(
                  "assets/upcoming.png",
                  width: 80,
                  height: 80,
                ),
              ),
              const SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 40),
                  child: Text(
                    "Próximos Lançamentos",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.w700),
                  ),
                ),
              ),
              SliverList.builder(
                itemBuilder: (context, index) => Padding(
                  padding: const EdgeInsets.only(bottom: 32),
                  child: InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => MovieDetails(
                                  movie: viewmodel.moviesList[index],
                                )));
                      },
                      child: MovieCard(movie: viewmodel.moviesList[index])),
                ),
                itemCount: viewmodel.moviesList.length,
              ),
            ],
          );
        } else {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }
}