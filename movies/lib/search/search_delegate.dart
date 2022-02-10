import 'package:flutter/material.dart';
import 'package:movies/models/models.dart';
import 'package:movies/providers/movies_provider.dart';
import 'package:provider/provider.dart';

class MovieSearchDelegate extends SearchDelegate {
  @override
  String? get searchFieldLabel => 'Search Movies';

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        icon: const Icon(Icons.clear),
        onPressed: () {
          query = '';
        },
      ),
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      onPressed: () => close(context, null),
      icon: const Icon(Icons.arrow_back),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return const Text('Results');
  }

  Widget _emptyContainer() {
    return const Center(
      child: Icon(
        Icons.movie_creation_outlined,
        color: Colors.black38,
        size: 200,
      ),
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    if (query.isEmpty) {
      return const Center(
        child: Icon(
          Icons.movie_creation_outlined,
          color: Colors.black38,
          size: 200,
        ),
      );
    }

    final MoviesProvider moviesProvider =
        Provider.of<MoviesProvider>(context, listen: false);
    moviesProvider.getSuggestions(query);

    return StreamBuilder(
      stream: moviesProvider.suggestionStream,
      builder: (_, AsyncSnapshot<List<Movie>> snapshot) {
        if (!snapshot.hasData) return _emptyContainer();
        final movies = snapshot.data!;
        return ListView.builder(
          itemCount: movies.length,
          itemBuilder: (_, index) => MovieItem(movie: movies[index]),
        );
      },
    );
  }
}

class MovieItem extends StatelessWidget {
  final Movie movie;
  const MovieItem({Key? key, required this.movie}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    movie.heroId = '${movie.id}-search-movie-item';
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 5),
      child: ListTile(
        leading: Hero(
          tag: movie.heroId!,
          child: FadeInImage(
            image: NetworkImage(movie.fullPosterImageUrl),
            placeholder: const AssetImage('assets/no-image.jpg'),
            fit: BoxFit.contain,
            width: 60,
          ),
        ),
        title: Text(movie.title),
        subtitle: Text('Release: ${movie.releaseDate}'),
        onTap: () {
          Navigator.of(context).pushNamed(
            'details',
            arguments: movie,
          );
        },
      ),
    );
  }
}
