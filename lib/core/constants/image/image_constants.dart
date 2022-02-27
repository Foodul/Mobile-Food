class ImageConstants {
  static ImageConstants? _instace;

  static ImageConstants get instance => _instace ??= ImageConstants._init();

  ImageConstants._init();

  /// example
  /// final example = 'example'.toPNG;
  // final oneriLogo = 'logo'.toPNG;
  // final onBoardBanner = 'onboarding'.toPNG;
  // final successSheetBackground = 'success_sheet_background'.toPNG;
  // final warningBackground = 'warning_sheet_background'.toPNG;
  // final warningSheetIcon = 'warning_sheet_icon'.toPNG;
  // final successSheetIcon = 'success_sheet_icon'.toPNG;
  // final userPointBackground = 'user_point_background'.toPNG;
  // final personImage = 'personImage'.toPNG;
  final splashBG = 'splashBG'.toPNG;
  final limon = 'limon'.toPNG;
  final orange = 'orange'.toPNG;
  final waste = 'waste'.toPNG;
  final vegetables = 'vegetables'.toPNG;
  final krep = 'krep'.toPNG;
  final beef = 'beef'.toPNG;
}

extension ImageConstantsExtension on String {
  String get toPNG => 'assets/image/$this.png';
  String get toJPG => 'assets/image/$this.jpg';
}
