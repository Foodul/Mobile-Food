import 'package:json_annotation/json_annotation.dart';
import 'package:vexana/vexana.dart';
part 'tips_model.g.dart';

@JsonSerializable()
class TipsModel extends INetworkModel<TipsModel> {
  String? tipsImage;
  String? title;
  String? text;

  TipsModel({
    this.tipsImage,
    this.title,
    this.text,
  });

  @override
  TipsModel fromJson(Map<String, dynamic> json) {
    return _$TipsModelFromJson(json);
  }

  @override
  Map<String, dynamic> toJson() {
    return _$TipsModelToJson(this);
  }
}
