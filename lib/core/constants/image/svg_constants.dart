class SVGImageConstants {
  static SVGImageConstants? _instace;
  static SVGImageConstants get instance =>
      _instace ??= SVGImageConstants._init();

  SVGImageConstants._init();

  /// example
  /// final example = 'example'.toSVG;
  final logo = 'logo'.toSVG;
  final amblemLogo = 'amblemLogo'.toSVG;
  final trending_down = 'trending-down'.toSVG;
  final flash = 'flash'.toSVG;
  final salad = 'salad'.toSVG;
  final gift = 'gift'.toSVG;
}

extension SVGImageConstantsExtension on String {
  String get toSVG => 'assets/svg/$this.svg';
}
