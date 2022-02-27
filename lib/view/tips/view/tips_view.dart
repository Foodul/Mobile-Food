import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../../core/base/view/base_widget.dart';
import '../../../core/constants/navigation/navigation_constants.dart';
import '../viewmodel/tips_view_model.dart';
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
      onPageBuilder: (BuildContext context, TipsViewModel viewModel) => Stack(
        children: [
          Scaffold(
            // extendBodyBehindAppBar: true,
            backgroundColor: context.colorScheme.background,
            body: SingleChildScrollView(
              physics: const ClampingScrollPhysics(),
              child: Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    alignment: Alignment.topRight,
                    image: AssetImage(ImageConstants.instance.vegetables),
                    // fit: BoxFit.cover,
                  ),
                ),
                child: Column(
                  children: [
                    AppBar(
                      elevation: 0,
                      backgroundColor: Colors.transparent,
                      title: Text(
                        LocaleKeys.Tips_title.tr(),
                        style: context.textTheme.headline5!.copyWith(
                            color: context.colorScheme.tertiaryContainer),
                      ),
                    ),
                    AlertCard(
                      lightbulb: SVGImageConstants.instance.lightbulb,
                      alertText:
                          'By consuming ice cream, you consume as much carbon as driving a car for 5 hours.',
                    ),
                    ListView.builder(
                      padding: EdgeInsets.zero,
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: viewModel.data.length,
                      itemBuilder: (_, i) => TipsCard(
                        onTap: () {
                          viewModel.navigation.navigateToPage(
                              path: NavigationConstants.TIPS_DETAIL);
                        },
                        text: viewModel.data[i].text!,
                        tipsImage: viewModel.data[i].tipsImage!,
                        title: viewModel.data[i].title!,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
