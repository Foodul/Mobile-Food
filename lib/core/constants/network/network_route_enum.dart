// ignore_for_file: constant_identifier_names

enum NetworkRoutes {
  DEFAULT,
  TEST,
  LOGIN,
  INIT,
  HOME,
  SUGGESTION_REGISTER,
  WORKFLOW_PREDICT,
  SUGGESTION_PREDICT,
  SUGGESTIONS,
  SUGGESTION_DETAIL,
  SUGGESTION_COMMENTS,
  SUGGESTION_COMMENT_CREATE,
  SUGGESTION_DEADLINE,
  NOTIFICATIONS,
  PROFILE,
  SURVEYS,
  SURVEY_ANSWER,
  ASSIGNEMENT,
  USERS,
  SUGGESTIONS_ASSIGN,
  PROFIL_UPDATE,
  PROFIL_UPDATE_IMAGE,
  CHANGE_PASSWORD,
  REPORT,
  REVISE_SUGGESTION,
  UPDATE_PROCESS,
  UPDATE_PROCESS_OWNER,
  COMPLETE_PROCESS,
}

extension NetworkRoutesString on NetworkRoutes {
  String get rawValue {
    switch (this) {
      case NetworkRoutes.DEFAULT:
        return '';
      // case NetworkRoutes.TEST:
      //   return 'public/registry/verify';
      default:
        throw Exception('Routes Not Found');
    }
  }
}
