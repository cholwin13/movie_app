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

  MovieModalImpl._internal() {
    getNowPlayingMoviesFromDatabase();
    getTopRatedMoviesFromDatabase();
    getPopularMoviesFromDatabase();
    getGenres();
    getGenresFromDatabase();
    getActors(1);
    getAllActorsFromDatabase();
  }

  MovieDataAgent _dataAgent = RetorfitDataAgentImpl();

  /// Daos
  MovieDao mMovieDao = MovieDao();
  GenreDao mGenreDao = GenreDao();
  ActorDao mActorDao = ActorDao();

  ///Home Page State
  List<MovieVO>? mNowPlayingMovieList;
  List<MovieVO>? mPopularMovies;
  List<MovieVO>? mTopRatedMovies;
  List<MovieVO>? mMoviesByGenreList;
  List<GenreVO>? mGenresList;
  List<ActorVO>? mActors;

  ///State Movie detail
  MovieVO? mMovie;
  List<ActorVO>? mActorList;
  List<ActorVO>? mCreatorList;

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
      mNowPlayingMovieList = nowPlayingMovies;
      notifyListeners();
    });
  }

  @override
  void getPopularMovies(int page) {
    // return _dataAgent.getPopularMovies(1);
    _dataAgent.getPopularMovies(page)?.then((movies) async {
      List<MovieVO>? popularMovies = movies?.map((movie) {
        movie.isPopularMovie = true;
        movie.isNowPlaying = false;
        movie.isTopRated = false;
        return movie;
      }).toList();
      mMovieDao.saveMovies(popularMovies!);
      mPopularMovies = popularMovies;
      notifyListeners();
    });
  }

  @override
  void getTopRatedMovies(int page) {
    // return _dataAgent.getTopRatedMovies(1);
    _dataAgent.getTopRatedMovies(page)?.then((movies) async {
      List<MovieVO>? topRatedMovies = movies?.map((movie) {
        movie.isTopRated = true;
        movie.isNowPlaying = false;
        movie.isPopularMovie = false;
        return movie;
      }).toList();
      mMovieDao.saveMovies(topRatedMovies!);
      mTopRatedMovies = topRatedMovies;
      notifyListeners();
    });
  }

  @override
  void getActors(int page) {
    // return _dataAgent.getActors(1);
    _dataAgent.getActors(page)?.then((actors) async {
      mActorDao.saveAllActors(actors!);
      mActors = actors;
      notifyListeners();
      return Future.value(actors);
    });
  }

  @override
  void getGenres() {
    // return _dataAgent.getGenres();
    _dataAgent.getGenres()?.then((genres) async {
      mGenreDao.saveAllGenres(genres!);
      mGenresList = genres;
      getMoviesByGenre(genres.first.id ?? 0);
      notifyListeners();
      return Future.value(genres);
    });
  }

  @override
  void getMoviesByGenre(int genreId) {
    _dataAgent.getMoviesByGenres(genreId)?.then((moviesList) {
      mMoviesByGenreList = moviesList;
      notifyListeners();
    });
  }

  @override
  void getCreditsByMovie(int movieId) {
    _dataAgent.getCreditsByMovie(movieId)?.then((castAndcrew) {
      this.mActorList = castAndcrew?.first;
      this.mCreatorList = castAndcrew?[1];
      notifyListeners();
    });
  }

  @override
  void getMovieDetails(int movieId) {
    _dataAgent.getMovieDetails(movieId)?.then((movie) async {
      mMovieDao.saveSingleMovie(movie!);
      mMovie = movie;
      notifyListeners();
      return Future.value(movie);
    });
  }

  /// Database
  @override
  void getAllActorsFromDatabase() {
    mActors = mActorDao.getAllActors();
    notifyListeners();
  }

  @override
  void getGenresFromDatabase() {
    mGenresList = mGenreDao.getAllGenres();
    notifyListeners();
  }

  @override
  void getMovieDetailsFromDatabase(int movieId) {
    mMovie = mMovieDao.getMovieById(movieId);
    notifyListeners();
  }

  @override
  void getNowPlayingMoviesFromDatabase() {
    this.getNowPlayingMovies(1);
    mMovieDao
        .getAllEventsMovieStream()
        .startWith(mMovieDao.getNowPlayingMoviesStream())
        .combineLatest(mMovieDao.getNowPlayingMoviesStream(),
            (event, movieList) => movieList as List<MovieVO>)
        .first
        .then((nowPlayingmovies) {
      mNowPlayingMovieList = nowPlayingmovies;
      notifyListeners();
    });
  }

  @override
  void getPopularMoviesFromDatabase() {
    this.getPopularMovies(1);
    mMovieDao
        .getAllEventsMovieStream()
        .startWith(mMovieDao.getPopularMoviesStream())
        .combineLatest(mMovieDao.getPopularMoviesStream(),
            (event, movieList) => movieList as List<MovieVO>)
        .first
        .then((popularMovies) {
      mPopularMovies = popularMovies;
      notifyListeners();
    });
  }

  @override
  void getTopRatedMoviesFromDatabase() {
    this.getTopRatedMovies(1);
    mMovieDao
        .getAllEventsMovieStream()
        .startWith(mMovieDao.getTopRatedMoviesStream())
        .combineLatest(mMovieDao.getTopRatedMoviesStream(),
            (event, movieList) => movieList as List<MovieVO>)
        .first
        .then((topRatedMovies) {
      mTopRatedMovies = topRatedMovies;
      notifyListeners();
    });
  }
}
