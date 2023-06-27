import 'package:flutter/foundation.dart';

import '../data/model/movie_model.dart';
import '../data/model/movie_model_impl.dart';
import '../data/vos/actor_vo.dart';
import '../data/vos/movie_vo.dart';

class MovieDetailsBloc extends ChangeNotifier {
  ///State Variables
  MovieVO? mMovie;
  List<ActorVO>? mActorList; // cast
  List<ActorVO>? mCreatorList; // crew

  ///Modal
  MovieModal mMovieModel = MovieModalImpl();

  MovieDetailsBloc(int movieId) {
    ///Movie Details
    mMovieModel.getMovieDetails(movieId)?.then((movieDetails) {
      this.mMovie = movieDetails;
      notifyListeners();
    }).catchError((error) {
      debugPrint("Movie Detail error ===> ${error}");
    });

    ///Movie Details From Database
    mMovieModel.getMovieDetailsFromDatabase(movieId)?.then((movieDetails) {
      this.mMovie = movieDetails;
      notifyListeners();
    }).catchError((error) {
      debugPrint("Movie Details DB error====> ${error}");
    });
  }
}
