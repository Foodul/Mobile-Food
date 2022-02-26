import 'package:flutter/material.dart';
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
              body: Column(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Expanded(
                    child: Container(
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
                            padding: context.horizontalPaddingMedium,
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
                                  style: context.textTheme.headline5!.copyWith(
                                      color: context
                                          .colorScheme.tertiaryContainer),
                                ),
                                SizedBox(height: context.dynamicWidth(.01)),
                                Text(
                                  '@uskusku',
                                  style: context.textTheme.bodyText1!
                                      .copyWith(fontWeight: FontWeight.bold),
                                ),
                                SizedBox(height: context.dynamicWidth(.01)),
                                Text(
                                  'Kilo: 60 Boy: 170 VKE: 13.7',
                                  style: context.textTheme.bodyText1!.copyWith(
                                      color: context
                                          .colorScheme.onTertiaryContainer),
                                ),
                                SizedBox(height: context.dynamicWidth(.02)),
                                Container(
                                  // height: context.dynamicWidth(0.15),
                                  padding: context.paddingNormal,
                                  decoration: BoxDecoration(
                                      color: context.colorScheme.surfaceVariant
                                          .withOpacity(0.7),
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(5))),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Wrap(children: [
                                        Text(
                                          '125',
                                          style: context.textTheme.bodyText1!
                                              .copyWith(
                                            color: context
                                                .colorScheme.tertiaryContainer,
                                          ),
                                        ),
                                        SizedBox(
                                          width: context.dynamicWidth(0.01),
                                        ),
                                        Text(
                                          'Takipçi',
                                          style: context.textTheme.bodyText1!
                                              .copyWith(
                                            color:
                                                context.colorScheme.onTertiary,
                                          ),
                                        ),
                                      ]),
                                      SizedBox(
                                        height: context.dynamicWidth(0.075),
                                        child: VerticalDivider(
                                          color: context
                                              .colorScheme.onTertiaryContainer,
                                          thickness: 1,
                                        ),
                                      ),
                                      Wrap(children: [
                                        Text(
                                          '150',
                                          style: context.textTheme.bodyText1!
                                              .copyWith(
                                            color: context
                                                .colorScheme.tertiaryContainer,
                                          ),
                                        ),
                                        SizedBox(
                                          width: context.dynamicWidth(0.01),
                                        ),
                                        Text(
                                          'Takip',
                                          style: context.textTheme.bodyText1!
                                              .copyWith(
                                            color:
                                                context.colorScheme.onTertiary,
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
                    ),
                  ),
                ],
              ),
            ));
  }
}
