class SVGImageConstants {
  static SVGImageConstants? _instace;
  static SVGImageConstants get instance =>
      _instace ??= SVGImageConstants._init();

  SVGImageConstants._init();

  /// example
  /// final example = 'example'.toSVG;
  final logo = 'logo'.toSVG;
  final amblemLogo = 'amblemLogo'.toSVG;
  final close = 'close'.toSVG;
  final flashAuto = 'flash_auto'.toSVG;
  final flashOff = 'flash_off'.toSVG;
  final flashOn = 'flash_on'.toSVG;
  final flash = 'flash'.toSVG;
  final flip = 'flip'.toSVG;
  final gallery = 'gallery'.toSVG;
  final circle = 'circle'.toSVG;
  final send = 'send'.toSVG;
  final star = 'star'.toSVG;
  final calori = 'calori'.toSVG;
}

extension SVGImageConstantsExtension on String {
  String get toSVG => 'assets/svg/$this.svg';
}
