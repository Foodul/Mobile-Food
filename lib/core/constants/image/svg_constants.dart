class SVGImageConstants {
  static SVGImageConstants? _instace;
  static SVGImageConstants get instance =>
      _instace ??= SVGImageConstants._init();

  SVGImageConstants._init();

  /// example
  /// final example = 'example'.toSVG;
  final oneri_logo = 'logo'.toSVG;
  final menu_icon = 'menu'.toSVG;
  final process_owner_icon = 'process_owner'.toSVG;
  final solution_owner_icon = 'solution_owner'.toSVG;
  final bookmark = 'bookmark'.toSVG;
  final bulb = 'bulb'.toSVG;
  final multiply = 'multiply'.toSVG;
  final clipboard = 'clipboard'.toSVG;
  final network = 'network'.toSVG;
  final edit = 'edit'.toSVG;
  final clock = 'clock'.toSVG;
  final check = 'check'.toSVG;
  final all_done = 'all_done'.toSVG;
  final award = 'award'.toSVG;
  final arrow_right = 'arrow_right'.toSVG;
  final plus = 'plus'.toSVG;
  final suggest_item_icon = 'suggest_list_item_icon'.toSVG;
  final calendar = 'calendar'.toSVG;
  final situation_icon = 'sitemap'.toSVG;
  final home = 'home'.toSVG;
  final suggestions = 'suggestions'.toSVG;
  final notifications = 'notifications'.toSVG;
  final profile = 'profile'.toSVG;
  final filter_back = 'filter_back'.toSVG;
  final filter = 'filter'.toSVG;
  final search = 'search'.toSVG;
  final search_not_found = 'search_not_found'.toSVG;
  final fileUploadIcon = 'fileUploadIcon'.toSVG;
  final documentFile = 'documentFile'.toSVG;
  final successSheetBackground = 'successSheetBackground'.toSVG;
  final attach = 'attach'.toSVG;
  final file = 'file'.toSVG;
  final gallery_image = 'gallery_image'.toSVG;
  final telegram = 'telegram'.toSVG;
  final commentInfo = 'comment_info'.toSVG;
  final non_filled_calendar = 'non_filled_calendar'.toSVG;
  final phone = 'phone'.toSVG;
  final email = 'email'.toSVG;
  final close = 'close'.toSVG;
  final done = 'done'.toSVG;
  final info = 'info'.toSVG;
  final arrow_left = 'arrow-left'.toSVG;
  // Notification Icons
  final notification_0 = '0_workflowOwnerNotFound'.toSVG;
  final notification_1 = '1_suggestionCreatedWorkflowOwner'.toSVG;
  final notification_2 = '2_suggestionRejected'.toSVG;
  final notification_3 = '3_suggestionAssignedProcessOwner'.toSVG;
  final notification_4 = '4_suggestionDeadlineAdded'.toSVG;
  final notification_5 = '5_suggestionWaitsApproval'.toSVG;
  final notification_6 = '6_suggestionApprovedProcessOwner'.toSVG;
  final notification_7 = '7_suggestionPaid'.toSVG;
  final notification_8 = '8_suggestionUnpaid'.toSVG;
  final notification_9 = '9_suggestionComment'.toSVG;
  final notification_10 = '10_suggestionDeadlinePassed'.toSVG;
  final notification_11 = '11_suggestionSentToRevision'.toSVG;
  final notification_12 = '12_suggestionRevisionDone'.toSVG;
  //profile
  final company = 'company'.toSVG;
  final editProfile = 'edit_profile'.toSVG;
  final help = 'help'.toSVG;
  final mail = 'mail'.toSVG;
  final reports = 'reports'.toSVG;
  final language = 'language'.toSVG;
  final password = 'password'.toSVG;
  final whatis = 'whatis'.toSVG;
  final logout = 'logout'.toSVG;
  final awardBig = 'award_big'.toSVG;
  final userPlus = 'user_plus'.toSVG;
  final checkFillIcon = 'check_fill_icon'.toSVG;
  final cameraIcon = 'camera_icon'.toSVG;
  //Suggestion Detail
  final solutionOwnerAssignment = 'file-check'.toSVG;
  final suggestionRejected = 'reject_suggestion'.toSVG;
  final deadlineAdded = 'calendar'.toSVG;
  final waitsProcessOwnerApproval = 'document-info'.toSVG;
  final waitsProcessOwnerApprovalAgain = 'file-redo-alt'.toSVG;
  final waitsSuggestionOwnerApproval = 'file_find'.toSVG;
  final anonymWaitsProcessOwnerApproval = 'anonymous_suggestion'.toSVG;
  final suggestionCompleted = 'file-done'.toSVG;
  final suggestionRejectedProcessOwner = 'file-redo-alt'.toSVG;
  final reason = 'reason'.toSVG;
  final suggestionRejectedSolutionOwner = 'repeat'.toSVG;
  final suggestionSentToRevision = 'edit-alt'.toSVG;
  final suggestionRevisionDone = 'check-circle'.toSVG;
  final circle_progress = 'circle_progress'.toSVG;
  final options = 'options'.toSVG;

  final question = 'question'.toSVG;
  final quarterIcon1 = 'quarter1_icon'.toSVG;
  final quarterIcon2 = 'quarter2_icon'.toSVG;
  final quarterIcon3 = 'quarter3_icon'.toSVG;
  final quarterIcon4 = 'quarter4_icon'.toSVG;
}

extension SVGImageConstantsExtension on String {
  String get toSVG => 'assets/svg/$this.svg';
}
