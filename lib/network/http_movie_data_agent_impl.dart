import 'package:flutter/material.dart';
import 'package:movie_app_1/network/api_constants.dart';
import 'package:movie_app_1/network/movie_data_agent.dart';
import 'package:http/http.dart' as http;

class HttpMovieDataAgentImpl extends MovieDataAgent {
  @override
  void getNowPlayingMovie(int page) {
    debugPrint("It is get Now plaing movie fun");
    Map<String, String> queryParameters = {
      PARAM_API_KEY: API_KEY,
      PARAM_LANGUAGE: LANGAUAGE,
      PARAM_PAGE: page.toString(),
    };

    var url = Uri.https(BASE_URL, ENDPOINT_GET_NOW_PLAYING, queryParameters);

    debugPrint("URL is ====> ${url}");
    try {
      debugPrint("try ======> ()}");

      http.post(url, headers: {"Accept": "application/json"}).then((value) {
        debugPrint("Now Playing Movie ======> ${value.body.toString()}");
      }).catchError((error) {
        debugPrint("Error ======> ${error.toString()}");
      });
    } catch (error) {
      debugPrint("Error ======> ${error.toString()}");
    }
  }
}
