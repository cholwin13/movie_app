import 'package:flutter/material.dart';
import 'package:movie_app_1/widgets/gradient_view.dart';

import '../resources/colors.dart';
import '../resources/dimens.dart';
import '../resources/strings.dart';
import '../widgets/actor_and_creator_section_view.dart';
import '../widgets/rating_view.dart';
import '../widgets/title_text.dart';

class MovieDetailPage extends StatelessWidget {
  final List<String> genreList = [
    "Action",
    "Adventure",
    "thriller",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: HOME_SCREN_BACKGROUND_COLOR,
        child: CustomScrollView(
          slivers: [
            MovieDetailSliverAppBarView(() {
              Navigator.pop(context);
            }),
            SliverList(
              delegate: SliverChildListDelegate([
                Container(
                  margin: EdgeInsets.symmetric(
                    horizontal: MARGIN_CARD_MEDIUM_2,
                  ),
                  child: TrailerSection(genreList),
                ),
                SizedBox(height: MARGIN_LAERGE),
                ActorAndCreatorSectionView(
                  MOVIE_DETAIL_SCREEN_ACTOR_TITLE,
                  "",
                  seeMoreButtonVisibility: false,
                ),
                SizedBox(height: MARGIN_LAERGE),
                Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: MARGIN_MEDIUM_2,
                  ),
                  child: AboutFilmSectionView(),
                ),
                SizedBox(height: MARGIN_LAERGE),
                ActorAndCreatorSectionView(
                  MOVIE_DETAIL_SCREEN_CREATOR_TITLE,
                  MOVIE_DETAIL_SCREEN_CREATORS_SEEMORE,
                ),
              ]),
            )
          ],
        ),
      ),
    );
  }
}

class AboutFilmSectionView extends StatelessWidget {
  const AboutFilmSectionView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "ABOUT FILM",
        ),
        SizedBox(height: MARGIN_MEDIUM_2),
        AboutFilmInfoView(
          "Original Title",
          "X-Men Origins Wolverine",
        ),
        SizedBox(height: MARGIN_MEDIUM_2),
        AboutFilmInfoView(
          "Type",
          "Action Adventure Thriller",
        ),
        SizedBox(height: MARGIN_MEDIUM_2),
        AboutFilmInfoView(
          "Production",
          "United Kingdom USA",
        ),
        SizedBox(height: MARGIN_MEDIUM_2),
        AboutFilmInfoView(
          "Premiere",
          "8 November 2016 (world)",
        ),
        SizedBox(height: MARGIN_MEDIUM_2),
        AboutFilmInfoView(
          "description",
          "He started his acting career in 2016 and had since won widespread attention for his dramas,",
        ),
      ],
    );
  }
}

class AboutFilmInfoView extends StatelessWidget {
  final String label;
  final String description;

  AboutFilmInfoView(this.label, this.description);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: MediaQuery.of(context).size.width / 4,
          child: Text(
            label,
            style: TextStyle(
              color: MOVIE_DETAIL_INFO_TEXT_COLOR,
              fontSize: MARGIN_MEDIUM_2,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        SizedBox(width: MARGIN_CARD_MEDIUM_2),
        Expanded(
          child: Text(
            description,
            style: TextStyle(
              color: Colors.white,
              fontSize: MARGIN_MEDIUM_2,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ],
    );
  }
}

class TrailerSection extends StatelessWidget {
  final List<String> genreList;

  TrailerSection(this.genreList);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        MovieTimeAndGenreView(genreList: genreList),
        SizedBox(height: MARGIN_MEDIUM_3),
        StoryLineView(),
        SizedBox(height: MARGIN_MEDIUM_2),
        Row(
          children: [
            MovieDetailScreenButtonView(
              "PLAY TRAILER",
              PLAY_BUTTON_COLOR,
              Icon(
                Icons.play_circle_fill,
                color: Colors.black54,
              ),
            ),
            SizedBox(
              width: MARGIN_CARD_MEDIUM_2,
            ),
            MovieDetailScreenButtonView(
              "RATE MOVIE",
              HOME_SCREN_BACKGROUND_COLOR,
              Icon(
                Icons.star,
                color: PLAY_BUTTON_COLOR,
              ),
              isGhostButton: true,
            ),
          ],
        ),
      ],
    );
  }
}

class MovieDetailScreenButtonView extends StatelessWidget {
  final String title;
  final Color backgroundColor;
  final Icon buttonIcon;
  final bool isGhostButton;

  MovieDetailScreenButtonView(this.title, this.backgroundColor, this.buttonIcon,
      {this.isGhostButton = false});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: MARGIN_CARD_MEDIUM_2,
      ),
      height: MAEGIN_XXLARGE,
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(MARGIN_LAERGE),
        border: (isGhostButton)
            ? Border.all(
                color: Colors.white,
                width: 2,
              )
            : null,
      ),
      child: Center(
        child: Row(
          children: [
            buttonIcon,
            SizedBox(width: MARGIN_MEDIUM),
            Text(
              title,
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: TEXT_REGULAR_2x,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class StoryLineView extends StatelessWidget {
  const StoryLineView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TitleText(MOVIE_DETAIL_SCREEN_STORYLINE),
        Text(
          "Xiao Zhan (Chinese: 肖战, born 5 October 1991), also known as Sean Xiao, is a Chinese actor and singer. Xiao Zhan began his career in the entertainment industry when he participated in the idol survival show X-Fire and debuted as a member of the Chinese boy group X Nine.",
          style: TextStyle(
            color: Colors.white,
            fontSize: TEXT_REGULAR_2x,
          ),
        ),
      ],
    );
  }
}

class MovieTimeAndGenreView extends StatelessWidget {
  const MovieTimeAndGenreView({
    Key? key,
    required this.genreList,
  }) : super(key: key);

  final List<String> genreList;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          Icons.access_time,
          color: PLAY_BUTTON_COLOR,
        ),
        SizedBox(width: MARGIN_SMALL),
        Text(
          "2hr 30min",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(width: MARGIN_MEDIUM),
        Row(
          children: genreList.map((genre) => GenreChipView(genre)).toList(),
        ),
        Icon(
          Icons.favorite_border_rounded,
          color: Colors.white,
        ),
      ],
    );
  }
}

class GenreChipView extends StatelessWidget {
  final String genreText;
  const GenreChipView(this.genreText);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Chip(
          backgroundColor: MOVIE_DETAIL_SCREEN_CHIP_BACKGROUND_COLOR,
          label: Text(
            genreText,
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        SizedBox(width: MARGIN_SMALL),
      ],
    );
  }
}

class MovieDetailSliverAppBarView extends StatelessWidget {
  final Function onTapBack;

  MovieDetailSliverAppBarView(this.onTapBack);

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      backgroundColor: PRIMARY_COLOR,
      automaticallyImplyLeading: false,
      expandedHeight: MOVIE_DETAIL_SCREEN_SLIVER_APP_BAR_HEIGHT,
      flexibleSpace: FlexibleSpaceBar(
        background: Stack(
          children: [
            Positioned.fill(
              child: MovieDetailAppBarImageView(),
            ),
            Positioned.fill(
              child: GradientView(),
            ),
            Align(
              alignment: Alignment.topLeft,
              child: Padding(
                padding: EdgeInsets.only(
                  top: MAEGIN_XXLARGE,
                  left: MARGIN_MEDIUM_2,
                ),
                child: BackButtonView(() => this.onTapBack()),
              ),
            ),
            Align(
              alignment: Alignment.topRight,
              child: Padding(
                padding: EdgeInsets.only(
                  top: MAEGIN_XXLARGE + MARGIN_MEDIUM,
                  right: MARGIN_MEDIUM_2,
                ),
                child: SearchButtonView(),
              ),
            ),
            Align(
              alignment: Alignment.bottomLeft,
              child: Padding(
                padding: const EdgeInsets.only(
                  left: MARGIN_MEDIUM_2,
                  right: MARGIN_MEDIUM_2,
                  bottom: MARGIN_LAERGE,
                ),
                child: MovieDetailAppBarInfoView(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class MovieDetailAppBarInfoView extends StatelessWidget {
  const MovieDetailAppBarInfoView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Row(
          children: [
            MovieDetailYearView(),
            Spacer(),
            Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    RatingView(),
                    SizedBox(height: MARGIN_SMALL),
                    Text(
                      "38876 VOTES",
                    ),
                    SizedBox(height: MARGIN_CARD_MEDIUM_2),
                  ],
                ),
                SizedBox(width: MARGIN_MEDIUM),
                Text(
                  "9.76",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: MOVIE_DETAIL_RATING_TEXT_SIZE,
                  ),
                )
              ],
            ),
          ],
        ),
        SizedBox(height: MARGIN_MEDIUM),
        Text(
          "The Wolverine",
          style: TextStyle(
            color: Colors.white,
            fontSize: TEXT_HEADING_2X,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}

class MovieDetailYearView extends StatelessWidget {
  const MovieDetailYearView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: MARGIN_MEDIUM_2,
      ),
      height: MAEGIN_XXLARGE,
      decoration: BoxDecoration(
        color: PLAY_BUTTON_COLOR,
        borderRadius: BorderRadius.circular(
          MARGIN_LAERGE,
        ),
      ),
      child: Center(
        child: Text(
          "2016",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}

class SearchButtonView extends StatelessWidget {
  const SearchButtonView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Icon(
      Icons.search,
      color: Colors.white,
      size: MARGIN_XLARGE,
    );
  }
}

class BackButtonView extends StatelessWidget {
  final Function onTapBack;

  BackButtonView(this.onTapBack);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        this.onTapBack();
      },
      child: Container(
        width: MAEGIN_XXLARGE,
        height: MAEGIN_XXLARGE,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.black54,
        ),
        child: Icon(
          Icons.chevron_left,
          color: Colors.white,
          size: MARGIN_XLARGE,
        ),
      ),
    );
  }
}

class MovieDetailAppBarImageView extends StatelessWidget {
  const MovieDetailAppBarImageView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Image(
      image: AssetImage("assets/images/view1.jpg"),
      fit: BoxFit.cover,
    );
  }
}
