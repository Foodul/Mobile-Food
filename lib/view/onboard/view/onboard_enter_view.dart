import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:foodul/core/constants/image/image_constants.dart';
import 'package:foodul/core/constants/image/svg_constants.dart';
import 'package:foodul/core/constants/navigation/navigation_constants.dart';
import 'package:kartal/kartal.dart';

class OnBoardEnterView extends StatelessWidget {
  const OnBoardEnterView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: context.height,
        width: context.width,
        decoration: BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.cover,
            image: AssetImage(ImageConstants.instance.on_board_enter_bg),
          ),
        ),
        child: Column(
          children: [
            Spacer(),
            Padding(
              padding: context.horizontalPaddingMedium,
              child: Align(
                  alignment: Alignment.centerLeft,
                  child:
                      SvgPicture.asset(SVGImageConstants.instance.amblemLogo)),
            ),
            const Spacer(
              flex: 3,
            ),
            Container(
              height: context.dynamicHeight(0.5),
              width: context.width,
              decoration: BoxDecoration(
                borderRadius:
                    const BorderRadius.vertical(top: Radius.circular(30)),
                color: context.colorScheme.background,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const Spacer(),
                  CircleAvatar(
                    radius: context.dynamicWidth(0.13),
                    backgroundColor: context.colorScheme.surface,
                    child: SvgPicture.asset(
                        SVGImageConstants.instance.cookies_icon),
                  ),
                  const Spacer(),
                  Expanded(
                    flex: 8,
                    child: const text_area(),
                  ),
                  const Spacer(flex: 2),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class text_area extends StatelessWidget {
  const text_area({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.max,
      children: [
        Expanded(
          child: Padding(
            padding: EdgeInsets.only(left: context.mediumValue, right: 0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '''Foodul's\nWelcome''',
                  style: context.textTheme.headline1,
                ),
                const Spacer(),
                Text(
                  'Get started now and explore the features we offer you.',
                  style: context.textTheme.bodyText1!.copyWith(fontSize: 20),
                ),
                const Spacer(
                  flex: 2,
                ),
                Expanded(
                  flex: 5,
                  child: SizedBox(
                    width: context.dynamicWidth(0.5),
                    child: ElevatedButton(
                      onPressed: () async {
                        await context.navigateToReset(
                          NavigationConstants.ON_BOARD,
                        );
                      },
                      child: const Text('Start'),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        Expanded(
          child: Image.asset(ImageConstants.instance.on_board_enter_right,
              alignment: Alignment.centerRight),
        )
      ],
    );
  }
}
