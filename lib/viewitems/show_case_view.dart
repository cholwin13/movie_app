import 'package:flutter/material.dart';
import 'package:movie_app_1/data/vos/movie_vo.dart';
import 'package:movie_app_1/network/api_constants.dart';
import 'package:movie_app_1/widgets/play_button_view.dart';
import 'package:movie_app_1/widgets/title_text.dart';

import '../resources/dimens.dart';

class ShowCaseView extends StatelessWidget {
  final MovieVO? movie;

  ShowCaseView({required this.movie});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: MARGIN_MEDIUM_2),
      width: 300,
      child: Stack(
        children: [
          Positioned.fill(
            // child: Image(
            //   image: AssetImage(
            //     "assets/images/view1.jpg",
            //   ),
            //   fit: BoxFit.cover,
            // ),
            child: Image.network(
              "$IMAGE_BASE_URL${movie?.posterPath}",
              fit: BoxFit.cover,
            ),
          ),
          Align(
            alignment: Alignment.center,
            child: PlayButtonView(),
          ),
          Align(
            alignment: Alignment.bottomLeft,
            child: Padding(
              padding: const EdgeInsets.all(MARGIN_MEDIUM_2),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    movie?.title ?? "",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: TEXT_REGULAR_3X,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(height: MARGIN_MEDIUM),
                  TitleText("15 DECEMBER 2016")
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
