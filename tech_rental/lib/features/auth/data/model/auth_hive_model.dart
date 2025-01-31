import 'package:equatable/equatable.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:tech_rental/app/constatns/hive_table_constants.dart';
import 'package:tech_rental/features/auth/domain/entity/auth_entity.dart';
import 'package:uuid/uuid.dart';

part 'auth_hive_model.g.dart'; // Ensure you run build_runner to generate this file.

@HiveType(
    typeId:
        HiveTableConstant.userTableId) // Define the typeId for the Hive model.
class AuthHiveModel extends Equatable {
  @HiveField(0) // User ID field, required for Hive serialization.
  final String? userId;

  @HiveField(1) // Username field
  final String username;

  @HiveField(2) // Email field
  final String email;

  @HiveField(3) // Password field
  final String password;

  // Constructor, if userId is not passed, it generates one using UUID.
  AuthHiveModel({
    String? userId,
    required this.username,
    required this.email,
    required this.password,
  }) : userId = userId ?? const Uuid().v4();

  // Initial Constructor (when the user is not set, it returns empty values)
  const AuthHiveModel.initial()
      : userId = null,
        username = '',
        email = '',
        password = '';

  // Factory constructor to create an AuthHiveModel from an AuthEntity.
  factory AuthHiveModel.fromEntity(AuthEntity entity) {
    return AuthHiveModel(
      userId: entity.userId,
      email: entity.email,
      username: entity.username,
      password: entity.password,
    );
  }

  // Converts an AuthHiveModel to an AuthEntity.
  AuthEntity toEntity() {
    return AuthEntity(
      userId: userId,
      email: email,
      username: username,
      password: password,
    );
  }

  // Equatable properties to compare objects based on their fields.
  @override
  List<Object?> get props => [userId, email, username, password];
}
