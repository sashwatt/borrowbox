import 'package:equatable/equatable.dart';

class AuthEntity extends Equatable {
  final String? userId;
  final String username;
  final String email;
  final String password;

  const AuthEntity({
    this.userId,
    required this.username,
    required this.email,
    required this.password,
  });

  @override
  List<Object?> get props => [userId, email, username, password];
}
