import 'package:flame/components.dart';

import 'package:ember_quest/ember_quest.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class EmberPlayer extends SpriteAnimationComponent
    with KeyboardHandler, HasGameRef<EmberQuestGame> {
  int horizontalDirection = 0;
  final Vector2 velocity = Vector2.zero();
  final double moveSpeed = 200;

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

  @override
  bool onKeyEvent(RawKeyEvent event, Set<LogicalKeyboardKey> keyPressed) {
    horizontalDirection = 0;
    horizontalDirection += (keyPressed.contains(LogicalKeyboardKey.keyA) ||
            keyPressed.contains(LogicalKeyboardKey.arrowLeft))
        ? -1
        : 0;
    horizontalDirection += (keyPressed.contains(LogicalKeyboardKey.keyD) ||
            keyPressed.contains(LogicalKeyboardKey.arrowRight))
        ? 1
        : 0;
    return true;
  }

  @override
  void update(double dt) {
    velocity.x = horizontalDirection * moveSpeed;
    position += velocity * dt;
    if (horizontalDirection < 0 && scale.x > 0) {
      flipHorizontally();
    } else if (horizontalDirection > 0 && scale.x < 0) {
      flipHorizontally();
    }
    super.update(dt);
  }
}
