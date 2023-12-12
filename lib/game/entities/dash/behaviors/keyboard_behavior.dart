import 'package:burning_dash/game/entities/dash/states/dash_state.dart';
import 'package:burning_dash/game/game.dart';
import 'package:flame/components.dart';
import 'package:flame_behaviors/flame_behaviors.dart';
import 'package:flutter/services.dart';

class KeyboardBehavior extends Behavior<Dash>
    with KeyboardHandler, HasGameRef<BurningDashGame> {
  KeyboardBehavior({
    required this.keyboardKey,
  });

  final LogicalKeyboardKey keyboardKey;

  @override
  bool onKeyEvent(RawKeyEvent event, Set<LogicalKeyboardKey> keysPressed) {
    if (keysPressed.contains(keyboardKey) && parent.velocity.x == 0) {
      parent.velocity.x = 60;
    } else {
      if (keysPressed.contains(keyboardKey) && event is RawKeyDownEvent) {
        parent.velocity.y = -120;
      } else {
        parent.velocity.y = 0;
      }
    }

    return super.onKeyEvent(event, keysPressed);
  }

  @override
  void update(double dt) {
    _updateBoyState();

    super.update(dt);
  }

  void _updateBoyState() {
    if (parent.velocity.y != 0) {
      parent.updateState(state: DashState.jumping);
    } else if (parent.velocity.x != 0) {
      parent.updateState(state: DashState.walking);
    } else {
      parent.updateState(state: DashState.idle);
    }
  }
}
