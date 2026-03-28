import 'package:cinetracker/app/viewmodels/search_movies_viewmodel.dart';
import 'package:cinetracker/ui/widgets/movie_card.dart';
import 'package:flutter/material.dart';

import 'movie_details.dart';

class SearchMovies extends StatefulWidget {
  SearchMovies({super.key});

  @override
  State<SearchMovies> createState() => _SearchMoviesState();
}

class _SearchMoviesState extends State<SearchMovies> {
  final SearchMoviesViewmodel viewmodel = SearchMoviesViewmodel();
  final TextEditingController textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: viewmodel.getMovie(textController.text),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return CustomScrollView(
              slivers: [
                SliverToBoxAdapter(child: Image.asset("assets/movie.png", height: 180, width: 180)),
                SliverToBoxAdapter(
                    child: Center(
                      child: Padding(
                        padding: const EdgeInsets.only(top: 18, bottom: 18),
                        child: Text(
                          "Filmes populares",
                          style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.w700),
                        ),
                      ),
                    )
                ),
                SliverToBoxAdapter(
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: 32),
                      child: TextField(
                        controller: textController,
                        onEditingComplete: () {
                          FocusScope.of(context).unfocus();
                          setState(() {});
                        },
                        decoration: InputDecoration(
                          hintText: "Pesquisar",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(18),
                          ),
                        ),
                      ),
                    )),
                SliverList.builder(
                    itemBuilder:  (context, index) => InkWell(
                      onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => MovieDetails(movie: viewmodel.moviesList[index]))),
                      child: Padding(
                        padding: const EdgeInsets.only(bottom: 32),
                        child: MovieCard(movie: viewmodel.moviesList[index]),
                      ),
                    ), itemCount: viewmodel.moviesList.length)
              ]
          );;
        } else {
          return Center(child: CircularProgressIndicator());
        }
      }
    );
  }
}
