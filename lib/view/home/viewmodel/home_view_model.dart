// import 'package:easy_localization/src/public_ext.dart';
// import 'package:flutter/material.dart';
// import 'package:kartal/kartal.dart';
// import 'package:mobx/mobx.dart';
// import 'package:provider/src/provider.dart';

// import '../../../core/base/viewmodel/base_view_model.dart';
// import '../../../core/constants/image/svg_constants.dart';
// import '../../../core/init/lang/locale_keys.g.dart';
// import '../../../core/init/notifier/init_notifier.dart';
// import '../../_product/cards/statu/statu_model.dart';
// import '../../login/model/init_model.dart';
// import '../model/home_model.dart';
// import '../service/home_service.dart';
// import '../service/i_home_service.dart';

// part 'home_view_model.g.dart';

// class HomeViewModel = _HomeViewModelBase with _$HomeViewModel;

// abstract class _HomeViewModelBase with Store, BaseViewModel {
//   @override
//   void setContext(BuildContext context) => this.context = context;

//   late IHomeService homeService;

//   List<StatuModel> statuIcons = [];

//   late String suggestionCount;

//   @observable
//   HomeModel homeResult = HomeModel();

//   @observable
//   ObservableList<ObservableList<int>> suggestionsCount = ObservableList.of([
//     ObservableList.of([]),
//     ObservableList.of([]),
//     ObservableList.of([]),
//   ]);

//   @observable
//   ActiveUser activeUser = ActiveUser();

//   @override
//   void init() async {
//     homeService = HomeService(vexanaManager.networkManager);
//     suggestionCount = LocaleKeys.homeView_suggestionCount.tr();
//     await fetchHome();
//     statuIcons = [
//       StatuModel(
//         SVGImageConstants.instance.bulb,
//         context!.colorScheme.secondary,
//         LocaleKeys.homeView_statuDescs_newSuggestion.tr(),
//         2,
//       ),
//       StatuModel(
//         SVGImageConstants.instance.multiply,
//         context!.colorScheme.error,
//         LocaleKeys.homeView_statuDescs_rejected.tr(),
//         0,
//       ),
//       StatuModel(
//         SVGImageConstants.instance.clipboard,
//         context!.colorScheme.secondary,
//         LocaleKeys.homeView_statuDescs_waitsControl.tr(),
//         4,
//       ),
//       StatuModel(
//         SVGImageConstants.instance.network,
//         context!.colorScheme.secondary,
//         LocaleKeys.homeView_statuDescs_assigned.tr(),
//         3,
//       ),
//       StatuModel(
//         SVGImageConstants.instance.edit,
//         context!.colorScheme.secondary,
//         LocaleKeys.homeView_statuDescs_inProgress.tr(),
//         4,
//       ),
//       StatuModel(
//         SVGImageConstants.instance.clock,
//         context!.colorScheme.error,
//         LocaleKeys.homeView_statuDescs_overdue.tr(),
//         6,
//       ),
//       StatuModel(
//         SVGImageConstants.instance.check,
//         context!.colorScheme.secondary,
//         LocaleKeys.homeView_statuDescs_inRevision.tr(),
//         7,
//       ),
//       StatuModel(
//         SVGImageConstants.instance.all_done,
//         context!.colorScheme.onBackground,
//         LocaleKeys.homeView_statuDescs_completed.tr(),
//         8,
//       ),
//     ];
//     for (var i = 0; i < 3; i++) {
//       for (var j = 0; j < statuIcons.length; j++) {
//         suggestionsCount[i].add(getTotalAccordingToTab(j, i));
//       }
//     }
//     activeUser = context!.read<InitNotifier>().activeUser;
//   }

//   @observable
//   bool isLoading = false;

//   @action
//   void isLoadingChange() {
//     isLoading = !isLoading;
//   }

//   @observable
//   int selectedTab = 0;

//   @action
//   void changeSelectedTab(int index) {
//     selectedTab = index;
//   }

//   @observable
//   double draggableRatio = 0.0;

//   @action
//   void changeRatio(double value) {
//     final padding = MediaQuery.of(context!).padding;
//     draggableRatio = (context!.height - value) /
//         (context!.height - padding.top - padding.bottom);
//   }

//   @observable
//   double draggableHeightRatio = 0.0;

//   @observable
//   bool isTop = false;

//   @action
//   int getTotal(int statu, List<Statics>? list) {
//     if (list != null) {
//       Statics? found = list.firstWhere((statics) => statics.iId == statu,
//           orElse: () => Statics());
//       return found.getTotal ?? 0;
//     } else {
//       return 0;
//     }
//   }

//   @action
//   int getTotalAccordingToTab(int index, int tab) {
//     int total = 0;
//     if (tab == 0) {
//       total = getTotal(
//         statuIcons[index].statu,
//         homeResult.staticsOfMe,
//       );
//     } else if (tab == 1) {
//       total = getTotal(
//         statuIcons[index].statu,
//         homeResult.staticsOfWorkflow,
//       );
//     } else if (tab == 2) {
//       total = getTotal(
//         statuIcons[index].statu,
//         homeResult.staticsOfSolution,
//       );
//     }
//     return total;
//   }

//   @action
//   Future<void> fetchHome() async {
//     isLoadingChange();
//     final response = await homeService.fetchInitMobile();
//     if (response!.type == true) {
//       homeResult = response.data;
//       ActiveUser activeUser = context!.read<InitNotifier>().getActiveUser;
//       suggestionCount = suggestionCount.replaceAll(
//           '@count', activeUser.approvedSuggestionsCount.toString());
//       suggestionCount =
//           suggestionCount.replaceAll('@point', activeUser.userPoint.toString());
//     } else {
//       showMessage(response);
//     }

//     isLoadingChange();
//   }
// }
