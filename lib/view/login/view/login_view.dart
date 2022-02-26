import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
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
              body: Padding(
        padding: context.paddingMedium,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            header_area(context),
            Expanded(
              flex: 2,
              child: Column(
                children: [
                  Padding(
                    padding: context.verticalPaddingLow,
                    child: Material(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15)),
                      elevation: 10,
                      child: const TextField(),
                    ),
                  ),
                  Padding(
                    padding: context.verticalPaddingLow,
                    child: Material(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15)),
                      elevation: 10,
                      child: const TextField(
                        obscureText: true,
                      ),
                    ),
                  ),
                  Padding(
                      padding: context.verticalPaddingLow,
                      child: Align(
                        alignment: Alignment.centerRight,
                        child: Text(
                          'Forgot Password?',
                          style: context.textTheme.caption!.copyWith(
                              color: context.colorScheme.tertiaryContainer),
                        ),
                      )),
                ],
              ),
            ),
            Expanded(
              child: Column(
                children: [
                  SizedBox(
                    width: double.infinity,
                    height: context.dynamicHeight(0.075),
                    child: ElevatedButton(
                      onPressed: () {},
                      child: Text('Send'),
                    ),
                  ),
                  const Spacer(),
                  // Text(
                  //   'Don’t have an account? Sign up',
                  //   style: context.textTheme.bodyText1!.copyWith(
                  //       color: context.colorScheme.onTertiaryContainer),
                  // ),
                  RichText(
                    text: TextSpan(
                      text: 'Don’t have an account?',
                      style: context.textTheme.bodyText1,
                      children: [
                        TextSpan(
                          recognizer: TapGestureRecognizer()
                            ..onTap = () => print('Tap Here onTap'),
                          text: ' Sign Up',
                          style: context.textTheme.bodyText1!.copyWith(
                              color: context.colorScheme.tertiaryContainer),
                        ),
                      ],
                    ),
                  ),
                  const Spacer()
                ],
              ),
            )
          ],
        ),
      )),
    );
  }

  Expanded header_area(BuildContext context) {
    return Expanded(
      flex: 2,
      child: SizedBox(
        width: context.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Spacer(
              flex: 3,
            ),
            SvgPicture.asset(SVGImageConstants.instance.amblemLogo),
            const Spacer(
              flex: 3,
            ),
            Text(
              'Welcome to',
              style: context.textTheme.headline1,
            ),
            const Spacer(),
            Text(
              'Foodul',
              style: context.textTheme.headline2!
                  .copyWith(color: context.colorScheme.primary),
            ),
            const Spacer(
              flex: 3,
            )
          ],
        ),
      ),
    );
  }
}
