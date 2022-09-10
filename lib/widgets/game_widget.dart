import 'package:flutter/material.dart';
import 'dart:math' as math;
import 'package:video_game_3d_ui/model/game_model.dart';
import 'package:video_game_3d_ui/screens/detail_screen.dart';
import 'skills_widget.dart';

// Degree / Radians converter
const double degrees2Radians = math.pi / 180.0;
const double radians2Degrees = 180.0 / math.pi;

double degrees(double radians) => radians * radians2Degrees;
double radians(double degrees) => degrees * degrees2Radians;

class GameWidget extends StatelessWidget {
  final GameModel hero;
  final double rowHeight;

  const GameWidget({
    Key? key,
    required this.hero,
    this.rowHeight = 282,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 18),
      child: SizedBox(
        height: rowHeight,
        child: Stack(
          alignment: Alignment.center,
          children: [
            Transform.translate(
              offset: const Offset(-10, 0),
              child: Transform(
                alignment: FractionalOffset.center,
                transform: Matrix4.identity()
                  ..setEntry(3, 2, 0.01)
                  ..rotateY(radians(1.5)),
                child: Container(
                  height: 216,
                  margin: const EdgeInsets.symmetric(horizontal: 40),
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.1),
                    borderRadius: const BorderRadius.all(Radius.circular(22)),
                  ),
                ),
              ),
            ),
            Transform.translate(
              offset: const Offset(-44, 0),
              child: Transform(
                alignment: FractionalOffset.center,
                transform: Matrix4.identity()
                  ..setEntry(3, 2, 0.01)
                  ..rotateY(radians(8)),
                child: Container(
                  height: 188,
                  margin: const EdgeInsets.symmetric(horizontal: 40),
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.4),
                    borderRadius: const BorderRadius.all(Radius.circular(22)),
                  ),
                ),
              ),
            ),
            Row(
              children: [
                Transform.translate(
                  offset: const Offset(-30, 0),
                  child: Hero(
                    tag: hero.name,
                    child: Image.asset(
                      hero.image,
                      width: rowHeight,
                      height: rowHeight,
                    ),
                  ),
                ),
              ],
            ),
            Align(
              alignment: Alignment.centerRight,
              child: Container(
                margin: const EdgeInsets.only(right: 58),
                padding: const EdgeInsets.symmetric(vertical: 34),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    SkillsWidget(
                      progress: hero.speed,
                      child: Image.asset(
                        speed,
                      ),
                    ),
                    SkillsWidget(
                      progress: hero.health,
                      child: Image.asset(
                        heart,
                      ),
                    ),
                    SkillsWidget(
                      progress: hero.attack,
                      child: Image.asset(
                        knife,
                      ),
                    ),
                    SizedBox(
                      height: 32,
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) {
                                return DetailsScreen(hero);
                              },
                            ),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          primary: Colors.purple,
                        ),
                        child: const Text(
                          'See Details',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 12,
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
