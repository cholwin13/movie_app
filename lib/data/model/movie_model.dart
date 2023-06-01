import 'package:movie_app_1/data/vos/movie_vo.dart';
import 'package:movie_app_1/data/vos/genre_vo.dart';
import 'package:movie_app_1/data/vos/actor_vo.dart';
import 'package:scoped_model/scoped_model.dart';

abstract class MovieModal extends Model {
  //Network
  void getNowPlayingMovies(int page);
  void getPopularMovies(int page);
  void getTopRatedMovies(int page);
  void getGenres();
  void getMoviesByGenre(int genreId);
  void getActors(int page);
  void getMovieDetails(int movieId);
  void getCreditsByMovie(int movieId);

  // Database
  void getTopRatedMoviesFromDatabase();
  void getPopularMoviesFromDatabase();
  void getNowPlayingMoviesFromDatabase();
  void getGenresFromDatabase();
  void getAllActorsFromDatabase();
  void getMovieDetailsFromDatabase(int movieId);
}
