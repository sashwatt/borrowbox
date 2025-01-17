// lib/features/auth/domain/repository/auth_repository.dart
import 'package:dartz/dartz.dart';
import 'package:tech_rental/core/error/failure.dart';
import 'package:tech_rental/features/auth/data/data_source/auth_data_source.dart';
import 'package:tech_rental/features/auth/domain/entity/auth_entity.dart';

abstract interface class IAuthRepository {
  Future<Either<Failure, void>> registerUser(AuthEntity user);

  Future<Either<Failure, String>> loginUser(String username, String password);

  Future<Either<Failure, AuthEntity>> getCurrentUser();
}
