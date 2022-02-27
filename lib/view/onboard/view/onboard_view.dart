import 'package:easy_localization/src/public_ext.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import '../../../core/constants/navigation/navigation_constants.dart';
import 'package:kartal/kartal.dart';

import '../../../../core/base/view/base_widget.dart';
import '../../../../core/init/lang/locale_keys.g.dart';
import '../_product/_widgets/on_board_circle.dart';
import '../viewmodel/onboard_view_model.dart';

class OnboardView extends StatelessWidget {
  const OnboardView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseView<OnboardViewModel>(
      viewModel: OnboardViewModel(),
      onModelReady: (model) {
        model.setContext(context);
        model.init();
      },
      onPageBuilder: (BuildContext context, OnboardViewModel viewModel) =>
          Scaffold(
        backgroundColor: context.colorScheme.surface,
        body: Column(
          children: [
            Expanded(
              flex: 6,
              child: Container(
                  decoration: BoxDecoration(
                    color: context.colorScheme.surface,
                    // borderRadius: const BorderRadius.only(
                    //   bottomLeft: Radius.circular(50),
                    //   bottomRight: Radius.circular(50),
                    // ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const Spacer(),
                      Expanded(
                        flex: 10,
                        child: PageView.builder(
                          controller: viewModel.pageController,
                          itemCount: viewModel.onBoardItems.length,
                          onPageChanged: (value) {
                            viewModel.changeCurrentIndex(value);
                          },
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: context.horizontalPaddingMedium,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Spacer(),
                                  Image.asset(viewModel.onBoardItems[index]),
                                  const Spacer(
                                    flex: 2,
                                  ),
                                  Text(
                                    viewModel.onBoardTitle[index],
                                    textAlign: TextAlign.left,
                                    style:
                                        context.textTheme.headline1!.copyWith(
                                      color:
                                          context.colorScheme.tertiaryContainer,
                                    ),
                                  )
                                ],
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  )),
            ),
            Expanded(
              flex: 4,
              child: Padding(
                padding: context.paddingMedium,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      flex: 4,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        shrinkWrap: true,
                        itemCount: viewModel.onBoardItems.length,
                        itemBuilder: (context, index) => Observer(
                          builder: (_) => OnBoardCircle(
                              isSelected: viewModel.currentIndex == index),
                        ),
                      ),
                    ),
                    const Spacer(),
                    ElevatedButton(
                      onPressed: () {},
                      child: Text('Create a new acount'),
                      style: TextButton.styleFrom(
                          minimumSize: Size(context.width, 60)),
                    ),
                    const Spacer(),
                    OutlinedButton(
                      onPressed: () async {
                        await context.navigateToReset(
                          NavigationConstants.LOGIN,
                        );
                      },
                      child: Text('Login'),
                      style: TextButton.styleFrom(
                          minimumSize: Size(context.width, 60)),
                    ),
                    const Spacer(flex: 1),
                    Text(
                      'By continuing you agree Foodul Terms of Services & Privacy Policy ',
                      style: context.textTheme.bodyText1,
                      textAlign: TextAlign.center,
                    ),
                    const Spacer(flex: 4),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
