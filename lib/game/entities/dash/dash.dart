import 'package:burning_dash/game/entities/dash/behaviors/ground_colliding_behavior.dart';
import 'package:burning_dash/game/entities/dash/dash_sprite.dart';
import 'package:burning_dash/game/entities/dash/states/dash_state.dart';
import 'package:burning_dash/game/game.dart';
import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:flame_behaviors/flame_behaviors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

export 'behaviors/behaviors.dart';

class Dash extends PositionedEntity {
  Dash({
    required Vector2 position,
  }) : this._(
          position: position,
          behaviors: [
            MoveBehavior(),
            GroundCollidingBehavior(),
            KeyboardBehavior(keyboardKey: LogicalKeyboardKey.space),
          ],
          dashSprite: DashSprite(
            textureSize: _dashSize,
            state: DashState.idle,
          ),
        );

  Dash._({
    required super.position,
    required Iterable<Behavior> behaviors,
    required DashSprite dashSprite,
  })  : _dashSprite = dashSprite,
        velocity = Vector2.zero(),
        super(
          anchor: Anchor.bottomCenter,
          size: dashSprite.size,
          behaviors: [
            PropagatingCollisionBehavior(RectangleHitbox()),
            ...behaviors,
          ],
          children: [dashSprite],
        );

  @visibleForTesting
  Dash.test({
    required Vector2 position,
    required Iterable<Behavior> behaviors,
  }) : this._(
          position: position,
          behaviors: behaviors,
          dashSprite: DashSprite(
            textureSize: _dashSize,
            state: DashState.idle,
          ),
        );

  final DashSprite _dashSprite;

  final Vector2 velocity;

  bool isBottomTouching = false;

  bool isTopTouching = false;

  bool isLeftSideTouching = false;

  bool isRightSideTouching = false;

  bool isFlipped = false;

  bool isWalking = false;

  bool isUsingElevator = false;

  static final _dashSize = Vector2.all(128);

  void updateState({required DashState state}) =>
      _dashSprite.updateState(state: state);
}
