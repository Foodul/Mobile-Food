import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:foodul/core/base/view/base_widget.dart';
import 'package:foodul/view/tips/viewmodel/tips_view_model.dart';
import 'package:kartal/kartal.dart';

import '../../../core/components/tips_card.dart';
import '../../../core/components/widget_alert_card.dart';
import '../../../core/constants/image/image_constants.dart';
import '../../../core/constants/image/svg_constants.dart';
import '../../../core/init/lang/locale_keys.g.dart';
import '../../home/model/home_model.dart';

class TipsView extends StatelessWidget {
  const TipsView({Key? key, required}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var Tips;
    return BaseView<TipsViewModel>(
      viewModel: TipsViewModel(),
      onModelReady: (model) {
        model.setContext(context);
        model.init();
      },
      onPageBuilder: (BuildContext context, TipsViewModel viewModel) =>
          Scaffold(
        backgroundColor: context.colorScheme.background,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: context.colorScheme.background,
          title: Text(
            LocaleKeys.Tips_title.tr(),
            style: context.textTheme.headline5!
                .copyWith(color: context.colorScheme.tertiaryContainer),
          ),
        ),
        body: Center(
          child: ListView(
            children: [
              AlertCard(
                lightbulb: SVGImageConstants.instance.lightbulb,
                alertText:
                    'Dondurma tüketerek ....  yapmak kadar karbon tükemi yapmaktasınız.',
              ),
              ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: viewModel.data.length,
                itemBuilder: (_, i) => TipsCard(
                  onTap: () {},
                  text: viewModel.data[i].text!,
                  tipsImage: viewModel.data[i].tipsImage!,
                  title: viewModel.data[i].title!,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
