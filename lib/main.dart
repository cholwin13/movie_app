import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:movie_app_1/data/vos/actor_vo.dart';
import 'package:movie_app_1/data/vos/collection_vo.dart';
import 'package:movie_app_1/data/vos/date_vo.dart';
import 'package:movie_app_1/data/vos/genre_vo.dart';
import 'package:movie_app_1/data/vos/movie_vo.dart';
import 'package:movie_app_1/data/vos/production_company_vo.dart';
import 'package:movie_app_1/data/vos/production_country_vo.dart';
import 'package:movie_app_1/data/vos/spoken_language_vo.dart';
import 'package:movie_app_1/network/dataagents/http_movie_data_agent_impl.dart';
import 'package:movie_app_1/pages/home_page.dart';
import 'package:movie_app_1/persistence/hive_constants.dart';

import 'network/dataagents/dio_movie_data_agent_impl.dart';
import 'network/dataagents/retrofit_data_agent_impl.dart';
import 'pages/movie_detail_page.dart';

void main() async {
  await Hive.initFlutter();

  Hive.registerAdapter(ActorVOAdapter());
  Hive.registerAdapter(CollectionVOAdapter());
  Hive.registerAdapter(DateVOAdapter());
  Hive.registerAdapter(GenreVOAdapter());
  Hive.registerAdapter(MovieVOAdapter());
  Hive.registerAdapter(ProductionCompanyVOAdapter());
  Hive.registerAdapter(ProductionCountryVOAdapter());
  Hive.registerAdapter(SpokenLanguageVOAdapter());

  await Hive.openBox<ActorVO>(BOX_NAME_ACTOR_VO);
  await Hive.openBox<MovieVO>(BOX_NAME_MOVIE_VO);
  await Hive.openBox<GenreVO>(BOX_NAME_GENRE_VO);

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
