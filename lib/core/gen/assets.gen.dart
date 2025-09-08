// dart format width=80

/// GENERATED CODE - DO NOT MODIFY BY HAND
/// *****************************************************
///  FlutterGen
/// *****************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: deprecated_member_use,directives_ordering,implicit_dynamic_list_literal,unnecessary_import

import 'package:flutter/widgets.dart';

class $AssetsAnimationsGen {
  const $AssetsAnimationsGen();

  /// File path: assets/animations/Empty_Search.json
  String get emptySearch => 'assets/animations/Empty_Search.json';

  /// List of all assets
  List<String> get values => [emptySearch];
}

class $AssetsIconsGen {
  const $AssetsIconsGen();

  /// File path: assets/icons/Home_Icon.png
  AssetGenImage get homeIcon =>
      const AssetGenImage('assets/icons/Home_Icon.png');

  /// File path: assets/icons/Language_icon.png
  AssetGenImage get languageIcon =>
      const AssetGenImage('assets/icons/Language_icon.png');

  /// File path: assets/icons/Search_Icon.png
  AssetGenImage get searchIcon =>
      const AssetGenImage('assets/icons/Search_Icon.png');

  /// File path: assets/icons/Theme_icon.png
  AssetGenImage get themeIcon =>
      const AssetGenImage('assets/icons/Theme_icon.png');

  /// List of all assets
  List<AssetGenImage> get values => [
    homeIcon,
    languageIcon,
    searchIcon,
    themeIcon,
  ];
}

class $AssetsImagesGen {
  const $AssetsImagesGen();

  /// File path: assets/images/Splash_dark.png
  AssetGenImage get splashDark =>
      const AssetGenImage('assets/images/Splash_dark.png');

  /// File path: assets/images/Splash_light.png
  AssetGenImage get splashLight =>
      const AssetGenImage('assets/images/Splash_light.png');

  /// File path: assets/images/business_dark.png
  AssetGenImage get businessDark =>
      const AssetGenImage('assets/images/business_dark.png');

  /// File path: assets/images/busniess_light.png
  AssetGenImage get busniessLight =>
      const AssetGenImage('assets/images/busniess_light.png');

  /// File path: assets/images/entertainment_dark.png
  AssetGenImage get entertainmentDark =>
      const AssetGenImage('assets/images/entertainment_dark.png');

  /// File path: assets/images/entertainment_light.png
  AssetGenImage get entertainmentLight =>
      const AssetGenImage('assets/images/entertainment_light.png');

  /// File path: assets/images/general_dark.png
  AssetGenImage get generalDark =>
      const AssetGenImage('assets/images/general_dark.png');

  /// File path: assets/images/general_light.png
  AssetGenImage get generalLight =>
      const AssetGenImage('assets/images/general_light.png');

  /// File path: assets/images/health_dark.png
  AssetGenImage get healthDark =>
      const AssetGenImage('assets/images/health_dark.png');

  /// File path: assets/images/health_light.png
  AssetGenImage get healthLight =>
      const AssetGenImage('assets/images/health_light.png');

  /// File path: assets/images/science_dark.png
  AssetGenImage get scienceDark =>
      const AssetGenImage('assets/images/science_dark.png');

  /// File path: assets/images/science_light.png
  AssetGenImage get scienceLight =>
      const AssetGenImage('assets/images/science_light.png');

  /// File path: assets/images/sport_light.png
  AssetGenImage get sportLight =>
      const AssetGenImage('assets/images/sport_light.png');

  /// File path: assets/images/sports_dark.png
  AssetGenImage get sportsDark =>
      const AssetGenImage('assets/images/sports_dark.png');

  /// File path: assets/images/technology_dark.png
  AssetGenImage get technologyDark =>
      const AssetGenImage('assets/images/technology_dark.png');

  /// File path: assets/images/technology_light.png
  AssetGenImage get technologyLight =>
      const AssetGenImage('assets/images/technology_light.png');

  /// List of all assets
  List<AssetGenImage> get values => [
    splashDark,
    splashLight,
    businessDark,
    busniessLight,
    entertainmentDark,
    entertainmentLight,
    generalDark,
    generalLight,
    healthDark,
    healthLight,
    scienceDark,
    scienceLight,
    sportLight,
    sportsDark,
    technologyDark,
    technologyLight,
  ];
}

class Assets {
  const Assets._();

  static const $AssetsAnimationsGen animations = $AssetsAnimationsGen();
  static const $AssetsIconsGen icons = $AssetsIconsGen();
  static const $AssetsImagesGen images = $AssetsImagesGen();
}

class AssetGenImage {
  const AssetGenImage(
    this._assetName, {
    this.size,
    this.flavors = const {},
    this.animation,
  });

  final String _assetName;

  final Size? size;
  final Set<String> flavors;
  final AssetGenImageAnimation? animation;

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
    bool gaplessPlayback = true,
    bool isAntiAlias = false,
    String? package,
    FilterQuality filterQuality = FilterQuality.medium,
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

  ImageProvider provider({AssetBundle? bundle, String? package}) {
    return AssetImage(_assetName, bundle: bundle, package: package);
  }

  String get path => _assetName;

  String get keyName => _assetName;
}

class AssetGenImageAnimation {
  const AssetGenImageAnimation({
    required this.isAnimation,
    required this.duration,
    required this.frames,
  });

  final bool isAnimation;
  final Duration duration;
  final int frames;
}
