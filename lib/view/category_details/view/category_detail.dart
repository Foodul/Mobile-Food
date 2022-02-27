import 'dart:developer';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:kartal/kartal.dart';

import '../../../core/base/view/base_widget.dart';
import '../../../core/components/widget_size.dart';
import '../../../core/constants/navigation/navigation_constants.dart';
import '../../../core/init/lang/locale_keys.g.dart';
import '../../_product/widgets/cards/categories_card_widget.dart';
import '../../_product/widgets/chiptabs/chip_tab.dart';
import '../model/category_detail_model.dart';
import '../model/food_detail_navigation_model.dart';
import '../view_model/category_view_model.dart';

class CategoryDetailView extends StatefulWidget {
  int? tabIndex;

  CategoryDetailView({
    Key? key,
    this.tabIndex,
  }) : super(key: key);

  @override
  State<CategoryDetailView> createState() => _CategoryDetailViewState();
}

class _CategoryDetailViewState extends State<CategoryDetailView> {
  @override
  Widget build(BuildContext context) {
    return BaseView<CategoryDetailViewModel>(
        viewModel: CategoryDetailViewModel(widget.tabIndex),
        onModelReady: (model) {
          model.setContext(context);
          model.init();
        },
        onPageBuilder: (BuildContext context,
                CategoryDetailViewModel viewModel) =>
            Scaffold(
              appBar: AppBar(
                leading: IconButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    icon: const Icon(Icons.arrow_back_ios),
                    color: context.colorScheme.tertiary),
                backgroundColor: context.colorScheme.background,
                elevation: 0,
                title: Text(LocaleKeys.CategoryDetail_foods.tr()),
              ),
              body: Container(
                color: context.colorScheme.background,
                child: Column(children: [
                  Observer(builder: (_) {
                    return Container(
                      padding: EdgeInsets.only(left: context.normalValue),
                      height: context.dynamicWidth(0.09),
                      child: ListView.builder(
                        controller: viewModel.controller,
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        itemCount: viewModel.categories.length,
                        itemBuilder: (context, index) {
                          return Observer(builder: (_) {
                            return GestureDetector(
                              onTap: () {
                                // viewModel.selectedTab = index;
                                setState(() {
                                  viewModel.changeSelectedTab(index, true);
                                });
                                // viewModel.changeSelectTab2(index);
                              },
                              child: WidgetSize(
                                  onChange: (Size size) => {
                                        viewModel.tabWidths.add(size.width),
                                      },
                                  child: ChipTab(
                                    isSelected: index == viewModel.selectedTab,
                                    text: viewModel.categories[index].title
                                        .toString(),
                                    isBottomSheet: false,
                                  )),
                            );
                          });
                        },
                      ),
                    );
                  }),
                  Expanded(
                    child: PageView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        controller: viewModel.pageController,
                        itemCount: viewModel
                            .categories[widget.tabIndex!].details!.length,
                        onPageChanged: (value) => {
                              viewModel.changeSelectedTab(value, false),
                            },
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: GridView.builder(
                                gridDelegate:
                                    const SliverGridDelegateWithMaxCrossAxisExtent(
                                        maxCrossAxisExtent: 200,
                                        childAspectRatio: 3 / 2.6,
                                        crossAxisSpacing: 20,
                                        mainAxisSpacing: 20),
                                itemCount: viewModel
                                    .categories[viewModel.selectedTab]
                                    .details!
                                    .length,
                                itemBuilder: (BuildContext ctx, int index) {
                                  return GestureDetector(
                                    onTap: viewModel
                                            .categories[viewModel.selectedTab]
                                            .details!
                                            .isNotEmpty
                                        ? () {
                                            viewModel.navigation.navigateToPage(
                                                path: NavigationConstants
                                                    .FOOD_DETAIL,
                                                data: FoodDetailNavigationModel(
                                                    path: viewModel
                                                        .categories[viewModel
                                                            .selectedTab]
                                                        .details![index]
                                                        .image!,
                                                    isNetwork: true,
                                                    name: viewModel
                                                        .categories[viewModel
                                                            .selectedTab]
                                                        .details![index]
                                                        .title
                                                        .toString()));
                                          }
                                        : () => {},
                                    child: CategoriesCard(
                                        imageUrl: viewModel
                                            .categories[viewModel.selectedTab]
                                            .details![index]
                                            .image
                                            .toString(),
                                        title: viewModel
                                            .categories[viewModel.selectedTab]
                                            .details![index]
                                            .title
                                            .toString()),
                                  );
                                }),
                          );
                        }),
                  ),
                ]),
              ),
            ));
  }
}
