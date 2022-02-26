import 'package:flutter/material.dart';

// import '../../../view/_product/bottomsheet/custom_bottom_sheet.dart';
import '../../constants/enums/bottom_sheet_enum.dart';
import '../../init/cache/locale_manager.dart';
import '../../init/navigation/navigation_service.dart';
import '../../init/network/vexana_manager.dart';
import '../model/base_response_model.dart';

abstract class BaseViewModel {
  BuildContext? context;

  VexanaManager vexanaManager = VexanaManager.instance;
  LocaleManager localeManager = LocaleManager.instance;
  NavigationService navigation = NavigationService.instance;

  void setContext(BuildContext context);
  void init();

  void showMessage(BaseResponseModel? model) {
    if (model == null) return;
    ScaffoldMessenger.of(context!).showSnackBar(
      SnackBar(
        behavior: SnackBarBehavior.floating,
        content: Text(
          model.message ?? model.type.toString(),
        ),
        backgroundColor: model.type! ? Colors.green : Colors.red,
      ),
    );
  }

  // void showCustomBottomSheetVariant(
  //   BottomSheetVariant variant, {
  //   Function()? successClick,
  //   required String subtitle,
  //   required String title,
  //   Function()? cancelClick,
  // }) {
  //   CustomBottomSheet.variant(
  //     context!,
  //     variant,
  //     successClick: successClick,
  //     cancelClick: cancelClick,
  //     title: title,
  //     subtitle: subtitle,
  //   ).show();
  // }

  // void showCustomBottomSheet(Widget body) {
  //   CustomBottomSheet(
  //     context!,
  //     body: body,
  //     enableDrag: true,
  //     isDismissible: true,
  //   ).show();
  // }
}
