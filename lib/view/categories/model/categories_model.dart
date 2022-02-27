import 'package:json_annotation/json_annotation.dart';
import 'package:vexana/vexana.dart';

part 'categories_model.g.dart';

@JsonSerializable()
class CategoriesModel extends INetworkModel<CategoriesModel> {
  String? image;
  String? title;
  List<CategoryDetails>? details;
  CategoriesModel({this.image, this.title, this.details});

  @override
  CategoriesModel fromJson(Map<String, dynamic> json) {
    return _$CategoriesModelFromJson(json);
  }

  @override
  Map<String, dynamic> toJson() {
    return _$CategoriesModelToJson(this);
  }
}

@JsonSerializable()
class CategoryDetails extends INetworkModel<CategoryDetails> {
  String? title;
  String? image;
  CategoryDetails({
    this.title,
    this.image,
  });

  @override
  CategoryDetails fromJson(Map<String, dynamic> json) {
    return _$CategoryDetailsFromJson(json);
  }

  factory CategoryDetails.fromJson(Map<String, dynamic> json) {
    return _$CategoryDetailsFromJson(json);
  }

  @override
  Map<String, dynamic> toJson() {
    return _$CategoryDetailsToJson(this);
  }
}
