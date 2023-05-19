import 'package:flutter/material.dart';
import 'package:movie_app_1/data/vos/actor_vo.dart';
import 'package:movie_app_1/data/vos/genre_vo.dart';
import 'package:movie_app_1/data/vos/movie_vo.dart';
import 'package:movie_app_1/network/api_constants.dart';
import 'package:movie_app_1/network/dataagents/movie_data_agent.dart';
import 'package:http/http.dart' as http;

class HttpMovieDataAgentImpl extends MovieDataAgent {
  @override
  Future<List<MovieVO>?>? getNowPlayingMovies(int page) {
    debugPrint("It is get Now plaing movie fun");
    Map<String, String> queryParameters = {
      PARAM_API_KEY: API_KEY,
      PARAM_LANGUAGE: LANGAUAGE,
      PARAM_PAGE: page.toString(),
    };

    var url = Uri.https(BASE_URL, ENDPOINT_GET_NOW_PLAYING, queryParameters);

    debugPrint("URL is ====> ${url}");

    http.get(url).then((value) {
      debugPrint("Now Playing Movie ======> ${value.body.toString()}");
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
