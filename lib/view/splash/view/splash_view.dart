import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:kartal/kartal.dart';

import '../../../../core/base/view/base_widget.dart';
import '../../../core/constants/image/image_constants.dart';
import '../../../core/constants/image/svg_constants.dart';
import '../viewmodel/splash_view_model.dart';

class SplashView extends StatefulWidget {
  const SplashView({Key? key}) : super(key: key);

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> with TickerProviderStateMixin {
  late final AnimationController _controller = AnimationController(
    lowerBound: 0.2,
    duration: context.durationNormal,
    vsync: this,
  )..repeat(reverse: true, period: const Duration(milliseconds: 1250));
  late final Animation<double> _animation = CurvedAnimation(
    parent: _controller,
    curve: Curves.fastOutSlowIn,
  );

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BaseView<SplashViewModel>(
      viewModel: SplashViewModel(),
      onModelReady: (model) {
        model.setContext(context);
        model.init();
      },
      onPageBuilder: (BuildContext context, SplashViewModel viewModel) =>
          Scaffold(
        body: Center(
          child: Container(
            width: double.infinity,
            height: context.height,
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(ImageConstants.instance.splashBG),
                  fit: BoxFit.cover),
            ),
            child: ScaleTransition(
              scale: _animation,
              child: SvgPicture.asset(
                SVGImageConstants.instance.logo,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
