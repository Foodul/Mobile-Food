import 'package:json_annotation/json_annotation.dart';
import 'package:vexana/vexana.dart';

part 'categories_model.g.dart';

@JsonSerializable()
class CategoriesModel extends INetworkModel<CategoriesModel> {
  String? image;
  String? title;
  CategoriesModel({
    this.image,
    this.title,
  });

  @override
  CategoriesModel fromJson(Map<String, dynamic> json) {
    return _$CategoriesModelFromJson(json);
  }

  @override
  Map<String, dynamic> toJson() {
    return _$CategoriesModelToJson(this);
  }
}
