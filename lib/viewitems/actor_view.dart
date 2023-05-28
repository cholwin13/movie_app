import 'package:flutter/material.dart';
import 'package:movie_app_1/data/vos/actor_vo.dart';
import 'package:movie_app_1/network/api_constants.dart';

import '../resources/dimens.dart';

class ActorView extends StatelessWidget {
  final ActorVO? actor;

  ActorView({
    required this.actor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: MARGIN_MEDIUM),
      width: MOVIE_LIST_ITEM_WIDTH,
      child: Stack(
        children: [
          Positioned.fill(
            child: ActorImageView(
              actorProfilePath: actor?.profile_path ?? "",
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(MARGIN_MEDIUM),
            child: FavouriteButtonView(),
          ),
          ActorNameAndLikeView(
            actorName: actor?.name ?? "Actor NAme",
          ),
        ],
      ),
    );
  }
}

class ActorImageView extends StatelessWidget {
  final String actorProfilePath;

  ActorImageView({required this.actorProfilePath});

  @override
  Widget build(BuildContext context) {
    // return Image(
    //   image: AssetImage("assets/images/view1.jpg"),
    //   fit: BoxFit.cover,
    // );
    return Image.network(
      "$IMAGE_BASE_URL${actorProfilePath}",
      fit: BoxFit.cover,
    );
  }
}

class FavouriteButtonView extends StatelessWidget {
  const FavouriteButtonView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topRight,
      child: Icon(
        Icons.favorite_border,
        color: Colors.red,
      ),
    );
  }
}

class ActorNameAndLikeView extends StatelessWidget {
  final String actorName;

  ActorNameAndLikeView({required this.actorName});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: MARGIN_MEDIUM,
          vertical: MARGIN_MEDIUM_2,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              actorName,
              style: TextStyle(
                color: Colors.red,
                fontWeight: FontWeight.w700,
                fontSize: TEXT_REGULAR,
              ),
            ),
            SizedBox(height: MARGIN_MEDIUM),
            Row(
              children: [
                Icon(
                  Icons.thumb_up,
                  color: Colors.amber,
                  size: MARGIN_CARD_MEDIUM_2,
                ),
                SizedBox(width: MARGIN_MEDIUM),
                Text(
                  "YOU LIKE 13 MOVIE",
                  style: TextStyle(
                    color: Colors.red,
                    fontWeight: FontWeight.bold,
                    fontSize: 10,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
