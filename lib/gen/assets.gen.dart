/// GENERATED CODE - DO NOT MODIFY BY HAND
/// *****************************************************
///  FlutterGen
/// *****************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: directives_ordering,unnecessary_import,implicit_dynamic_list_literal,deprecated_member_use

import 'package:flutter/widgets.dart';

class $AssetsAudioGen {
  const $AssetsAudioGen();

  /// File path: assets/audio/background.mp3
  String get background => 'assets/audio/background.mp3';

  /// File path: assets/audio/effect.mp3
  String get effect => 'assets/audio/effect.mp3';

  /// List of all assets
  List<String> get values => [background, effect];
}

class $AssetsImagesGen {
  const $AssetsImagesGen();

  /// File path: assets/images/background.png
  AssetGenImage get background =>
      const AssetGenImage('assets/images/background.png');

  /// File path: assets/images/dash_idle.png
  AssetGenImage get dashIdle =>
      const AssetGenImage('assets/images/dash_idle.png');

  /// File path: assets/images/dash_jump.png
  AssetGenImage get dashJump =>
      const AssetGenImage('assets/images/dash_jump.png');

  /// File path: assets/images/dash_walk.png
  AssetGenImage get dashWalk =>
      const AssetGenImage('assets/images/dash_walk.png');

  /// File path: assets/images/layer_all.png
  AssetGenImage get layerAll =>
      const AssetGenImage('assets/images/layer_all.png');

  /// File path: assets/images/layer_dust.png
  AssetGenImage get layerDust =>
      const AssetGenImage('assets/images/layer_dust.png');

  /// File path: assets/images/layer_one.png
  AssetGenImage get layerOne =>
      const AssetGenImage('assets/images/layer_one.png');

  /// File path: assets/images/layer_three.png
  AssetGenImage get layerThree =>
      const AssetGenImage('assets/images/layer_three.png');

  /// File path: assets/images/layer_two.png
  AssetGenImage get layerTwo =>
      const AssetGenImage('assets/images/layer_two.png');

  /// File path: assets/images/layer_zero.png
  AssetGenImage get layerZero =>
      const AssetGenImage('assets/images/layer_zero.png');

  /// File path: assets/images/map_components.png
  AssetGenImage get mapComponents =>
      const AssetGenImage('assets/images/map_components.png');

  /// List of all assets
  List<AssetGenImage> get values => [
        background,
        dashIdle,
        dashJump,
        dashWalk,
        layerAll,
        layerDust,
        layerOne,
        layerThree,
        layerTwo,
        layerZero,
        mapComponents
      ];
}

class $AssetsLicensesGen {
  const $AssetsLicensesGen();

  $AssetsLicensesPoppinsGen get poppins => const $AssetsLicensesPoppinsGen();
}

class $AssetsTilesGen {
  const $AssetsTilesGen();

  /// File path: assets/tiles/level_one_map.tmx
  String get levelOneMap => 'assets/tiles/level_one_map.tmx';

  /// List of all assets
  List<String> get values => [levelOneMap];
}

class $AssetsLicensesPoppinsGen {
  const $AssetsLicensesPoppinsGen();

  /// File path: assets/licenses/poppins/OFL.txt
  String get ofl => 'assets/licenses/poppins/OFL.txt';

  /// List of all assets
  List<String> get values => [ofl];
}

class Assets {
  Assets._();

  static const $AssetsAudioGen audio = $AssetsAudioGen();
  static const $AssetsImagesGen images = $AssetsImagesGen();
  static const $AssetsLicensesGen licenses = $AssetsLicensesGen();
  static const $AssetsTilesGen tiles = $AssetsTilesGen();
}

class AssetGenImage {
  const AssetGenImage(this._assetName);

  final String _assetName;

  Image image({
    Key? key,
    AssetBundle? bundle,
    ImageFrameBuilder? frameBuilder,
    ImageErrorWidgetBuilder? errorBuilder,
    String? semanticLabel,
    bool excludeFromSemantics = false,
    double? scale,
    double? width,
    double? height,
    Color? color,
    Animation<double>? opacity,
    BlendMode? colorBlendMode,
    BoxFit? fit,
    AlignmentGeometry alignment = Alignment.center,
    ImageRepeat repeat = ImageRepeat.noRepeat,
    Rect? centerSlice,
    bool matchTextDirection = false,
    bool gaplessPlayback = false,
    bool isAntiAlias = false,
    String? package,
    FilterQuality filterQuality = FilterQuality.low,
    int? cacheWidth,
    int? cacheHeight,
  }) {
    return Image.asset(
      _assetName,
      key: key,
      bundle: bundle,
      frameBuilder: frameBuilder,
      errorBuilder: errorBuilder,
      semanticLabel: semanticLabel,
      excludeFromSemantics: excludeFromSemantics,
      scale: scale,
      width: width,
      height: height,
      color: color,
      opacity: opacity,
      colorBlendMode: colorBlendMode,
      fit: fit,
      alignment: alignment,
      repeat: repeat,
      centerSlice: centerSlice,
      matchTextDirection: matchTextDirection,
      gaplessPlayback: gaplessPlayback,
      isAntiAlias: isAntiAlias,
      package: package,
      filterQuality: filterQuality,
      cacheWidth: cacheWidth,
      cacheHeight: cacheHeight,
    );
  }

  ImageProvider provider({
    AssetBundle? bundle,
    String? package,
  }) {
    return AssetImage(
      _assetName,
      bundle: bundle,
      package: package,
    );
  }

  String get path => _assetName;

  String get keyName => _assetName;
}
