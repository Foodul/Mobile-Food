import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:kartal/src/context_extension.dart';

class CustomIconButton extends StatelessWidget {
  final Function() onPressed;
  final String iconAsset;
  final double? padding;
  final ShapeBorder? shape;
  final Color? backgroundColor;
  final Color? iconColor;

  const CustomIconButton({
    Key? key,
    required this.onPressed,
    required this.iconAsset,
    this.padding,
    this.shape,
    this.backgroundColor,
    this.iconColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: context.dynamicWidth(0.15),
      child: MaterialButton(
        elevation: 0,
        color: backgroundColor,
        onPressed: onPressed,
        child: SvgPicture.asset(
          iconAsset,
          color: iconColor,
        ),
        padding: EdgeInsets.all(padding ?? 16),
        shape: shape ?? const CircleBorder(),
        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
      ),
    );
  }
}
