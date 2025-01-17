part of 'register_bloc.dart';

sealed class RegisterEvent extends Equatable {
  const RegisterEvent();

  @override
  List<Object> get props => [];
}

class Registercustomer extends RegisterEvent {
  final BuildContext context;
  final String email;
  final String phone;
  final String username;
  final String password;

  const Registercustomer({
    required this.context,
    required this.email,
    required this.phone,
    required this.username,
    required this.password,
  });
}

class NavigateToLogin extends RegisterEvent {
  final BuildContext context;

  const NavigateToLogin({
    required this.context,
  });
}
