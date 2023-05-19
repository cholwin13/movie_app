import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:movie_app_1/data/vos/movie_vo.dart';
import 'package:movie_app_1/network/api_constants.dart';

import '../resources/dimens.dart';
import '../widgets/rating_view.dart';

class MovieView extends StatelessWidget {
  final MovieVO? movie;

  MovieView({
    required this.movie,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: MARGIN_MEDIUM),
      width: MOVIE_LIST_ITEM_WIDTH,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.network(
            "$IMAGE_BASE_URL${movie?.posterPath ?? ""}",
            height: 200,
            fit: BoxFit.cover,
          ),
          // GestureDetector(
          //   onTap: () {
          //     onTapMovie();
          //   },
          //   // child: Image(
          //   //   image: AssetImage("assets/images/view1.jpg"),
          //   //   fit: BoxFit.cover,
          //   //   height: 200,
          //   // ),
          //   child: Image.network("IMAGE_BASE_URL${movie?.posterPath ?? ""}"),
          // ),
          SizedBox(
            height: MARGIN_MEDIUM,
          ),
          Text(
            movie?.title ?? "",
            style: TextStyle(
              fontSize: TEXT_REGULAR_2x,
              color: Colors.white,
              fontWeight: FontWeight.w600,
            ),
          ),
          SizedBox(
            height: MARGIN_MEDIUM,
          ),
          Row(
            children: [
              Text(
                "8.9",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(width: MARGIN_MEDIUM),
              RatingView(),
            ],
          ),
        ],
      ),
    );
  }
}
