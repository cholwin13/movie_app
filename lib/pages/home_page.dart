import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:movie_app_1/data/model/movie_model.dart';
import 'package:movie_app_1/data/model/movie_model_impl.dart';
import 'package:movie_app_1/pages/movie_detail_page.dart';
import 'package:movie_app_1/viewitems/actor_view.dart';
import 'package:movie_app_1/viewitems/banner_view.dart';
import 'package:movie_app_1/viewitems/movie_view.dart';
import 'package:movie_app_1/viewitems/show_case_view.dart';
import 'package:movie_app_1/widgets/see_more_text.dart';
import 'package:movie_app_1/widgets/title_text.dart';
import 'package:movie_app_1/widgets/title_text_with_seemore_view.dart';
import 'package:movie_app_1/data/vos/movie_vo.dart';
import 'package:movie_app_1/data/vos/genre_vo.dart';
import 'package:movie_app_1/data/vos/actor_vo.dart';

import '../resources/colors.dart';
import '../resources/dimens.dart';
import '../resources/strings.dart';
import '../widgets/actor_and_creator_section_view.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  MovieModal movieModel = MovieModalImpl();

  ///State Variables
  List<MovieVO>? getNowPlayingMovies;
  List<MovieVO>? popularMovies;
  List<MovieVO>? topRatedMovies;
  List<MovieVO>? moviesByGenre;
  List<GenreVO>? genres;
  List<ActorVO>? actors;

  @override
  void initState() {
    ///Now Playing Movies
    movieModel.getNowPlayingMovies(1)?.then((movieList) {
      setState(() {
        getNowPlayingMovies = movieList;
      });
    }).catchError((error) {
      debugPrint("Error In Home Page ======> ${error.toString()} ");
    });

    /// Now Playing Movis from database
    movieModel.getNowPlayingMoviesFromDatabase().then((movieList) {
      setState(() {
        getNowPlayingMovies = movieList;
      });
    }).catchError((error) {
      debugPrint("Now playing Movie DB error ====> ${error.toString()}");
    });

    ///Popular Movies
    movieModel.getPopularMovies(1)?.then((movieList) {
      setState(() {
        popularMovies = movieList;
      });
    }).catchError((error) {
      debugPrint(error.toString());
    });

    /// Popular Movies From Database
    movieModel.getPopularMoviesFromDatabase().then((movieList) {
      setState(() {
        popularMovies = movieList;
      });
    }).catchError((error) {
      debugPrint("Popular Movies DB Error ====> ${error.toString()}");
    });

    ///Genres
    movieModel.getGenres()?.then((genres) {
      setState(() {
        this.genres = genres;

        ///Movie By Genre
        _getMoviesByGenre(genres?.first.id ?? 0);
      });
    }).catchError((error) {
      debugPrint("GEnre Network Err ===> ${error.toString()}");
    });

    /// Genre from Database
    movieModel.getGenresFromDatabase().then((genres) {
      setState(() {
        this.genres = genres;

        /// Movie By Genre
        _getMoviesByGenre(genres.first.id ?? 0);
      });
    }).catchError((error) {
      debugPrint("Genre DB Error ====> ${error.toString()}");
    });

    ///top rated movies (ShowCase)
    movieModel.getTopRatedMovies(1)?.then((movieList) {
      setState(() {
        topRatedMovies = movieList;
      });
    }).catchError((error) {
      debugPrint(error.toString());
    });

    /// top rated movies from databse (ShowCase)
    movieModel.getTopRatedMoviesFromDatabase().then((movieList) {
      setState(() {
        topRatedMovies = movieList;
      });
    }).catchError((error) {
      debugPrint("Top rated DB error ===> ${error.toString()}");
    });

    ///Actors
    movieModel.getActors(1)?.then((actors) {
      setState(() {
        this.actors = actors;
      });
    }).catchError((error) {
      debugPrint(error.toString());
    });

    /// Actors From Database
    movieModel.getAllActorsFromDatabase().then((actorList) {
      setState(() {
        this.actors = actorList;
      });
    }).catchError((error) {
      debugPrint("Acror DB error ===> ${error.toString()}");
    });

    super.initState();
  }

  void _getMoviesByGenre(int genreId) {
    movieModel.getMoviesByGenre(genreId)?.then((movieByGenre) {
      setState(() {
        this.moviesByGenre = movieByGenre;
      });
    }).catchError((error) {
      debugPrint("GEt Movie By Genre Error====>${error.toString()}");
    });
  }

  List<String> genreList = [
    "Action",
    "Adventure",
    "Horror",
    "Comedy",
    "Thriller",
    "Drama",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: PRIMARY_COLOR,
        title: Text(
          MAIN_SCREEN_APP_BAR_TITLE,
          style: TextStyle(
            fontWeight: FontWeight.w700,
          ),
        ),
        leading: Icon(
          Icons.menu,
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(
              top: 0,
              left: 0,
              bottom: 0,
              right: MARGIN_MEDIUM_2,
            ),
            child: Icon(
              Icons.search,
            ),
          ),
        ],
      ),
      body: Container(
        color: HOME_SCREN_BACKGROUND_COLOR,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              BannerSectionView(
                movieList: popularMovies?.take(5).toList(),
              ),
              SizedBox(height: MARGIN_LAERGE),
              BestPopularMovieAndSerialsSectionView(
                onTapMovie: (movieId) =>
                    //Navigate to detail screen
                    _navigateToMovieDetailScreen(context, movieId),
                nowPlayingMovies: getNowPlayingMovies,
              ),
              SizedBox(height: MARGIN_LAERGE),
              CheckSectionShowTimeSectionView(),
              SizedBox(height: MARGIN_LAERGE),
              GenreSectionView(
                onTapMovie: (movieId) =>
                    _navigateToMovieDetailScreen(context, movieId),
                genreList: genres,
                moviesByGenre: moviesByGenre,
                onChooseGenre: (genreId) {
                  if (genreId != null) {
                    _getMoviesByGenre(genreId);
                  }
                },
              ),
              //HorizontalMovieListView(),
              SizedBox(height: MARGIN_LAERGE),
              ShowCasesSection(
                topRatedMovies: topRatedMovies,
              ),
              SizedBox(height: MARGIN_LAERGE),
              ActorAndCreatorSectionView(
                BEST_ACTORS_TITLE,
                BEST_ACTORS_SEE_MORE,
                actorsList: actors,
              ),
              SizedBox(height: MARGIN_LAERGE),
            ],
          ),
        ),
      ),
    );
  }

  void _navigateToMovieDetailScreen(BuildContext context, int? movieId) {
    if (movieId != null) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => MovieDetailPage(
            movieId: movieId,
          ),
        ),
      );
    }
  }
}

class GenreSectionView extends StatelessWidget {
  final List<GenreVO>? genreList;
  final List<MovieVO>? moviesByGenre;
  final Function(int?) onTapMovie;
  final Function(int?) onChooseGenre;

  GenreSectionView({
    required this.onTapMovie,
    required this.genreList,
    required this.moviesByGenre,
    required this.onChooseGenre,
  });

  @override
  Widget build(BuildContext context) {
    print("GEnre sectoinj");
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: MARGIN_MEDIUM_2,
          ),
          child: DefaultTabController(
            length: genreList?.length ?? 0,
            child: TabBar(
              isScrollable: true,
              indicatorColor: PLAY_BUTTON_COLOR,
              unselectedLabelColor: HOME_SCREEN_LIST_TITLE_COLOR,
              tabs: genreList
                      ?.map(
                        (genre) => Tab(
                          child: Text(genre.name ?? "Genre Name"),
                        ),
                      )
                      .toList() ??
                  [],
              onTap: (index) {
                onChooseGenre(genreList?[index].id);
              },
            ),
          ),
        ),
        Container(
          color: PRIMARY_COLOR,
          padding: EdgeInsets.only(
            top: MARGIN_MEDIUM_2,
            bottom: MARGIN_LAERGE,
          ),
          child: HorizontalMovieListView(
            onTapMovie: (movieId) => this.onTapMovie(movieId),
            movieList: moviesByGenre,
          ),
        ),
      ],
    );
  }
}

class CheckSectionShowTimeSectionView extends StatelessWidget {
  const CheckSectionShowTimeSectionView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: PRIMARY_COLOR,
      margin: EdgeInsets.symmetric(
        horizontal: MARGIN_MEDIUM_2,
      ),
      padding: EdgeInsets.all(MARGIN_LAERGE),
      height: MOVIE_SHOW_TIME_SECTION_HEIGHT,
      child: Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                MAIN_SCREEN_CHECK_MOVIE_SHOW_TIME,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: TEXT_HEADING_1X,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Spacer(),
              SeeMoreText(
                MAIN_SCREEN_SEE_MORE,
                textColor: PLAY_BUTTON_COLOR,
              )
            ],
          ),
          Spacer(),
          Icon(
            Icons.location_on_rounded,
            color: Colors.white,
            size: BANNER_PLAY_BUTTON_SIZE,
          ),
        ],
      ),
    );
  }
}

class ShowCasesSection extends StatelessWidget {
  final List<MovieVO>? topRatedMovies;

  ShowCasesSection({required this.topRatedMovies});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: MARGIN_MEDIUM_2),
          child: TitleTextWithSeeMoreView(
            SHOW_CASES_TITLE,
            SHOW_CASES_SEE_MORE,
          ),
        ),
        SizedBox(height: MARGIN_MEDIUM_2),
        Container(
          height: SHOW_CASES_HEIGHT,
          child: ListView(
              padding: EdgeInsets.only(left: MARGIN_MEDIUM_2),
              scrollDirection: Axis.horizontal,
              // children: [
              //   ShowCaseView(),
              //   ShowCaseView(),
              //   ShowCaseView(),
              // ],
              children: topRatedMovies
                      ?.map((topRatedMovies) => ShowCaseView(
                            movie: topRatedMovies,
                          ))
                      .toList() ??
                  []),
        ),
      ],
    );
  }
}

class BestPopularMovieAndSerialsSectionView extends StatelessWidget {
  final Function(int?) onTapMovie;
  final List<MovieVO>? nowPlayingMovies;

  BestPopularMovieAndSerialsSectionView({
    required this.onTapMovie,
    required this.nowPlayingMovies,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: EdgeInsets.only(left: MARGIN_MEDIUM_2),
          child: TitleText(MAIN_SCREEN_BEST_POPULAR_MOVIE_AND_SERIALS),
        ),
        SizedBox(height: MARGIN_MEDIUM_2),
        HorizontalMovieListView(
          onTapMovie: (movieId) => this.onTapMovie(movieId),
          movieList: nowPlayingMovies,
        ),
      ],
    );
  }
}

class HorizontalMovieListView extends StatelessWidget {
  final Function(int?) onTapMovie;
  final List<MovieVO>? movieList;

  HorizontalMovieListView({
    required this.onTapMovie,
    required this.movieList,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MOVIE_LIST_HEIGHT,
      child: (movieList != null)
          ? ListView.builder(
              scrollDirection: Axis.horizontal,
              padding: EdgeInsets.only(left: MARGIN_MEDIUM_2),
              itemCount: movieList?.length ?? 0,
              itemBuilder: (BuildContext context, int index) {
                return GestureDetector(
                  onTap: () => onTapMovie(movieList?[index].id),
                  child: MovieView(
                    movie: movieList?[index],
                  ),
                );
              },
            )
          : Center(
              child: CircularProgressIndicator(),
            ),
    );
  }
}

class BannerSectionView extends StatefulWidget {
  final List<MovieVO>? movieList;

  BannerSectionView({required this.movieList});

  @override
  State<BannerSectionView> createState() => _BannerSectionViewState();
}

class _BannerSectionViewState extends State<BannerSectionView> {
  double _position = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: MediaQuery.of(context).size.height / 3.5,
          child: PageView(
              onPageChanged: (page) {
                setState(() {
                  _position = page.toDouble();
                });
              },
              // children: [
              //   BannerView(),
              //   BannerView(),
              // ],
              children: widget.movieList
                      ?.map(
                        (movie) => BannerView(
                          movie: movie,
                        ),
                      )
                      .toList() ??
                  []),
        ),
        SizedBox(height: MARGIN_MEDIUM_2),
        DotsIndicator(
          // dotsCount: widget.movieList?.length ?? 1,
          dotsCount: 2,
          position: _position,
          decorator: DotsDecorator(
            color: HOME_SCREEN_BANNER_DOTS_INACTIVE_COLOR,
            activeColor: PLAY_BUTTON_COLOR,
          ),
        ),
      ],
    );
  }
}
