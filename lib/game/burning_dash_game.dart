import 'package:audioplayers/audioplayers.dart';
import 'package:burning_dash/game/game.dart';
import 'package:burning_dash/gen/assets.gen.dart';
import 'package:burning_dash/l10n/l10n.dart';
import 'package:flame/cache.dart';
import 'package:flame/components.dart';
import 'package:flame/experimental.dart';
import 'package:flame/game.dart';
import 'package:flame/input.dart';
import 'package:flame_tiled/flame_tiled.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class BurningDashGame extends FlameGame
    with HasKeyboardHandlerComponents, HasCollisionDetection {
  BurningDashGame({
    required this.l10n,
    required this.effectPlayer,
    required this.textStyle,
    required Images images,
  }) {
    super.images = images;
  }

  final AppLocalizations l10n;

  final AudioPlayer effectPlayer;

  final TextStyle textStyle;

  TiledComponent? map;

  double? mapWidth;

  double? mapHeight;

  Dash? dash;

  @override
  bool get debugMode => true;

  @override
  Color backgroundColor() => const Color(0xFF2A48DF);

  @override
  Future<void> onLoad() async {
    await _loadCameraAndWorld();
    await _loadMap();
    await _loadDash();
    await _loadGrounds();
    _setCamera();

    return super.onLoad();
  }

  Future<void> _loadCameraAndWorld() async {
    world = World();
    camera = CameraComponent(world: world);

    await addAll([camera, world]);
  }

  Future<void> _loadMap() async {
    map ??= await TiledComponent.load(
      Assets.tiles.levelOneMap,
      Vector2.all(32),
      prefix: '',
    );

    if (map == null) throw Exception('Map not found');

    mapWidth = map!.tileMap.map.width * map!.tileMap.destTileSize.x;
    mapHeight = map!.tileMap.map.height * map!.tileMap.destTileSize.y;

    world.add(map!);
  }

  Future<void> _loadDash() async {
    final objectGroup = map?.tileMap.getLayer<ObjectGroup>('LevelStart');

    dash ??= Dash(
      position: Vector2(
        objectGroup?.objects.first.x ?? 0,
        objectGroup?.objects.first.y ?? 0,
      ),
    );

    world.add(dash!);
  }

  Future<void> _loadGrounds() async {
    final objectGroup = map?.tileMap.getLayer<ObjectGroup>('GroundColliders');

    objectGroup?.objects.forEach((tiledObject) {
      world.add(
        Ground(
          size: Vector2(tiledObject.width, tiledObject.height),
          position: Vector2(tiledObject.x, tiledObject.y),
        ),
      );
    });
  }

  void _setCamera() {
    camera.viewport.size = Vector2(mapWidth!, mapHeight!);
    camera.viewfinder.visibleGameSize = Vector2(0, mapHeight!);
    camera.viewfinder.position = size / 2;

    camera
      ..follow(dash!, horizontalOnly: true)
      ..setBounds(
        Rectangle.fromLTWH(0, 0, mapWidth!, mapHeight!),
        considerViewport: true,
      );
  }

  @override
  @mustCallSuper
  KeyEventResult onKeyEvent(
    RawKeyEvent event,
    Set<LogicalKeyboardKey> keysPressed,
  ) {
    super.onKeyEvent(event, keysPressed);

    return KeyEventResult.handled;
  }
}
