// import 'package:easy_localization/src/public_ext.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_mobx/flutter_mobx.dart';
// import 'package:flutter_svg/svg.dart';
// import 'package:kartal/kartal.dart';
// import 'package:oneri_sistemi_mobile/core/init/notifier/bottom_navigation_notifier.dart';

// import '../../../core/base/view/base_widget.dart';
// import '../../../core/components/avatar/custom_circle_avatar.dart';
// import '../../../core/components/widget_size.dart';
// import '../../../core/constants/image/image_constants.dart';
// import '../../../core/constants/image/svg_constants.dart';
// import '../../../core/constants/navigation/navigation_constants.dart';
// import '../../../core/init/lang/locale_keys.g.dart';
// import '../../_product/cards/statu/statu_info_card.dart';
// import '../../_product/cards/suggestion/create_suggestion_info.dart';
// import '../../_product/cards/suggestion/profile_info_card.dart';
// import '../../_product/chiptabs/chip_model.dart';
// import '../../_product/chiptabs/chip_tabs.dart';
// import '../viewmodel/home_view_model.dart';
// import 'package:provider/src/provider.dart';

// class HomeView extends StatelessWidget {
//   const HomeView({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return BaseView<HomeViewModel>(
//       viewModel: HomeViewModel(),
//       onModelReady: (model) {
//         model.setContext(context);
//         model.init();
//       },
//       onPageBuilder: (BuildContext context, HomeViewModel viewModel) =>
//           Scaffold(
//         appBar: appBar(context, viewModel),
//         body: Observer(builder: (_) {
//           return viewModel.isLoading
//               ? const Center(
//                   child: CircularProgressIndicator(),
//                 )
//               : Stack(
//                   children: [
//                     WidgetSize(
//                       onChange: (Size size) {
//                         viewModel.changeRatio(size.height);
//                       },
//                       child: Padding(
//                         padding: EdgeInsets.only(
//                           left: context.normalValue,
//                           right: context.normalValue,
//                           top: context.normalValue,
//                         ),
//                         child: Column(
//                           mainAxisSize: MainAxisSize.min,
//                           children: [
//                             SizedBox(
//                               height: context.dynamicWidth(0.15),
//                               child: Row(
//                                 mainAxisAlignment:
//                                     MainAxisAlignment.spaceBetween,
//                                 crossAxisAlignment: CrossAxisAlignment.center,
//                                 children: [
//                                   RichText(
//                                     text: TextSpan(
//                                       children: <TextSpan>[
//                                         TextSpan(
//                                           text: LocaleKeys.homeView_hiMessage
//                                                   .tr() +
//                                               ', ',
//                                           style: context.textTheme.headline2,
//                                         ),
//                                         TextSpan(
//                                           text: viewModel.activeUser.name! +
//                                               ' ' +
//                                               viewModel.activeUser.surname!,
//                                           style: context.textTheme.headline4!
//                                               .copyWith(
//                                             color: context
//                                                 .colorScheme.primaryVariant,
//                                           ),
//                                         ),
//                                       ],
//                                     ),
//                                   ),
//                                   CustomCircleAvatar(
//                                     radius: context.dynamicWidth(0.15),
//                                     imageUrl:
//                                         viewModel.activeUser.avatar_img_url!,
//                                   ),
//                                 ],
//                               ),
//                             ),
//                             SizedBox(
//                               height: context.dynamicHeight(0.01),
//                             ),
//                             Container(
//                               width: double.infinity,
//                               height: context.dynamicWidth(0.25),
//                               decoration: BoxDecoration(
//                                 image: DecorationImage(
//                                     fit: BoxFit.cover,
//                                     image: AssetImage(ImageConstants
//                                         .instance.userPointBackground)),
//                                 borderRadius: const BorderRadius.all(
//                                   Radius.circular(12),
//                                 ),
//                               ),
//                               padding: EdgeInsets.only(
//                                 left: context.lowValue,
//                                 right: context.mediumValue,
//                               ),
//                               child: Row(
//                                 children: [
//                                   Row(
//                                     children: [
//                                       SizedBox(
//                                         width: context.dynamicWidth(0.04),
//                                       ),
//                                       SvgPicture.asset(
//                                         SVGImageConstants.instance.awardBig,
//                                       ),
//                                       SizedBox(
//                                         width: context.dynamicWidth(0.05),
//                                       ),
//                                       Text(
//                                         LocaleKeys.profile_totalPoints.tr(),
//                                         style: context.textTheme.headline5!
//                                             .copyWith(
//                                           color: context.colorScheme.surface,
//                                         ),
//                                       ),
//                                     ],
//                                   ),
//                                   const Spacer(),
//                                   Text(
//                                     viewModel.activeUser.userPoint.toString(),
//                                     style:
//                                         context.textTheme.headline2!.copyWith(
//                                       color: context.colorScheme.surface,
//                                     ),
//                                   ),
//                                 ],
//                               ),
//                             ),
//                             SizedBox(
//                               height: context.dynamicHeight(0.02),
//                             ),
//                             Row(
//                               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                               children: [
//                                 ProfileInfoCard(
//                                   icon: SVGImageConstants.instance.check,
//                                   count: viewModel
//                                       .activeUser.approvedSuggestionsCount!,
//                                   desc: LocaleKeys.profile_approvedSuggestions
//                                       .tr(),
//                                   color: context.colorScheme.onBackground,
//                                 ),
//                                 ProfileInfoCard(
//                                   icon: SVGImageConstants.instance.check,
//                                   count:
//                                       viewModel.activeUser.suggestionCount ?? 0,
//                                   desc:
//                                       LocaleKeys.profile_totalSuggestions.tr(),
//                                   color: context.colorScheme.secondary,
//                                 ),
//                               ],
//                             ),
//                             SizedBox(
//                               height: context.dynamicHeight(0.02),
//                             ),
//                             CreateSuggestionInfoCard(
//                               // TODO: navigate to create suggestion page
//                               onPressed: () async => {
//                                 viewModel.navigation.navigateToPage(
//                                     path:
//                                         NavigationConstants.SUGGESTION_REGISTER)
//                               },
//                             ),
//                           ],
//                         ),
//                       ),
//                     ),
//                     viewModel.draggableRatio != 0.0
//                         ? SizedBox.expand(
//                             child: NotificationListener<
//                                 DraggableScrollableNotification>(
//                               onNotification: (DraggableScrollableNotification
//                                   notification) {
//                                 viewModel.draggableHeightRatio =
//                                     notification.extent;
//                                 if (notification.extent > 0.95) {
//                                   viewModel.isTop = true;
//                                 } else {
//                                   viewModel.isTop = false;
//                                 }
//                                 return true;
//                               },
//                               child: DraggableScrollableSheet(
//                                 initialChildSize: viewModel.draggableRatio < 0.2
//                                     ? 0.2
//                                     : viewModel.draggableRatio - 0.2,
//                                 minChildSize: viewModel.draggableRatio < 0.2
//                                     ? 0.2
//                                     : viewModel.draggableRatio - 0.2,
//                                 builder: (
//                                   BuildContext context,
//                                   ScrollController myscrollController,
//                                 ) {
//                                   return Observer(builder: (_) {
//                                     return Container(
//                                       // duration: const Duration(seconds: 0),
//                                       decoration: BoxDecoration(
//                                         color: context.colorScheme.surface,
//                                         borderRadius: BorderRadius.only(
//                                           topLeft: viewModel
//                                                       .draggableHeightRatio ==
//                                                   0
//                                               ? Radius.circular((1.2 -
//                                                       viewModel
//                                                           .draggableRatio) *
//                                                   50)
//                                               : Radius.circular((1 -
//                                                       viewModel
//                                                           .draggableHeightRatio) *
//                                                   50),
//                                           topRight: viewModel
//                                                       .draggableHeightRatio ==
//                                                   0
//                                               ? Radius.circular((1.2 -
//                                                       viewModel
//                                                           .draggableRatio) *
//                                                   50)
//                                               : Radius.circular((1 -
//                                                       viewModel
//                                                           .draggableHeightRatio) *
//                                                   50),
//                                         ),
//                                         boxShadow: [
//                                           BoxShadow(
//                                             color:
//                                                 Colors.black.withOpacity(0.05),
//                                             spreadRadius: 5,
//                                             blurRadius: 15,
//                                           ),
//                                         ],
//                                       ),
//                                       padding: EdgeInsets.only(
//                                         top: context.lowValue,
//                                         // left: context.normalValue,
//                                         // right: context.normalValue,
//                                       ),
//                                       child: ListView(
//                                         controller: myscrollController,
//                                         children: [
//                                           viewModel.isTop
//                                               ? const SizedBox()
//                                               : const Divider(
//                                                   endIndent: 160,
//                                                   indent: 160,
//                                                   thickness: 4,
//                                                   color: Color(0xFFE2E6EC),
//                                                 ),
//                                           Padding(
//                                             padding: EdgeInsets.only(
//                                               left: context.normalValue,
//                                               right: context.normalValue,
//                                             ),
//                                             child: Row(
//                                               mainAxisAlignment:
//                                                   MainAxisAlignment
//                                                       .spaceBetween,
//                                               children: [
//                                                 Text(
//                                                   LocaleKeys
//                                                       .homeView_suggestions
//                                                       .tr(),
//                                                   style: context
//                                                       .textTheme.headline4,
//                                                 ),
//                                                 TextButton(
//                                                   // TODO: navigate to all suggestions tab
//                                                   onPressed: () {
//                                                     Future.microtask(() {
//                                                       context
//                                                           .read<
//                                                               BottomNavigationNotifier>()
//                                                           .setTabIndex(
//                                                               index: 1);
//                                                     });
//                                                   },
//                                                   child: Text(
//                                                     LocaleKeys.seeAll.tr(),
//                                                     style: context
//                                                         .textTheme.headline6,
//                                                   ),
//                                                 )
//                                               ],
//                                             ),
//                                           ),
//                                           Observer(builder: (_) {
//                                             return ChipTabs(
//                                               tabs: [
//                                                 ChipModel(
//                                                   LocaleKeys
//                                                       .homeView_tabs_mySuggestions
//                                                       .tr(),
//                                                   null,
//                                                   () => {
//                                                     viewModel
//                                                         .changeSelectedTab(0)
//                                                   },
//                                                 ),
//                                                 ChipModel(
//                                                   LocaleKeys
//                                                       .homeView_tabs_processOwnership
//                                                       .tr(),
//                                                   SVGImageConstants.instance
//                                                       .process_owner_icon,
//                                                   () => {
//                                                     viewModel
//                                                         .changeSelectedTab(1)
//                                                   },
//                                                 ),
//                                                 ChipModel(
//                                                   LocaleKeys
//                                                       .homeView_tabs_solutionOwnership
//                                                       .tr(),
//                                                   SVGImageConstants.instance
//                                                       .solution_owner_icon,
//                                                   () => {
//                                                     viewModel
//                                                         .changeSelectedTab(2)
//                                                   },
//                                                 ),
//                                               ],
//                                               selectedIndex:
//                                                   viewModel.selectedTab,
//                                             );
//                                           }),
//                                           Padding(
//                                             padding: EdgeInsets.symmetric(
//                                               horizontal: context.normalValue,
//                                               vertical: context.lowValue,
//                                             ),
//                                             child: GridView.builder(
//                                               physics:
//                                                   const NeverScrollableScrollPhysics(),
//                                               shrinkWrap: true,
//                                               gridDelegate:
//                                                   SliverGridDelegateWithFixedCrossAxisCount(
//                                                 childAspectRatio: 2.3,
//                                                 crossAxisCount: 2,
//                                                 mainAxisSpacing:
//                                                     context.lowValue,
//                                                 crossAxisSpacing:
//                                                     context.lowValue,
//                                               ),
//                                               itemCount:
//                                                   viewModel.statuIcons.length,
//                                               itemBuilder: (context, index) {
//                                                 return Observer(builder: (_) {
//                                                   return StatuInfoCard(
//                                                     desc: viewModel
//                                                         .statuIcons[index].text,
//                                                     icon: viewModel
//                                                         .statuIcons[index].icon,
//                                                     count: viewModel
//                                                             .suggestionsCount[
//                                                         viewModel
//                                                             .selectedTab][index],
//                                                     color: viewModel
//                                                         .statuIcons[index]
//                                                         .color,
//                                                   );
//                                                 });
//                                               },
//                                             ),
//                                           ),
//                                           // AutoSizeText(
//                                           //   viewModel.suggestionCount,
//                                           //   textAlign: TextAlign.center,
//                                           //   style: context.textTheme.headline5,
//                                           // ),
//                                           // SizedBox(
//                                           //   height: context.dynamicHeight(0.02),
//                                           // ),
//                                           // CreateSuggestionInfoCard(
//                                           //   // TODO: navigate to create suggestion page
//                                           //   onPressed: () => {},
//                                           // ),
//                                         ],
//                                       ),
//                                     );
//                                   });
//                                 },
//                               ),
//                             ),
//                           )
//                         : const SizedBox(),
//                   ],
//                 );
//         }),
//         floatingActionButton: FloatingActionButton(
//           onPressed: () => {
//             context.navigation
//                 .pushNamed(NavigationConstants.SUGGESTION_REGISTER)
//           },
//           child: SvgPicture.asset(SVGImageConstants.instance.plus),
//         ),
//       ),
//     );
//   }

//   AppBar appBar(BuildContext context, HomeViewModel viewModel) {
//     return AppBar(
//       title: Text(
//         LocaleKeys.homeView_title.tr(),
//         style: context.textTheme.headline5!.copyWith(
//           color: context.colorScheme.primary,
//         ),
//       ),
//       actions: [
//         // CustomAvatarButton(
//         //   onPressed: () => {},
//         //   imageUrl:
//         //       'https://media-exp1.licdn.com/dms/image/C4D03AQHxyy_o6txuKA/profile-displayphoto-shrink_200_200/0/1624642378736?e=1645660800&v=beta&t=sj9tPRWg5MCwdt_rv3hL83zLA3z95fWrhtXFzQ1I_TI',
//         // ),
//         Observer(builder: (_) {
//           return Stack(
//             children: <Widget>[
//               SizedBox(
//                 width: context.dynamicWidth(0.15),
//                 child: MaterialButton(
//                   onPressed: () => {},
//                   child: SvgPicture.asset(
//                     SVGImageConstants.instance.bookmark,
//                     color: context.colorScheme.primary,
//                   ),
//                   padding: context.paddingNormal,
//                   shape: const CircleBorder(),
//                   materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
//                 ),
//               ),
//               Positioned(
//                 right: 15,
//                 top: 13,
//                 child: Container(
//                   decoration: BoxDecoration(
//                     color: context.colorScheme.primary,
//                     borderRadius: BorderRadius.circular(6),
//                     border: Border.all(color: context.colorScheme.surface),
//                   ),
//                   constraints: const BoxConstraints(
//                     minWidth: 12,
//                     minHeight: 12,
//                   ),
//                   child: Text(
//                     viewModel
//                         .getTotal(1, viewModel.homeResult.staticsOfMe)
//                         .toString(),
//                     style: TextStyle(
//                       color: context.colorScheme.surface,
//                       fontSize: 10,
//                     ),
//                     textAlign: TextAlign.center,
//                   ),
//                 ),
//               )
//             ],
//           );
//         }),
//       ],
//     );
//   }
// }
