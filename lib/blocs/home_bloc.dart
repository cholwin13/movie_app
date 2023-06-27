import 'package:flutter/foundation.dart';
import '../data/model/movie_model.dart';

import '../data/model/movie_model_impl.dart';
import '../data/vos/actor_vo.dart';
import '../data/vos/genre_vo.dart';
import '../data/vos/movie_vo.dart';

class HomeBloc extends ChangeNotifier {
  ///State Variables
  List<MovieVO>? mNowPlayingMovieList;
  List<MovieVO>? mPopularMoviesList;
  List<MovieVO>? mShowCaseMovieList;
  List<MovieVO>? mMovieByGenreList;
  List<GenreVO>? mGenreList;
  List<ActorVO>? mActors;

  /// Model
  MovieModal movieModel = MovieModalImpl();

  HomeBloc() {
    ///Now Playing Movies Database
    movieModel.getNowPlayingMoviesFromDatabase().then((movieList) {
      mNowPlayingMovieList = movieList;
      notifyListeners();
    }).catchError((error) {
      debugPrint("Now playing Movie DB error ====> ${error.toString()}");
    });

    /// Popular Movies From Database
    movieModel.getPopularMoviesFromDatabase().then((movieList) {
      mPopularMoviesList = movieList;
      notifyListeners();
    }).catchError((error) {
      debugPrint("Popular Movies DB Error ====> ${error.toString()}");
    });

    ///Genres
    movieModel.getGenres()?.then((genreList) {
      mGenreList = genreList;

      ///Movie By Genre
      _getMovieByGenreAndRefresh(genreList?.first.id ?? 0);
    }).catchError((error) {
      debugPrint("GEnre Network Err ===> ${error.toString()}");
    });

    /// Genre from Database
    movieModel.getGenresFromDatabase().then((genreList) {
      mGenreList = genreList;

      /// Movie By Genre
      // _getMovieByGenreAndRefresh(genreList.first.id ?? 0);
    }).catchError((error) {
      debugPrint("Genre DB Error ====> ${error.toString()}");
    });

    /// top rated movies from databse (ShowCase)
    movieModel.getTopRatedMoviesFromDatabase().then((movieList) {
      mShowCaseMovieList = movieList;
      notifyListeners();
    }).catchError((error) {
      debugPrint("Top rated DB error ===> ${error.toString()}");
    });

    ///top rated movies (ShowCase)
    // movieModel.getTopRatedMovies(1)?.then((movieList) {
    //   mShowCaseMovieList =movieList;
    //   notifyListeners();
    // }).catchError((error) {
    //   debugPrint(error.toString());
    // });

    ///Actors
    movieModel.getActors(1)?.then((actorList) {
      mActors = actorList;
      notifyListeners();
    }).catchError((error) {
      debugPrint(error.toString());
    });

    /// Actors From Database
    movieModel.getAllActorsFromDatabase().then((actorList) {
      mActors = actorList;
      notifyListeners();
    }).catchError((error) {
      debugPrint("Acror DB error ===> ${error.toString()}");
    });
  }

  void onTapGenre(int genreId) {
    _getMovieByGenreAndRefresh(genreId);
  }

  void _getMovieByGenreAndRefresh(int genreId) {
    movieModel.getMoviesByGenre(genreId)?.then((movieByGenre) {
      mMovieByGenreList = movieByGenre;
      notifyListeners();
    }).catchError((error) {
      debugPrint("Get Movie By Genre ==> ${error.toString()}");
    });
  }
}
