import 'package:flutter/material.dart';
import 'package:movie_app_1/widgets/title_text_with_seemore_view.dart';
import 'package:movie_app_1/data/vos/actor_vo.dart';

import '../resources/colors.dart';
import '../resources/dimens.dart';
import '../resources/strings.dart';
import '../viewitems/actor_view.dart';

class ActorAndCreatorSectionView extends StatelessWidget {
  final String titleText;
  final String seeMoreText;
  final bool seeMoreButtonVisibility;
  final List<ActorVO>? actorsList;

  ActorAndCreatorSectionView(
    this.titleText,
    this.seeMoreText, {
    this.seeMoreButtonVisibility = true,
    required this.actorsList,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: PRIMARY_COLOR,
      padding: EdgeInsets.only(
        top: MARGIN_MEDIUM_2,
        bottom: MAEGIN_XXLARGE,
      ),
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: MARGIN_MEDIUM_2),
            child: TitleTextWithSeeMoreView(
              titleText,
              seeMoreText,
              seeMoreButtonVisibility: this.seeMoreButtonVisibility,
            ),
          ),
          SizedBox(height: MARGIN_MEDIUM_2),
          Container(
            height: BEST_ACTOR_HEIGHT,
            child: ListView(
              padding: EdgeInsets.only(left: MARGIN_MEDIUM_2),
              scrollDirection: Axis.horizontal,
              // children: [
              //   ActorView(),
              //   ActorView(),
              //   ActorView(),
              // ],
              children: actorsList
                      ?.map(
                        (actor) => ActorView(
                          actor: actor,
                        ),
                      )
                      .toList() ??
                  [],
            ),
          ),
        ],
      ),
    );
  }
}
