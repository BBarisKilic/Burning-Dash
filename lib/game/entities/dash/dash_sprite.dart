import 'package:burning_dash/game/entities/dash/states/dash_state.dart';
import 'package:burning_dash/gen/assets.gen.dart';
import 'package:flame/components.dart';

class DashSprite extends SpriteAnimationGroupComponent<DashState>
    with HasGameRef {
  DashSprite({
    required Vector2 textureSize,
    required DashState state,
  })  : _state = state,
        _textureSize = textureSize,
        super(size: textureSize / 2);

  final DashState _state;
  final Vector2 _textureSize;

  @override
  Future<void>? onLoad() async {
    final idleImage = gameRef.images.fromCache(Assets.images.dashIdle.path);
    final walkImage = gameRef.images.fromCache(Assets.images.dashWalk.path);
    final jumpImage = gameRef.images.fromCache(Assets.images.dashJump.path);

    final idleAnimation = SpriteAnimation.fromFrameData(
      idleImage,
      SpriteAnimationData.sequenced(
        amount: 16,
        stepTime: 0.125,
        textureSize: _textureSize,
      ),
    );

    final walkAnimation = SpriteAnimation.fromFrameData(
      walkImage,
      SpriteAnimationData.sequenced(
        amount: 16,
        stepTime: 0.125,
        textureSize: _textureSize,
      ),
    );

    final jumpAnimation = SpriteAnimation.fromFrameData(
      jumpImage,
      SpriteAnimationData.range(
        start: 0,
        end: 8,
        amount: 16,
        stepTimes: List.generate(9, (_) => 0.125),
        textureSize: _textureSize,
      ),
    );

    animations = {
      DashState.idle: idleAnimation,
      DashState.walking: walkAnimation,
      DashState.jumping: jumpAnimation,
    };

    current = _state;

    return super.onLoad();
  }

  void updateState({required DashState state}) {
    if (current != state) current = state;
  }
}
