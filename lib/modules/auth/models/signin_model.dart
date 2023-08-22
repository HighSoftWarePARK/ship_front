
import 'package:json_annotation/json_annotation.dart';

part 'signin_model.g.dart';

@JsonSerializable()
class SigninModel {
  final String identyKey;
  final String password;

  SigninModel({required this.identyKey, required this.password});

  factory SigninModel.fromJson(Map<String, dynamic> json) => _$SigninModelFromJson(json);

  Map<String, dynamic> toJson() => _$SigninModelToJson(this);
}