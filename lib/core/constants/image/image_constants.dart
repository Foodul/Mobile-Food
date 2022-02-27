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
  final banana = 'banana'.toPNG;
  final profil = 'profil'.toPNG;
  final profilIcon = 'profil_icon'.toPNG;

  final onBoard1 = 'onBoard1'.toPNG;
  final onBoard2 = 'onBoard2'.toPNG;
  final onBoard3 = 'onBoard3'.toPNG;

  final on_board_enter_bg = 'on_board_enter_bg'.toPNG;
  final on_board_enter_right = 'on_board_enter_right'.toPNG;
}

extension ImageConstantsExtension on String {
  String get toPNG => 'assets/image/$this.png';
  String get toJPG => 'assets/image/$this.jpg';
}
