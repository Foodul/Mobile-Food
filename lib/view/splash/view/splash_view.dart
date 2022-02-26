import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:foodul/core/constants/image/image_constants.dart';
import 'package:foodul/core/constants/image/svg_constants.dart';
import 'package:kartal/kartal.dart';

class SplashView extends StatelessWidget {
  const SplashView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      width: double.infinity,
      height: context.height,
      decoration: BoxDecoration(
        image: DecorationImage(
            image: AssetImage(ImageConstants.instance.splashBG),
            fit: BoxFit.cover),
      ),
      child: Center(
          child: SvgPicture.asset(
        SVGImageConstants.instance.logo,
        width: context.dynamicWidth(0.5),
      )),
    ));
  }
}
