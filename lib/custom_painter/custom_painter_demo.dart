import 'dart:math';
import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../resources/constants.dart';
import '../resources/dimens.dart';

/// For Run Only Custom PAinter
void main() async {
  //for Custom Layout Lesson
  runApp(MyApp());
}

class DemoCustomPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint()
      ..strokeWidth = 2.0
      ..color = Colors.green
      ..style = PaintingStyle.fill;
    var circlePaint = Paint()
      ..strokeWidth = 2.0
      ..color = Colors.white
      ..style = PaintingStyle.fill;

    // canvas.drawRect(
    //     Rect.fromCircle(
    //         center: Offset(size.width / 2, size.height / 2), radius: 88),
    //     paint);
    // canvas.drawCircle(Offset(size.width / 2, size.height / 2), 88, circlePaint);
    canvas.drawLine(Offset(0, 200), Offset(50, 0), paint);
    canvas.drawLine(Offset(50, 0), Offset(250, 0), paint);
    canvas.drawLine(Offset(250, 0), Offset(250, 200), paint);
    canvas.drawLine(Offset(250, 200), Offset(0, 200), paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}

// class CustomPainterDemo extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       child: Center(
//         child: CustomPaint(
//           size: Size(300, 300),
//           painter: DemoCustomPainter(),
//         ),
//       ),
//     );
//   }
// }

//Custom Layout Lesson
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Custom Layout Example'),
        ),
        body: CustomLayout(),
      ),
    );
  }
}

// class CustomLayout extends StatelessWidget {
//   const CustomLayout({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return Stack(
//       children: [
//         FootballPitchBackgroundView(),
//         // FormationViewFourFourTwo(),
//         // FormationViewFourTwoThreeOne(),
//         // FormationViewFourThreeThree(),
//       ],
//     );
//   }
// }

class CustomLayout extends StatefulWidget {
  @override
  State<CustomLayout> createState() => _CustomLayoutState();
}

class _CustomLayoutState extends State<CustomLayout> {
  Formations formation = Formations.THREE_FOUR_THREE;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          FootballPitchBackgroundView(),
          // FormationViewFourFourTwo(),
          // FormationViewFourTwoThreeOne(),
          // FormationViewFourThreeThree(),
          FormationView(formation: this.formation),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.refresh),
        backgroundColor: Colors.blue,
        onPressed: () {
          setState(() {
            formation =
                Formations.values[Random().nextInt(Formations.values.length)];
          });
        },
      ),
    );
  }
}

class FormationView extends StatelessWidget {
  late final Formations formation;

  FormationView({required this.formation});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: _generateFormation(formation),
    );
  }

  Widget _generateFormation(Formations formation) {
    switch (formation) {
      case Formations.FOUR_FOUR_TWO:
        return FormationViewFourFourTwo();
      case Formations.FOUR_TWO_THREE_ONE:
        return FormationViewFourTwoThreeOne();
      case Formations.FOUR_THREE_THREE:
        return FormationViewFourThreeThree();
      case Formations.THREE_FOUR_THREE:
        return FormationThreeFourThree();
    }
  }
}

class FormationThreeFourThree extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: MAEGIN_XXLARGE),
      child: Column(
        children: [
          GridView.count(
            crossAxisCount: 3,
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            children: List.generate(3, (index) => PlayerView()),
          ),
          SizedBox(height: MediaQuery.of(context).size.height / 25),
          GridView.count(
            crossAxisCount: 4,
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            children: List.generate(4, (index) => PlayerView()),
          ),
          SizedBox(height: MediaQuery.of(context).size.height / 15),
          GridView.count(
            crossAxisCount: 3,
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            children: List.generate(3, (index) => PlayerView()),
          ),
          SizedBox(height: MediaQuery.of(context).size.height / 25),
          PlayerView(isGoalKeeper: true),
        ],
      ),
    );
  }
}

class FormationViewFourThreeThree extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: MAEGIN_XXLARGE),
      child: Column(
        children: [
          GridView.count(
            crossAxisCount: 3,
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            children: List.generate(3, (index) => PlayerView()),
          ),
          SizedBox(height: MediaQuery.of(context).size.height / 25),
          GridView.count(
            crossAxisCount: 3,
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            children: List.generate(3, (index) => PlayerView()),
          ),
          SizedBox(height: MediaQuery.of(context).size.height / 15),
          GridView.count(
            crossAxisCount: 4,
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            children: List.generate(4, (index) => PlayerView()),
          ),
          SizedBox(height: MediaQuery.of(context).size.height / 15),
          PlayerView(isGoalKeeper: true),
        ],
      ),
    );
  }
}

class FormationViewFourTwoThreeOne extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: MAEGIN_XXLARGE),
      child: Column(
        children: [
          PlayerView(
            isGoalKeeper: false,
          ),
          SizedBox(height: MediaQuery.of(context).size.height / 25),
          GridView.count(
            crossAxisCount: 3,
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            children: List.generate(3, (index) => PlayerView()),
          ),
          SizedBox(height: MediaQuery.of(context).size.height / 40),
          GridView.count(
            crossAxisCount: 2,
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            children: List.generate(2, (index) => PlayerView()),
          ),
          SizedBox(height: MediaQuery.of(context).size.height / 50),
          GridView.count(
            crossAxisCount: 4,
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            children: List.generate(4, (index) => PlayerView()),
          ),
          SizedBox(height: MediaQuery.of(context).size.height / 50),
          PlayerView(isGoalKeeper: true),
        ],
      ),
    );
  }
}

class FormationViewFourFourTwo extends StatelessWidget {
  const FormationViewFourFourTwo({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: MAEGIN_XXLARGE),
      child: Column(
        children: [
          GridView.count(
            crossAxisCount: 2,
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            children: List.generate(2, (index) => PlayerView()),
          ),
          SizedBox(height: MediaQuery.of(context).size.height / 25),
          GridView.count(
            crossAxisCount: 4,
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            children: List.generate(4, (index) => PlayerView()),
          ),
          SizedBox(height: MediaQuery.of(context).size.height / 15),
          GridView.count(
            crossAxisCount: 4,
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            children: List.generate(4, (index) => PlayerView()),
          ),
          SizedBox(height: MediaQuery.of(context).size.height / 15),
          PlayerView(
            isGoalKeeper: true,
          )
        ],
      ),
    );
  }
}

class PlayerView extends StatelessWidget {
  final bool isGoalKeeper;

  PlayerView({this.isGoalKeeper = false});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Container(
          width: 32,
          height: 32,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(32),
            color: (isGoalKeeper) ? Colors.yellow : Colors.blue,
          ),
        ),
      ),
    );
  }
}

class FootballPitchBackgroundView extends StatelessWidget {
  const FootballPitchBackgroundView({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      child: Image.asset(
        'assets/images/footballPitch.png',
        width: double.infinity,
        height: double.infinity,
        fit: BoxFit.fill,
      ),
    );
  }
}
