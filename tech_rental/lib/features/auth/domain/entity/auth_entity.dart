import 'package:equatable/equatable.dart';

class AuthEntity extends Equatable {
  final String? userId;
  final String username;
  final String email;
  final String phone;
  final String password;

  const AuthEntity({
    this.userId,
    required this.username,
    required this.email,
    required this.password,
    required this.phone,
  });

  @override
  List<Object?> get props => [userId, phone, email, username, password];
}
