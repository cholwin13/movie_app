import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:movie_app_1/pages/movie_detail_page.dart';
import 'package:movie_app_1/viewitems/actor_view.dart';
import 'package:movie_app_1/viewitems/banner_view.dart';
import 'package:movie_app_1/viewitems/movie_view.dart';
import 'package:movie_app_1/viewitems/show_case_view.dart';
import 'package:movie_app_1/widgets/see_more_text.dart';
import 'package:movie_app_1/widgets/title_text.dart';
import 'package:movie_app_1/widgets/title_text_with_seemore_view.dart';

import '../resources/colors.dart';
import '../resources/dimens.dart';
import '../resources/strings.dart';
import '../widgets/actor_and_creator_section_view.dart';

class HomePage extends StatelessWidget {
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
              BannerSectionView(),
              SizedBox(height: MARGIN_LAERGE),
              BestPopularMovieAndSerialsSectionView(() =>
                  //Navigate to detail screen
                  _navigateToMovieDetailScreen(context)),
              SizedBox(height: MARGIN_LAERGE),
              CheckSectionShowTimeSectionView(),
              SizedBox(height: MARGIN_LAERGE),
              GenreSectionView(
                () => _navigateToMovieDetailScreen(context),
                genreList: genreList,
              ),
              //HorizontalMovieListView(),
              SizedBox(height: MARGIN_LAERGE),
              ShowCasesSection(),
              SizedBox(height: MARGIN_LAERGE),
              ActorAndCreatorSectionView(
                  BEST_ACTORS_TITLE, BEST_ACTORS_SEE_MORE),
              SizedBox(height: MARGIN_LAERGE),
            ],
          ),
        ),
      ),
    );
  }

  void _navigateToMovieDetailScreen(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => MovieDetailPage(),
      ),
    );
  }
}

class GenreSectionView extends StatelessWidget {
  final List<String> genreList;
  final Function onTapMovie;

  GenreSectionView(
    this.onTapMovie, {
    required this.genreList,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: MARGIN_MEDIUM_2,
          ),
          child: DefaultTabController(
            length: genreList.length,
            child: TabBar(
              isScrollable: true,
              indicatorColor: PLAY_BUTTON_COLOR,
              unselectedLabelColor: HOME_SCREEN_LIST_TITLE_COLOR,
              tabs: genreList
                  .map(
                    (genre) => Tab(
                      child: Text(genre),
                    ),
                  )
                  .toList(),
            ),
          ),
        ),
        Container(
          color: PRIMARY_COLOR,
          padding: EdgeInsets.only(
            top: MARGIN_MEDIUM_2,
            bottom: MARGIN_LAERGE,
          ),
          child: HorizontalMovieListView(() {
            this.onTapMovie();
          }),
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
  const ShowCasesSection({
    Key? key,
  }) : super(key: key);

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
            children: [
              ShowCaseView(),
              ShowCaseView(),
              ShowCaseView(),
            ],
          ),
        ),
      ],
    );
  }
}

class BestPopularMovieAndSerialsSectionView extends StatelessWidget {
  final Function onTapMovie;

  BestPopularMovieAndSerialsSectionView(this.onTapMovie);

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
        HorizontalMovieListView(() {
          this.onTapMovie();
        }),
      ],
    );
  }
}

class HorizontalMovieListView extends StatelessWidget {
  final Function onTapMovie;

  HorizontalMovieListView(this.onTapMovie);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MOVIE_LIST_HEIGHT,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        padding: EdgeInsets.only(left: MARGIN_MEDIUM_2),
        itemCount: 10,
        itemBuilder: (BuildContext context, int index) {
          return MovieView(() {
            this.onTapMovie();
          });
        },
      ),
    );
  }
}

class BannerSectionView extends StatefulWidget {
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
            children: [
              BannerView(),
              BannerView(),
            ],
          ),
        ),
        SizedBox(height: MARGIN_MEDIUM_2),
        DotsIndicator(
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
