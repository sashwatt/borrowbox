part of 'login_bloc.dart';

class LoginState {
  final bool isPasswordVisible;
  final bool isLoading;
  final String? errorMessage;
  final bool navigateToSignup;
  final bool navigateToHome;

  LoginState({
    required this.isPasswordVisible,
    required this.isLoading,
    this.errorMessage,
    required this.navigateToSignup,
    required this.navigateToHome,
  });

  factory LoginState.initial() {
    return LoginState(
      isPasswordVisible: false,
      isLoading: false,
      errorMessage: null,
      navigateToSignup: false,
      navigateToHome: false,
    );
  }

  LoginState copyWith({
    bool? isPasswordVisible,
    bool? isLoading,
    String? errorMessage,
    bool? navigateToSignup,
  }) {
    return LoginState(
      isPasswordVisible: isPasswordVisible ?? this.isPasswordVisible,
      isLoading: isLoading ?? this.isLoading,
      errorMessage: errorMessage,
      navigateToSignup: navigateToSignup ?? this.navigateToSignup,
      navigateToHome: navigateToHome,
    );
  }
}
