import 'package:flutter/cupertino.dart';
import 'package:movie_app_1/data/model/movie_model.dart';
import 'package:movie_app_1/data/vos/actor_vo.dart';
import 'package:movie_app_1/data/vos/genre_vo.dart';
import 'package:movie_app_1/data/vos/movie_vo.dart';
import 'package:movie_app_1/network/dataagents/movie_data_agent.dart';
import 'package:movie_app_1/network/dataagents/retrofit_data_agent_impl.dart';
import 'package:movie_app_1/persistence/daos/actor_dao.dart';
import 'package:movie_app_1/persistence/daos/genre_dao.dart';
import 'package:movie_app_1/persistence/daos/movie_dao.dart';
import 'package:stream_transform/stream_transform.dart';

class MovieModalImpl extends MovieModal {
  static final MovieModalImpl _singleton = MovieModalImpl._internal();

  factory MovieModalImpl() {
    return _singleton;
  }

  MovieModalImpl._internal();

  MovieDataAgent _dataAgent = RetorfitDataAgentImpl();

  /// Daos
  MovieDao mMovieDao = MovieDao();
  GenreDao mGenreDao = GenreDao();
  ActorDao mActorDao = ActorDao();

  @override
  void getNowPlayingMovies(int page) {
    // return _dataAgent.getNowPlayingMovies(1);
    _dataAgent.getNowPlayingMovies(page)?.then((movies) async {
      List<MovieVO>? nowPlayingMovies = movies?.map((movie) {
        movie.isNowPlaying = true;
        movie.isTopRated = false;
        movie.isPopularMovie = false;
        return movie;
      }).toList();
      mMovieDao.saveMovies(nowPlayingMovies!);
    });
  }

  @override
  Future<List<MovieVO>?>? getPopularMovies(int page) {
    // return _dataAgent.getPopularMovies(1);
    return _dataAgent.getPopularMovies(page)?.then((movies) async {
      List<MovieVO>? popularMovies = movies?.map((movie) {
        movie.isPopularMovie = true;
        movie.isNowPlaying = false;
        movie.isTopRated = false;
        return movie;
      }).toList();
      mMovieDao.saveMovies(popularMovies!);
      return Future.value(movies);
    });
  }

  @override
  Future<List<MovieVO>?>? getTopRatedMovies(int page) {
    // return _dataAgent.getTopRatedMovies(1);
    return _dataAgent.getTopRatedMovies(page)?.then((movies) async {
      List<MovieVO>? topRatedMovies = movies?.map((movie) {
        movie.isTopRated = true;
        movie.isNowPlaying = false;
        movie.isPopularMovie = false;
        return movie;
      }).toList();
      mMovieDao.saveMovies(topRatedMovies!);
      return Future.value(movies);
    });
  }

  @override
  Future<List<ActorVO>?>? getActors(int page) {
    // return _dataAgent.getActors(1);
    return _dataAgent.getActors(page)?.then((actors) async {
      mActorDao.saveAllActors(actors!);
      return Future.value(actors);
    });
  }

  @override
  Future<List<GenreVO>?>? getGenres() {
    // return _dataAgent.getGenres();
    return _dataAgent.getGenres()?.then((genres) async {
      mGenreDao.saveAllGenres(genres!);
      return Future.value(genres);
    });
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
  Future<MovieVO?>? getMovieDetails(int movieId) {
    return _dataAgent.getMovieDetails(movieId)?.then((movie) async {
      mMovieDao.saveSingleMovie(movie!);
      return Future.value(movie);
    });
  }

  /// Database
  @override
  Future<List<ActorVO>> getAllActorsFromDatabase() {
    return Future.value(mActorDao.getAllActors());
  }

  @override
  Future<List<GenreVO>> getGenresFromDatabase() {
    return Future.value(mGenreDao.getAllGenres());
  }

  @override
  Future<MovieVO> getMovieDetailsFromDatabase(int movieId) {
    return Future.value(mMovieDao.getMovieById(movieId));
  }

  @override
  Future<List<MovieVO>> getNowPlayingMoviesFromDatabase() {
    this.getNowPlayingMovies(1);
    return mMovieDao
        .getAllEventsMovieStream()
        .startWith(mMovieDao.getNowPlayingMoviesStream())
        .combineLatest(mMovieDao.getNowPlayingMoviesStream(),
            (event, movieList) => movieList as List<MovieVO>)
        .first;
  }

  @override
  Future<List<MovieVO>> getPopularMoviesFromDatabase() {
    this.getPopularMovies(1);
    return mMovieDao
        .getAllEventsMovieStream()
        .startWith(mMovieDao.getPopularMoviesStream())
        .combineLatest(mMovieDao.getPopularMoviesStream(),
            (event, movieList) => movieList as List<MovieVO>)
        .first;
  }

  @override
  Future<List<MovieVO>> getTopRatedMoviesFromDatabase() {
    this.getTopRatedMovies(1);
    return mMovieDao
        .getAllEventsMovieStream()
        .startWith(mMovieDao.getTopRatedMoviesStream())
        .combineLatest(mMovieDao.getTopRatedMoviesStream(),
            (event, movieList) => movieList as List<MovieVO>)
        .first;
  }
}
