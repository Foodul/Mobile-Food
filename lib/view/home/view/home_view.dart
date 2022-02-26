import 'package:flutter/material.dart';
import 'package:foodul/core/base/view/base_widget.dart';
import 'package:foodul/view/home/viewmodel/home_view_model.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseView<HomeViewModel>(
      viewModel: HomeViewModel(),
      onModelReady: (model) {
        model.setContext(context);
      },
      onPageBuilder: (BuildContext context, HomeViewModel value) => Scaffold(),
    );
  }
}
