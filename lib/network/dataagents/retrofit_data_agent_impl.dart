import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:movie_app_1/network/api_constants.dart';
import 'package:movie_app_1/network/dataagents/movie_data_agent.dart';
import 'package:movie_app_1/network/the_movie_api.dart';

import '../../data/vos/movie_vo.dart';
import '../../data/vos/genre_vo.dart';
import '../../data/vos/actor_vo.dart';

class RetorfitDataAgentImpl extends MovieDataAgent {
  TheMovieApi? mApi;

  static RetorfitDataAgentImpl _singleton = RetorfitDataAgentImpl.internal();

  factory RetorfitDataAgentImpl() {
    return _singleton;
  }

  RetorfitDataAgentImpl.internal() {
    final dio = Dio();
    mApi = TheMovieApi(dio);
  }

  @override
  Future<List<MovieVO>?>? getNowPlayingMovies(int page) {
    debugPrint("It is get Now plaing movie fun");
    return mApi
        ?.getNowPlayingMovies(API_KEY, LANGAUAGE, page.toString())
        .asStream()
        .map((response) => response.results)
        .first;
  }

  @override
  Future<List<MovieVO>?>? getPopularMovies(int page) {
    return mApi
        ?.getPopularMovie(API_KEY, LANGAUAGE, page.toString())
        .asStream()
        .map((response) => response.results)
        .first;
  }

  @override
  Future<List<MovieVO>?>? getTopRatedMovies(int page) {
    return mApi
        ?.getTopRatedMovies(API_KEY, LANGAUAGE, page.toString())
        .asStream()
        .map((response) => response.results)
        .first;
  }

  @override
  Future<List<GenreVO>?>? getGenres() {
    return mApi
        ?.getGenres(API_KEY, LANGAUAGE)
        .asStream()
        .map((response) => response.genres)
        .first;
  }

  @override
  Future<List<MovieVO>?>? getMoviesByGenres(int genreId) {
    return mApi
        ?.getMoviesByGenre(genreId.toString(), API_KEY, LANGAUAGE)
        .asStream()
        .map((response) => response.results)
        .first;
  }

  @override
  Future<List<ActorVO>?>? getActors(int page) {
    return mApi
        ?.getActors(API_KEY, LANGAUAGE, page.toString())
        .asStream()
        .map((response) => response.results)
        .first;
  }

  @override
  Future<List<List<ActorVO>?>?>? getCreditsByMovie(int movieId) {
    return mApi
        ?.getCreditsByMovie(movieId.toString(), API_KEY)
        .asStream()
        .map((getCreditsByMovieResponse) =>
            [getCreditsByMovieResponse.cast, getCreditsByMovieResponse.crew])
        .first;
  }

  @override
  Future<MovieVO?>? getMovieDetails(int movieId) {
    return mApi?.getMovieDetails(movieId.toString(), API_KEY);
  }
}
