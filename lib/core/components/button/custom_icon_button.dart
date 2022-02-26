import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:kartal/src/context_extension.dart';

class CustomIconButton extends StatelessWidget {
  final Function() onPressed;
  final String iconAsset;
  final double? padding;
  final ShapeBorder? shape;

  const CustomIconButton({
    Key? key,
    required this.onPressed,
    required this.iconAsset,
    this.padding,
    this.shape,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: context.dynamicWidth(0.15),
      child: MaterialButton(
        onPressed: onPressed,
        child: SvgPicture.asset(
          iconAsset,
        ),
        padding: EdgeInsets.all(padding ?? 16),
        shape: shape ?? const CircleBorder(),
        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
      ),
    );
  }
}
