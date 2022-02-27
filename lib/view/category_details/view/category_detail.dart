import 'dart:developer';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:kartal/kartal.dart';

import 'package:foodul/core/base/view/base_widget.dart';
import 'package:foodul/core/components/widget_size.dart';
import 'package:foodul/core/init/lang/locale_keys.g.dart';
import 'package:foodul/view/_product/widgets/cards/categories_card_widget.dart';
import 'package:foodul/view/_product/widgets/chiptabs/chip_tab.dart';
import 'package:foodul/view/category_details/model/category_detail_model.dart';
import 'package:foodul/view/category_details/view_model/category_view_model.dart';

class CategoryDetailView extends StatefulWidget {
  Object? data;

  CategoryDetailView({
    Key? key,
    this.data,
  }) : super(key: key);

  @override
  State<CategoryDetailView> createState() => _CategoryDetailViewState();
}

class _CategoryDetailViewState extends State<CategoryDetailView> {
  @override
  Widget build(BuildContext context) {
    return BaseView<CategoryDetailViewModel>(
        viewModel: CategoryDetailViewModel(),
        onModelReady: (model) {
          model.setContext(context);
          model.init();
          model.setConstructorData(widget.data);
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
                        controller: viewModel.pageController,
                        itemCount: viewModel.categoryDetail!.details!.length,
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
                                itemCount:
                                    viewModel.categoryDetail!.details!.length,
                                itemBuilder: (BuildContext ctx, index) {
                                  return CategoriesCard(
                                      imageUrl: viewModel
                                          .categoryDetail!.details![index].image
                                          .toString(),
                                      title: viewModel
                                          .categoryDetail!.details![index].title
                                          .toString());
                                }),
                          );
                        }),
                  ),
                ]),
              ),
            ));
  }
}
