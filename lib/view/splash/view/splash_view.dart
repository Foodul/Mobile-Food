import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';

class SplashView extends StatelessWidget {
  const SplashView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            Text(
              'h1',
              style: context.textTheme.headline1,
            ),
            Text(
              'h2',
              style: context.textTheme.headline2,
            ),
            Text(
              'h3',
              style: context.textTheme.headline3,
            ),
            Text(
              'h4',
              style: context.textTheme.headline4,
            ),
            Text(
              'body',
              style: context.textTheme.bodyText1,
            ),
            Text(
              'body2',
              style: context.textTheme.bodyText2,
            ),
          ],
        ),
      ),
    );
  }
}
