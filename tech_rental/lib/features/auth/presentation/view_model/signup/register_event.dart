part of 'register_bloc.dart';

sealed class RegisterEvent extends Equatable {
  const RegisterEvent();

  @override
  List<Object> get props => [];
}

class UploadImage extends RegisterEvent {
  final BuildContext context;
  final File image;

  const UploadImage({
    required this.context,
    required this.image,
  });
}

class Registercustomer extends RegisterEvent {
  final BuildContext context;
  final String email;
  final String username;
  final String password;
  final File? image;

  const Registercustomer({
    required this.context,
    required this.email,
    required this.username,
    required this.password,
    this.image,
  });
}

class NavigateToLogin extends RegisterEvent {
  final BuildContext context;
  final Widget destination;

  const NavigateToLogin({
    required this.context,
    required this.destination,
  });
}
