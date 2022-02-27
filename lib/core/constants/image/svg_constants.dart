class SVGImageConstants {
  static SVGImageConstants? _instace;
  static SVGImageConstants get instance =>
      _instace ??= SVGImageConstants._init();

  SVGImageConstants._init();

  /// example
  /// final example = 'example'.toSVG;
  final logo = 'logo'.toSVG;
  final amblemLogo = 'amblemLogo'.toSVG;
  final lightbulb = 'lightbulb'.toSVG;
  final arrowRight = 'arrow-right'.toSVG;
  final like = 'like'.toSVG;
  final share = 'share'.toSVG;
  final chevronleft = 'chevronleft'.toSVG;
  final trending_down = 'trending-down'.toSVG;
  final flash = 'flash'.toSVG;
  final salad = 'salad'.toSVG;
  final gift = 'gift'.toSVG;

  final homeIcon = 'home_icon'.toSVG;
  final qrcodeIcon = 'qrcode_icon'.toSVG;
  final searchIcon = 'search_icon'.toSVG;
  final tipsIcon = 'tips_icon'.toSVG;
  final cookies_icon = 'cookies_icon'.toSVG;
  final on_board_right_icon = 'on_board_right_icon'.toSVG;
}

extension SVGImageConstantsExtension on String {
  String get toSVG => 'assets/svg/$this.svg';
}
