import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:movies/widgets/widgets.dart';
import 'package:movies/search/search_delegate.dart';
import 'package:movies/providers/movies_provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final moviesProvider = Provider.of<MoviesProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Movies'),
        actions: [
          IconButton(
            icon: const Icon(Icons.search_outlined),
            onPressed: () =>
                showSearch(context: context, delegate: MovieSearchDelegate()),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            CardSwiper(movies: moviesProvider.movies),
            MovieSlider(
              onNextPage: () => moviesProvider.getPopularMovies(),
              movies: moviesProvider.popularMovies,
              title: 'Popular Movies',
            ),
          ],
        ),
      ),
    );
  }
}
