import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import '../../../core/constants/navigation/navigation_constants.dart';
import '../../../core/init/lang/locale_keys.g.dart';
import '../../../core/init/navigation/navigation_route.dart';
import '../../_product/widgets/cards/categories_card_widget.dart';
import '../viewmodel/categories_view_model.dart';
import 'package:kartal/kartal.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../../../core/base/view/base_widget.dart';

class CategoriesView extends StatelessWidget {
  const CategoriesView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseView<CategoriesViewModel>(
      viewModel: CategoriesViewModel(),
      onModelReady: (model) {
        model.setContext(context);
      },
      onPageBuilder: (BuildContext context, CategoriesViewModel viewModel) =>
          Scaffold(
        appBar: AppBar(
          title: Text(
            LocaleKeys.CategoriesView_find.tr(),
            style: context.textTheme.headline6!
                .copyWith(color: context.colorScheme.tertiary),
          ),
          backgroundColor: context.colorScheme.background,
          elevation: 0,
          leading: IconButton(
            onPressed: () {},
            icon: const Icon(Icons.arrow_back_ios_new_rounded),
            color: context.colorScheme.tertiary,
          ),
        ),
        body: Container(
          padding: context.horizontalPaddingLow * 2,
          color: context.colorScheme.background,
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25.0),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.2),
                      spreadRadius: 1,
                      blurRadius: 2,
                      offset: const Offset(0, 0), // changes position of shadow
                    ),
                  ]),
              child: findTextInputArea(context),
            ),
            SizedBox(
              height: context.height * .025,
            ),
            Text(
              LocaleKeys.CategoriesView_categories.tr(),
              style: context.textTheme.headline4!
                  .copyWith(color: context.colorScheme.tertiary),
            ),
            SizedBox(
              height: context.height * .03,
            ),
            Expanded(
              child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                      maxCrossAxisExtent: 200,
                      childAspectRatio: 3 / 2.6,
                      crossAxisSpacing: 20,
                      mainAxisSpacing: 20),
                  itemCount: viewModel.categories.length,
                  itemBuilder: (BuildContext ctx, index) {
                    return GestureDetector(
                      onTap: () {
                        viewModel.navigation.navigateToPage(
                            path: NavigationConstants.CATEGORIES_DETAIL,
                            data: viewModel.categories[index]);
                      },
                      child: CategoriesCard(
                          imageUrl:
                              viewModel.categories[index].image.toString(),
                          title: viewModel.categories[index].title.toString()),
                    );
                  }),
            ),
          ]),
        ),
      ),
    );
  }

  TextFormField findTextInputArea(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        prefixIcon: Icon(
          Icons.search,
          color: context.colorScheme.onTertiaryContainer,
        ),
        contentPadding: EdgeInsets.symmetric(
            horizontal: context.lowValue, vertical: context.mediumValue / 1.7),
        hintText: LocaleKeys.homeView_findFood.tr(),
        filled: true,
        fillColor: Colors.white,
        disabledBorder: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.circular(25.0),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.circular(25.0),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.circular(25.0),
        ),
      ),
    );
  }
}
