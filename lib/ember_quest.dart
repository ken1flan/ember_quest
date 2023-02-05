import 'package:flame/game.dart';

import 'package:ember_quest/actors/ember_player.dart';

class EmberQuestGame extends FlameGame {
  EmberQuestGame();

  late EmberPlayer _ember;

  @override
  Future<void> onLoad() async {
    await images.loadAll([
      'block.png',
      'ember.png',
      'heart_half.png',
      'heart.png',
      'star.png',
      'water_enemy.png'
    ]);
    _ember = EmberPlayer(
      position: Vector2(128, canvasSize.y - 70),
    );
    add(_ember);
  }
}
