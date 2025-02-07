import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:tech_rental/app/usecase/usecase.dart';
import 'package:tech_rental/core/error/failure.dart';
import 'package:tech_rental/features/auth/domain/repository/auth_repository.dart';

class UploadImageParams {
  final File file;

  const UploadImageParams({
    required this.file,
  });
}

class UploadImageUsecase
    implements UsecaseWithParams<String, UploadImageParams> {
  final IAuthRepository _repository;

  UploadImageUsecase(this._repository);

  @override
  Future<Either<Failure, String>> call(UploadImageParams params) {
    return _repository.uploadProfilePicture(params.file);
  }
}
