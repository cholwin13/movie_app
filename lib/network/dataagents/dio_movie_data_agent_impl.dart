import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:movie_app_1/data/vos/actor_vo.dart';
import 'package:movie_app_1/data/vos/genre_vo.dart';
import 'package:movie_app_1/network/dataagents/movie_data_agent.dart';

import '../../data/vos/movie_vo.dart';
import '../api_constants.dart';

class DioMovieDataAgentImpl extends MovieDataAgent {
  @override
  Future<List<MovieVO>?>? getNowPlayingMovies(int page) {
    Map<String, String> queryParameters = {
      PARAM_API_KEY: API_KEY,
      PARAM_LANGUAGE: LANGAUAGE,
      PARAM_PAGE: page.toString(),
    };

    var url = Dio().get("$BASE_URL_DIO$ENDPOINT_GET_NOW_PLAYING",
        queryParameters: queryParameters);

    debugPrint("URL =====> ${url}");
    Dio()
        .get("$BASE_URL_DIO$ENDPOINT_GET_NOW_PLAYING",
            queryParameters: queryParameters)
        .then((value) {
      debugPrint("Now Playing Movie ======> ${value.toString()}");
    }).catchError((error) {
      debugPrint("Error ======> ${error.toString()}");
    });
  }

  @override
  Future<List<ActorVO>?>? getActors(int page) {
    // TODO: implement getActors
    throw UnimplementedError();
  }

  @override
  Future<List<GenreVO>?>? getGenres() {
    // TODO: implement getGenres
    throw UnimplementedError();
  }

  @override
  Future<List<MovieVO>?>? getMoviesByGenres(int genreId) {
    // TODO: implement getMoviesByGenres
    throw UnimplementedError();
  }

  @override
  Future<List<MovieVO>?>? getPopularMovies(int page) {
    // TODO: implement getPopularMovies
    throw UnimplementedError();
  }

  @override
  Future<List<MovieVO>?>? getTopRatedMovies(int page) {
    // TODO: implement getTopRatedMovies
    throw UnimplementedError();
  }

  @override
  Future<List<List<ActorVO>?>?>? getCreditsByMovie(int movieId) {
    // TODO: implement getCreditsByMovie
    throw UnimplementedError();
  }

  @override
  Future<MovieVO>? getMovieDetails(int movieId) {
    // TODO: implement getMovieDetails
    throw UnimplementedError();
  }
}
