import 'package:flutter/material.dart';
import 'package:foodul/view/categories/viewmodel/categories_view_model.dart';
import 'package:kartal/kartal.dart';

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
      onPageBuilder: (BuildContext context, CategoriesViewModel value) =>
          Scaffold(
        appBar: AppBar(
          backgroundColor: context.colorScheme.background,
          elevation: 0,
          leading: IconButton(
            onPressed: () {},
            icon: const Icon(Icons.arrow_back_ios_new_rounded),
            color: context.colorScheme.tertiary,
          ),
        ),
        body: Container(
          color: context.colorScheme.background,
        ),
      ),
    );
  }
}
