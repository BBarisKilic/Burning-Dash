import 'package:burning_dash/game/game.dart';
import 'package:flame/components.dart';
import 'package:flame_behaviors/flame_behaviors.dart';

const kGravity = 9.8;

class MoveBehavior extends Behavior<Dash> with HasGameRef<BurningDashGame> {
  @override
  void update(double dt) {
    // _applyAirResistance(dt);
    _setPositionX(dt);
    _setPositionY(dt);
    _applyGravity(dt);

    super.update(dt);
  }

  // void _applyAirResistance(double dt) {
  //   if (parent.velocity.x > 0) {
  //     parent.velocity.x -= GameWorld.kAirResistance * dt;

  //     if (parent.velocity.x <= 1) parent.velocity.x = 0;
  //   }

  //   if (parent.velocity.x < 0) {
  //     parent.velocity.x += GameWorld.kAirResistance * dt;

  //     if (parent.velocity.x >= -1) parent.velocity.x = 0;
  //   }
  // }

  void _setPositionX(double dt) {
    if (parent.position.x < parent.size.x / 2) {
      parent.velocity.x = 0;
      parent.position.x = parent.size.x / 2;
    } else if (parent.position.x >
        gameRef.camera.viewport.size.x - parent.size.x / 2) {
      parent.velocity.x = 0;
      parent.position.x =
          gameRef.camera.visibleWorldRect.width - parent.size.x / 2;
    } else {
      parent.position.x += parent.velocity.x * dt;
    }
  }

  void _setPositionY(double dt) {
    parent.position.y += parent.velocity.y * dt;
  }

  void _applyGravity(double dt) {
    if (parent.velocity.y > 0 || !parent.isBottomTouching) {
      parent.velocity.y += kGravity * dt;
    }
  }
}
