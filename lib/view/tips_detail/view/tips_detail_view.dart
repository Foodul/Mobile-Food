import 'dart:developer';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:foodul/core/constants/image/image_constants.dart';
import 'package:kartal/kartal.dart';

import '../../../core/base/view/base_widget.dart';
import '../../../core/components/button/custom_icon_button.dart';
import '../../../core/constants/image/svg_constants.dart';
import '../../../core/constants/navigation/navigation_constants.dart';
import '../../../core/init/lang/locale_keys.g.dart';
import '../viewmodel/tips_detail_view_model.dart';

class TipsDetailView extends StatelessWidget {
  const TipsDetailView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseView<TipsDetailViewModel>(
      viewModel: TipsDetailViewModel(),
      onModelReady: (model) {
        model.setContext(context);
        model.init();
      },
      onPageBuilder: (BuildContext context, TipsDetailViewModel viewModel) =>
          Scaffold(
        appBar: AppBar(
          leading: CustomIconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            iconAsset: SVGImageConstants.instance.chevronleft,
          ),
          backgroundColor: context.colorScheme.background,
          elevation: 0,
          title: Text(
            LocaleKeys.TipsDetail.tr(),
            style: context.textTheme.headline5!
                .copyWith(color: context.colorScheme.tertiaryContainer),
          ),
        ),
        body: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: context.normalValue,
            vertical: context.lowValue,
          ),
          child: SingleChildScrollView(
            physics: const ClampingScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  viewModel.data[0].mainText!,
                  style: context.textTheme.headline1!.copyWith(
                      color: context.colorScheme.tertiaryContainer,
                      fontWeight: FontWeight.w600),
                ),
                SizedBox(height: context.dynamicWidth(0.03)),
                Text(
                  viewModel.data[0].title!,
                  style: context.textTheme.headline5!.copyWith(
                      color: context.colorScheme.onTertiary,
                      fontWeight: FontWeight.w500),
                ),
                SizedBox(height: context.dynamicWidth(0.05)),
                SizedBox(
                  // width: double.infinity,
                  height: context.dynamicHeight(0.35),
                  child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: viewModel.data[0].photos!.length,
                      itemBuilder: (_, index) {
                        return SizedBox(
                          // width: context.width,
                          child: Image.asset(
                            viewModel.data[0].photos![index],
                          ),
                        );
                      }),
                ),
                SizedBox(height: context.dynamicWidth(0.05)),
                Row(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        color: Color(0xffDFDFDF),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      width: context.dynamicWidth(0.15),
                      child: MaterialButton(
                        onPressed: () {},
                        child:
                            SvgPicture.asset(SVGImageConstants.instance.share),
                        padding: EdgeInsets.all(16),
                        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                      ),
                    ),
                    SizedBox(width: context.dynamicWidth(0.04)),
                    Container(
                      decoration: BoxDecoration(
                        color: Color(0xffDFDFDF),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      width: context.dynamicWidth(0.15),
                      child: MaterialButton(
                        onPressed: () {},
                        child:
                            SvgPicture.asset(SVGImageConstants.instance.like),
                        padding: EdgeInsets.all(16),
                        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: context.dynamicWidth(0.05)),
                Text(
                  viewModel.data[0].text!,
                  style: context.textTheme.headline5!.copyWith(
                      color: context.colorScheme.onTertiary,
                      fontWeight: FontWeight.w500),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
