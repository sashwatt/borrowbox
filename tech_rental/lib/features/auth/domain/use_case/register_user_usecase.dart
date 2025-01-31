import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:tech_rental/app/usecase/usecase.dart';
import 'package:tech_rental/core/error/failure.dart';
import 'package:tech_rental/features/auth/domain/entity/auth_entity.dart';
import 'package:tech_rental/features/auth/domain/repository/auth_repository.dart';

// Parameters required for the registration use case
class RegisterUserParams extends Equatable {
  final String email;
  final String username;
  final String password;

  const RegisterUserParams({
    required this.email,
    required this.username,
    required this.password,
  });

  @override
  List<Object?> get props => [email, username, password];
}

// RegisterUseCase to handle registration logic
class RegisterUseCase implements UsecaseWithParams<void, RegisterUserParams> {
  final IAuthRepository repository;

  // Constructor to inject the repository dependency
  RegisterUseCase(this.repository);

  @override
  Future<Either<Failure, void>> call(RegisterUserParams params) {
    final authEntity = AuthEntity(
      email: params.email,
      username: params.username,
      password: params.password,
    );
    // Calls the repository to register the user and returns either success or failure
    return repository.registerUser(authEntity);
  }
}
