import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import '../resources/dimens.dart';
import '../widgets/rating_view.dart';

class MovieView extends StatelessWidget {
  final Function onTapMovie;

  MovieView(this.onTapMovie);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: MARGIN_MEDIUM),
      width: MOVIE_LIST_ITEM_WIDTH,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Image.network(
          //   "https://th.bing.com/th/id/OIP.OAth2aDvWPVWC3gc-KfAagHaLH?w=203&h=304&c=7&r=0&o=5&dpr=1.5&pid=1.7",
          // ),
          GestureDetector(
            onTap: () {
              onTapMovie();
            },
            child: Image(
              image: AssetImage("assets/images/view1.jpg"),
              fit: BoxFit.cover,
              height: 200,
            ),
          ),
          SizedBox(
            height: MARGIN_MEDIUM,
          ),
          Text(
            "West World",
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
