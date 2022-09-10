class GameModel {
  final String name;
  final String image;
  final double speed, health, attack;

  GameModel({
    required this.name,
    required this.image,
    required this.speed,
    required this.health,
    required this.attack,
  });
}

final List<GameModel> heroes = [
  GameModel(
    name: 'Bombardier',
    image: 'assets/images/player1.png',
    speed: 18.0,
    health: 60.0,
    attack: 80.0,
  ),
  GameModel(
    name: 'Cow Master',
    image: 'assets/images/player2.png',
    speed: 28.0,
    health: 55.0,
    attack: 70.0,
  ),
  GameModel(
    name: 'Bar Bar Green',
    image: 'assets/images/player3.png',
    speed: 30.0,
    health: 90.0,
    attack: 88.0,
  ),
];
