import 'package:flutter/material.dart';
import 'package:foodul/core/base/view/base_widget.dart';
import 'package:foodul/view/tips/viewmodel/tips_view_model.dart';
import 'package:kartal/kartal.dart';

import '../../../core/components/widget_alert_card.dart';
import '../../../core/constants/image/image_constants.dart';
import '../../../core/constants/image/svg_constants.dart';

class TipsView extends StatelessWidget {
  const TipsView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseView<TipsViewModel>(
      viewModel: TipsViewModel(),
      onModelReady: (model) {
        model.setContext(context);
        model.init();
      },
      onPageBuilder: (BuildContext context, TipsViewModel viewModel) =>
          Scaffold(
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
                itemBuilder: (_, i) => ListTile(
                  title: Text(viewModel.data[i].title ?? 'a'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
