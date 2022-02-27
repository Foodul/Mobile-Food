import 'package:json_annotation/json_annotation.dart';
import 'package:vexana/vexana.dart';

part 'category_detail_model.g.dart';

@JsonSerializable()
class CategoryDetailModel extends INetworkModel<CategoryDetailModel> {
  String? title;
  String? image;
  CategoryDetailModel({
    this.title,
    this.image,
  });

  @override
  CategoryDetailModel fromJson(Map<String, dynamic> json) {
    return _$CategoryDetailModelFromJson(json);
  }

  @override
  Map<String, dynamic> toJson() {
    return _$CategoryDetailModelToJson(this);
  }
}
