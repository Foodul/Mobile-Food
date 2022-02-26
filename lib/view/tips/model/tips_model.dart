import 'package:json_annotation/json_annotation.dart';
import 'package:vexana/vexana.dart';
part 'tips_model.g.dart';

@JsonSerializable()
class TipsModel extends INetworkModel<TipsModel> {
  String? tipsimg;
  String? title;
  String? info;
  Function()? onTab;

  TipsModel({this.tipsimg, this.title, this.info, this.onTab});

  @override
  TipsModel fromJson(Map<String, dynamic> json) {
    return _$TipsModelFromJson(json);
  }

  @override
  Map<String, dynamic> toJson() {
    return _$TipsModelToJson(this);
  }
}
