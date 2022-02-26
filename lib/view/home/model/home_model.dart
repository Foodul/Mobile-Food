import 'package:json_annotation/json_annotation.dart';
import 'package:vexana/vexana.dart';

part 'home_model.g.dart';

@JsonSerializable()
class HomeModel extends INetworkModel<HomeModel> {
  List<Statics>? staticsOfMe;
  List<Statics>? staticsOfWorkflow;
  List<Statics>? staticsOfSolution;

  HomeModel({
    this.staticsOfMe,
    this.staticsOfWorkflow,
    this.staticsOfSolution,
  });

  @override
  HomeModel fromJson(Map<String, dynamic> json) {
    return _$HomeModelFromJson(json);
  }

  @override
  Map<String, dynamic> toJson() {
    return _$HomeModelToJson(this);
  }
}

@JsonSerializable()
class Statics extends INetworkModel<Statics> {
  @JsonKey(name: '_id')
  int? iId;
  int? total;

  Statics({this.iId, this.total});

  int? get getTotal => total;

  @override
  Statics fromJson(Map<String, dynamic> json) {
    return _$StaticsFromJson(json);
  }

  factory Statics.fromJson(Map<String, dynamic> json) {
    return _$StaticsFromJson(json);
  }

  @override
  Map<String, dynamic> toJson() {
    return _$StaticsToJson(this);
  }
}
