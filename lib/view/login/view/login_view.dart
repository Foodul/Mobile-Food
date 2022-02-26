import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:foodul/core/base/view/base_widget.dart';
import 'package:foodul/core/constants/image/svg_constants.dart';
import 'package:foodul/view/login/viewmodel/login_view_model.dart';
import 'package:kartal/kartal.dart';

class LoginView extends StatelessWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseView<LoginViewModel>(
      viewModel: LoginViewModel(),
      onModelReady: (model) {
        model.setContext(context);
        model.init();
      },
      onPageBuilder: (BuildContext context, LoginViewModel viewModel) =>
          Scaffold(
              body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SvgPicture.asset(SVGImageConstants.instance.amblemLogo),
          Text('Welcome to', style: context.textTheme.headline1),
          Text(
            'Foodul',
            style: context.textTheme.headline2!
                .copyWith(color: context.colorScheme.primary),
          ),
        ],
      )),
    );
  }
}
