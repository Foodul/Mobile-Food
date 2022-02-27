import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:foodul/core/base/view/base_widget.dart';
import 'package:foodul/core/constants/image/image_constants.dart';
import 'package:foodul/core/constants/image/svg_constants.dart';
import 'package:foodul/core/utility/helpers.dart';
import 'package:foodul/view/_product/chart/line_chart.dart';
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
              // appBar: AppBar(
              //   toolbarHeight: AppBar().preferredSize.height,
              //   elevation: 0,
              //   backgroundColor: Colors.transparent,
              //   title: const Text('Profil'),
              //   actions: [
              //     IconButton(
              //       onPressed: () {},
              //       icon: Icon(Icons.more_vert),
              //       color: context.colorScheme.tertiaryContainer,
              //     )
              //   ],
              // ),
              body: SingleChildScrollView(
                physics: const ClampingScrollPhysics(),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    header_area(context, viewModel),
                    SizedBox(
                      width: context.width,
                      height: context.dynamicWidth(0.25),
                      child: ListView.builder(
                        physics: const ClampingScrollPhysics(),
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
                      child: Padding(
                        padding: context.horizontalPaddingNormal,
                        child: PageView.builder(
                            physics: const ClampingScrollPhysics(),
                            controller: viewModel.pageviewController,
                            itemCount: 3,
                            itemBuilder: ((context, index) {
                              switch (index) {
                                case 0:
                                  return Column(
                                    children: [
                                      CustomLineChart(
                                        lineChart: viewModel.corbonReportsData,
                                        bottomTitleList: (value) {
                                          return viewModel
                                              .bottomTitleQuarterMonths(value,
                                                  "Ocak", "Şubar", "Mart");
                                        },
                                      ),
                                      SizedBox(
                                        height: context.dynamicWidth(.05),
                                      ),
                                      Padding(
                                        padding:
                                            context.horizontalPaddingNormal,
                                        child: Text(
                                          'Önerilen veriler sizin yaş grubunuz ve verilerinize göre ortalama bir değer üzerinden verilmiştir.',
                                          style: context.textTheme.bodyText2,
                                          textAlign: TextAlign.center,
                                        ),
                                      )
                                    ],
                                  );
                                case 1:
                                  return Column(
                                    children: [
                                      CustomLineChart(
                                        lineChart: viewModel.caloriReport,
                                        bottomTitleList: (value) {
                                          return viewModel
                                              .bottomTitleQuarterMonths(value,
                                                  "Ocak", "Şubar", "Mart");
                                        },
                                      ),
                                      SizedBox(
                                        height: context.dynamicWidth(.05),
                                      ),
                                      Padding(
                                        padding:
                                            context.horizontalPaddingNormal,
                                        child: Text(
                                          'Önerilen veriler sizin yaş grubunuz ve verilerinize göre ortalama bir değer üzerinden verilmiştir.',
                                          style: context.textTheme.bodyText2,
                                          textAlign: TextAlign.center,
                                        ),
                                      )
                                    ],
                                  );
                                case 2:
                                  return ListView.builder(
                                    physics: const ClampingScrollPhysics(),
                                    shrinkWrap: true,
                                    itemCount: viewModel.friendList.length,
                                    itemBuilder: (context, index) => friendCard(
                                        context,
                                        viewModel.friendList[index],
                                        index,
                                        viewModel.friendList.length),
                                  );

                                default:
                                  return const SizedBox();
                              }
                            })),
                      ),
                    )
                  ],
                ),
              ),
            ));
  }

  Widget friendCard(BuildContext context, String name, int index, int total) {
    return Padding(
      padding: context.verticalPaddingLow,
      child: SizedBox(
        height: 30,
        width: double.infinity,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          mainAxisSize: MainAxisSize.max,
          children: [
            Flexible(
              fit: FlexFit.loose,
              child: CircleAvatar(
                child: FittedBox(
                  child: CircleAvatar(
                    backgroundImage:
                        NetworkImage('https://i.pravatar.cc/?img=$index'),
                  ),
                ),
              ),
            ),
            Flexible(
              flex: 5,
              fit: FlexFit.loose,
              child: Align(
                alignment: Alignment.centerLeft,
                child: FractionallySizedBox(
                  heightFactor: 0.9,
                  widthFactor: index < 8 ? 1 - (index / total) : .2,
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 5),
                    decoration: BoxDecoration(
                      color: setColorFormat(index),
                      borderRadius: const BorderRadius.all(
                        Radius.circular(100),
                      ),
                    ),
                    child: Row(
                      children: [
                        index < 4
                            ? Padding(
                                padding: const EdgeInsets.only(right: 5),
                                child: SvgPicture.asset(
                                    SVGImageConstants.instance.gift),
                              )
                            : const SizedBox(),
                        Text(
                          '$index.',
                          overflow: TextOverflow.visible,
                          style: context.textTheme.bodyText1!
                              .copyWith(color: context.colorScheme.surface),
                          softWrap: false,
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Flexible(
                flex: 3,
                fit: FlexFit.loose,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      name,
                      style: context.textTheme.bodyText2,
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    Text(
                      'LV. ${(4 * total - index) - index * 2}',
                      style: context.textTheme.bodyText2!.copyWith(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: context.colorScheme.tertiary),
                    ),
                  ],
                ))
          ],
        ),
      ),
    );
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
          ),
        ),
      ],
    );
  }

  Container header_area(BuildContext context, ProfilViewModel viewModel) {
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
              // IconButton(
              //   onPressed: () {},
              //   icon: Icon(Icons.more_vert),
              //   color: context.colorScheme.tertiaryContainer,
              // )
              PopupMenuButton<int>(
                icon: Icon(
                  Icons.more_vert,
                  color: context.colorScheme.tertiaryContainer,
                ),
                onSelected: (item) => viewModel.popupMenu(item),
                itemBuilder: (context) => [
                  PopupMenuItem<int>(value: 0, child: Text('Logout')),
                  PopupMenuItem<int>(value: 1, child: Text('Settings')),
                ],
              ),
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
                  padding: context.paddingNormal,
                  decoration: BoxDecoration(
                      color:
                          context.colorScheme.surfaceVariant.withOpacity(0.7),
                      borderRadius: BorderRadius.all(Radius.circular(10))),
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
