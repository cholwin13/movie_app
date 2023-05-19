import 'package:flutter/cupertino.dart';
import 'package:movie_app_1/data/model/movie_model.dart';
import 'package:movie_app_1/data/vos/actor_vo.dart';
import 'package:movie_app_1/data/vos/genre_vo.dart';
import 'package:movie_app_1/data/vos/movie_vo.dart';
import 'package:movie_app_1/network/dataagents/movie_data_agent.dart';
import 'package:movie_app_1/network/dataagents/retrofit_data_agent_impl.dart';

class MovieModalImpl extends MovieModal {
  static final MovieModalImpl _singleton = MovieModalImpl._internal();

  factory MovieModalImpl() {
    return _singleton;
  }

  MovieModalImpl._internal();

  MovieDataAgent _dataAgent = RetorfitDataAgentImpl();

  @override
  Future<List<MovieVO>?>? getNowPlayingMovies() {
    return _dataAgent.getNowPlayingMovies(1);
  }

  @override
  Future<List<MovieVO>?>? getPopularMovies() {
    return _dataAgent.getPopularMovies(1);
  }

  @override
  Future<List<MovieVO>?>? getTopRatedMovies() {
    return _dataAgent.getTopRatedMovies(1);
  }

  @override
  Future<List<ActorVO>?>? getActors(int page) {
    return _dataAgent.getActors(1);
  }

  @override
  Future<List<GenreVO>?>? getGenres() {
    return _dataAgent.getGenres();
  }

  @override
  Future<List<MovieVO>?>? getMoviesByGenre(int genreId) {
    return _dataAgent.getMoviesByGenres(genreId);
  }

  @override
  Future<List<List<ActorVO>?>?>? getCreditsByMovie(int movieId) {
    return _dataAgent.getCreditsByMovie(movieId);
  }

  @override
  Future<MovieVO>? getMovieDetails(int movieId) {
    return getMovieDetails(movieId);
  }
}
