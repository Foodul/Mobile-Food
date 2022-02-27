import 'package:json_annotation/json_annotation.dart';
import 'package:vexana/vexana.dart';
part 'tips_detail_model.g.dart';

@JsonSerializable()
class TipsDetailModel extends INetworkModel<TipsDetailModel> {
  String? title;
  String? text;
  String? mainText;
  List<String>? photos;

  TipsDetailModel({
    this.title,
    this.text,
    this.mainText,
    this.photos,
  });

  @override
  TipsDetailModel fromJson(Map<String, dynamic> json) {
    return _$TipsDetailModelFromJson(json);
  }

  @override
  Map<String, dynamic> toJson() {
    return _$TipsDetailModelToJson(this);
  }
}
