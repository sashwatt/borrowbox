import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tech_rental/core/common/snackbar/my_snackbar.dart';
import 'package:tech_rental/features/auth/presentation/view/signup_page.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(LoginState.initial()) {
    on<TogglePasswordVisibility>((event, emit) {
      emit(state.copyWith(isPasswordVisible: !state.isPasswordVisible));
    });

    on<LoginSubmitted>((event, emit) async {
      emit(state.copyWith(isLoading: true, errorMessage: null));

      await Future.delayed(const Duration(seconds: 2)); // Simulating API Call

      if (event.username == "admin" && event.password == "password") {
        emit(state.copyWith(isLoading: false));
        showMySnackBar(
          context: event.context,
          message: "Login successful! Welcome to BorrowBox.",
        );
      } else {
        emit(state.copyWith(
            isLoading: false, errorMessage: "Invalid credentials."));
      }
    });

    // Updated Navigation to Signup Page
    on<NavigateToSignup>(
      (event, emit) {
        Navigator.push(
          event.context,
          MaterialPageRoute(
            builder: (context) => BlocProvider.value(
              value: this, // Pass the current BlocProvider (if necessary)
              child: const SignupPage(), // Replace with actual signup page
            ),
          ),
        );
      },
    );

    on<NavigateToHome>(
        showMySnackBar(context: context, message: "Welcome to BorrowBox!"));
  }

  get context => null;
}
