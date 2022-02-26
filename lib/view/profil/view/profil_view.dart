import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:foodul/core/base/view/base_widget.dart';
import 'package:foodul/core/constants/image/image_constants.dart';
import 'package:foodul/view/profil/viewmodel/profil_view_model.dart';
import 'package:kartal/kartal.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseView<ProfilViewModel>(
        viewModel: ProfilViewModel(),
        onModelReady: (model) {
          model.setContext(context);
          model.init();
        },
        onPageBuilder: (BuildContext context, ProfilViewModel viewModel) =>
            Scaffold(
              body: SingleChildScrollView(
                physics: const ClampingScrollPhysics(),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    header_area(context),
                    SizedBox(
                      width: context.width,
                      height: 100,
                      child: ListView.builder(
                        padding: context.horizontalPaddingNormal,
                        scrollDirection: Axis.horizontal,
                        itemCount: viewModel.tabs.length,
                        itemBuilder: (_, index) => Observer(
                          builder: (_) => tabsItem(context, viewModel, index,
                              viewModel.tabsSelectIndex == index),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: double.infinity,
                      height: 500,
                      child: PageView.builder(
                          physics: const ClampingScrollPhysics(),
                          itemCount: 3,
                          itemBuilder: ((context, index) => Container(
                                height: 500,
                                width: double.infinity,
                                color: context.randomColor,
                              ))),
                    )
                  ],
                ),
              ),
            ));
  }

  Widget tabsItem(BuildContext context, ProfilViewModel viewModel, int index,
      bool isActive) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        GestureDetector(
          onTap: () {
            viewModel.changeTabSelect(index);
          },
          child: Padding(
            padding: context.paddingLow,
            child: Text(
              viewModel.tabs[index],
              style: context.textTheme.bodyText1!.copyWith(
                  color: isActive
                      ? context.colorScheme.secondary
                      : context.colorScheme.onTertiaryContainer),
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(top: context.dynamicWidth(0.02)),
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 500),
            width: context.dynamicWidth(0.025),
            height: context.dynamicWidth(0.025),
            decoration: BoxDecoration(
              color:
                  isActive ? context.colorScheme.secondary : Colors.transparent,
              shape: BoxShape.circle,
            ),
            // child: CircleAvatar(
            // radius: context.dynamicWidth(.01),
            // backgroundColor:
            //     ? context.colorScheme.secondary : Colors.transparent,
          ),
        ),
      ],
    );
  }

  Container header_area(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(ImageConstants.instance.banana),
          alignment: Alignment.topRight,
        ),
      ),
      child: Column(
        children: [
          AppBar(
            toolbarHeight: AppBar().preferredSize.height,
            elevation: 0,
            backgroundColor: Colors.transparent,
            title: const Text('Profil'),
            actions: [
              IconButton(
                onPressed: () {},
                icon: Icon(Icons.more_vert),
                color: context.colorScheme.tertiaryContainer,
              )
            ],
          ),
          Padding(
            padding: context.horizontalPaddingNormal,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CircleAvatar(
                  radius: context.width * .18,
                  backgroundImage: AssetImage(
                    ImageConstants.instance.profil,
                  ),
                ),
                SizedBox(height: context.dynamicWidth(.025)),
                Text(
                  'Betül Üsküdar',
                  style: context.textTheme.headline5!
                      .copyWith(color: context.colorScheme.tertiaryContainer),
                ),
                SizedBox(height: context.dynamicWidth(.015)),
                Text(
                  '@uskusku',
                  style: context.textTheme.bodyText1!
                      .copyWith(fontWeight: FontWeight.bold),
                ),
                SizedBox(height: context.dynamicWidth(.01)),
                Text(
                  'Kilo: 60 Boy: 170 VKE: 13.7',
                  style: context.textTheme.bodyText1!
                      .copyWith(color: context.colorScheme.onTertiaryContainer),
                ),
                SizedBox(height: context.dynamicWidth(.075)),
                Container(
                  // height: context.dynamicWidth(0.15),
                  padding: context.paddingNormal,
                  decoration: BoxDecoration(
                      color:
                          context.colorScheme.surfaceVariant.withOpacity(0.7),
                      borderRadius: BorderRadius.all(Radius.circular(5))),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Wrap(children: [
                        Text(
                          '125',
                          style: context.textTheme.bodyText1!.copyWith(
                            color: context.colorScheme.tertiaryContainer,
                          ),
                        ),
                        SizedBox(
                          width: context.dynamicWidth(0.01),
                        ),
                        Text(
                          'Takipçi',
                          style: context.textTheme.bodyText1!.copyWith(
                            color: context.colorScheme.onTertiary,
                          ),
                        ),
                      ]),
                      SizedBox(
                        height: context.dynamicWidth(0.075),
                        child: VerticalDivider(
                          color: context.colorScheme.onTertiaryContainer,
                          thickness: 1,
                        ),
                      ),
                      Wrap(children: [
                        Text(
                          '150',
                          style: context.textTheme.bodyText1!.copyWith(
                            color: context.colorScheme.tertiaryContainer,
                          ),
                        ),
                        SizedBox(
                          width: context.dynamicWidth(0.01),
                        ),
                        Text(
                          'Takip',
                          style: context.textTheme.bodyText1!.copyWith(
                            color: context.colorScheme.onTertiary,
                          ),
                        ),
                      ]),
                    ],
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
