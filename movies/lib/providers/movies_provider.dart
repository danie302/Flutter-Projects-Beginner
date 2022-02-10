import 'dart:async';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'package:movies/models/models.dart';

import '../helpers/debouncer.dart';

class MoviesProvider extends ChangeNotifier {
  final String _language = 'en-US';
  final String _baseUrl = 'api.themoviedb.org';
  final String _apiKey = 'f8ffe5eeac43b3c4aa76534446016c19';

  final StreamController<List<Movie>> _suggestionStreamController =
      StreamController.broadcast();
  Stream<List<Movie>> get suggestionStream =>
      _suggestionStreamController.stream;

  final debouncer = Debouncer(
    duration: const Duration(milliseconds: 500),
  );

  List<Movie> movies = [];
  List<Movie> popularMovies = [];

  int _popularPage = 0;

  Map<int, List<Cast>> moviesCast = {};

  SearchMovieResponse? _search;
  String? _lastQuery;

  MoviesProvider() {
    getOnDisplayMovies();
    getPopularMovies();
  }

  _getData(String endpoint, {int page = 1, String query = ''}) async {
    final Uri url = Uri.https(_baseUrl, endpoint, {
      'api_key': _apiKey,
      'language': _language,
      'page': '$page',
      'query': query,
    });

    final http.Response response = await http.get(url);

    return response.body;
  }

  getOnDisplayMovies() async {
    final jsonData = await _getData('3/movie/now_playing');
    final NowPlayingResponse data = NowPlayingResponse.fromRawJson(jsonData);

    movies = [...data.results];

    notifyListeners();
  }

  getPopularMovies() async {
    _popularPage += 1;
    final jsonData = await _getData('3/movie/popular', page: _popularPage);
    final PopularResponse data = PopularResponse.fromRawJson(jsonData);

    popularMovies = [...popularMovies, ...data.results];

    notifyListeners();
  }

  Future<List<Cast>> getMovieCast(int movieId) async {
    if (moviesCast.containsKey(movieId)) return moviesCast[movieId]!;

    final jsonData = await _getData('3/movie/$movieId/credits');
    final CreditsResponse data = CreditsResponse.fromRawJson(jsonData);
    moviesCast[movieId] = data.cast;
    return data.cast;
  }

  Future<List<Movie>> searchMovies(String query) async {
    if (_search != null && _lastQuery == query) return _search!.results;

    final jsonData = await _getData('3/search/movie', query: query);
    final SearchMovieResponse data = SearchMovieResponse.fromRawJson(jsonData);
    _search = data;
    _lastQuery = query;
    return data.results;
  }

  void getSuggestions(String query) {
    debouncer.value = '';
    debouncer.onValue = (value) async {
      final suggestions = await searchMovies(value);
      _suggestionStreamController.sink.add(suggestions);
    };
    debouncer.value = query;
  }
}
