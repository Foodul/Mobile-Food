import 'package:flutter/material.dart';
import 'package:foodul/core/base/viewmodel/base_view_model.dart';
import 'package:mobx/mobx.dart';
part 'profil_view_model.g.dart';

class ProfilViewModel = _ProfilViewModelBase with _$ProfilViewModel;

abstract class _ProfilViewModelBase with Store, BaseViewModel {
  @override
  void setContext(BuildContext context) => this.context = context;
  @override
  void init() {}
}
