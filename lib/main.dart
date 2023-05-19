import 'package:flutter/material.dart';
import 'package:movie_app_1/network/dataagents/http_movie_data_agent_impl.dart';
import 'package:movie_app_1/pages/home_page.dart';

import 'network/dataagents/dio_movie_data_agent_impl.dart';
import 'network/dataagents/retrofit_data_agent_impl.dart';
import 'pages/movie_detail_page.dart';

void main() {
  //DioMovieDataAgentImpl().getNowPlayingMovies(1);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
      //home: MovieDetailPage(),
    );
  }
}
