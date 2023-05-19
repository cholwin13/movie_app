import 'package:movie_app_1/data/vos/movie_vo.dart';
import 'package:movie_app_1/data/vos/genre_vo.dart';
import 'package:movie_app_1/data/vos/actor_vo.dart';

abstract class MovieModal {
  Future<List<MovieVO>?>? getNowPlayingMovies();

  Future<List<MovieVO>?>? getPopularMovies();

  Future<List<MovieVO>?>? getTopRatedMovies();

  Future<List<GenreVO>?>? getGenres();

  Future<List<MovieVO>?>? getMoviesByGenre(int genreId);

  Future<List<ActorVO>?>? getActors(int page);

  Future<MovieVO?>? getMovieDetails(int movieId);

  Future<List<List<ActorVO>?>?>? getCreditsByMovie(int movieId);
}
