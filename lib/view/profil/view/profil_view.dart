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
              appBar: AppBar(
                elevation: 0,
                title: Text('Profil'),
                actions: [
                  IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.more_vert),
                    color: context.colorScheme.tertiaryContainer,
                  )
                ],
              ),
              body: Column(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage(ImageConstants.instance.banana),
                        ),
                      ),
                      child: Text('fdsf'),
                    ),
                  ),
                ],
              ),
            ));
  }
}
