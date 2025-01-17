part of 'login_bloc.dart';

abstract class LoginEvent {}

class TogglePasswordVisibility extends LoginEvent {}

class LoginSubmitted extends LoginEvent {
  final String username;
  final String password;
  final BuildContext context;

  LoginSubmitted({
    required this.username,
    required this.password,
    required this.context,
  });
}

class NavigateToSignup extends LoginEvent {
  final BuildContext context;
  final Widget destination;

  NavigateToSignup({required this.context, required this.destination});
}

class NavigateToHome extends LoginEvent {
  showMySnackBar({required BuildContext context, required String message}) {}
}
