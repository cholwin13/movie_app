import 'package:flutter/material.dart';

import '../resources/colors.dart';
import '../resources/dimens.dart';

class PlayButtonView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Icon(
      Icons.play_circle_fill,
      color: PLAY_BUTTON_COLOR,
      size: BANNER_PLAY_BUTTON_SIZE,
    );
  }
}
