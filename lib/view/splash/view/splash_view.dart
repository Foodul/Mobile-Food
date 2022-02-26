import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';

class SplashView extends StatelessWidget {
  const SplashView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.colorScheme.primaryVariant,
      body: Center(
        child: Text('Splash'),
      ),
    );
  }
}
