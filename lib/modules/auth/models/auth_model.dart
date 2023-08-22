import 'package:json_annotation/json_annotation.dart';

part 'auth_model.g.dart';

enum UserRole { ROLE_ADMIN, ROLE_PREPARE_MEMBER, ROLE_NORMAL_MEMBER }

class UserRoleConverter implements JsonConverter<UserRole, String> {
  const UserRoleConverter();

  UserRole fromJson(String json) {
    return UserRole.values.firstWhere((e) => e.toString() == 'UserRole.$json');
  }

  String toJson(UserRole object) {
    return object.toString().split('.').last;
  }
}

@JsonSerializable()
class AuthModel {
  final String? identyKey;
  final String? userUUID;
  @UserRoleConverter()
  final UserRole? role;

  AuthModel({
    this.identyKey,
    this.userUUID,
    this.role,
  });

  AuthModel copyWith(
      {String? accessToken,
      String? xerk,
      String? identyKey,
      String? userUUID,
      UserRole? role}) {
    return AuthModel(
        identyKey: identyKey ?? this.identyKey,
        userUUID: userUUID ?? this.userUUID,
        role: role ?? this.role);
  }

  factory AuthModel.fromJson(Map<String, dynamic> json) =>
      _$AuthModelFromJson(json);

  Map<String, dynamic> toJson() => _$AuthModelToJson(this);
}
