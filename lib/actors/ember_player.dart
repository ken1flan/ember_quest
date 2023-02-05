import 'package:flame/components.dart';

import 'package:ember_quest/ember_quest.dart';

class EmberPlayer extends SpriteAnimationComponent
    with HasGameRef<EmberQuestGame> {
  EmberPlayer({
    required super.position,
  }) : super(size: Vector2.all(64), anchor: Anchor.center);

  @override
  Future<void> onLoad() async {
    animation = SpriteAnimation.fromFrameData(
      game.images.fromCache('ember.png'),
      SpriteAnimationData.sequenced(
        amount: 4,
        stepTime: 0.12,
        textureSize: Vector2.all(16),
      ),
    );
  }
}
