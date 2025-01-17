import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tech_rental/app/di/di.dart';
import 'package:tech_rental/features/auth/presentation/view/login_page.dart';
import 'package:tech_rental/features/auth/presentation/view/signup_page.dart';
import 'package:tech_rental/features/auth/presentation/view_model/login/login_bloc.dart';
import 'package:tech_rental/features/auth/presentation/view_model/signup/register_bloc.dart';

class LandingPageState extends Equatable {
  final int selectedIndex;
  final List<Widget> views;

  const LandingPageState({
    required this.selectedIndex,
    required this.views,
  });

  // Initial state
  static LandingPageState initial() {
    return LandingPageState(
      selectedIndex: 0,
      views: [
        BlocProvider(
          create: (context) => getIt<LoginBloc>(),
          child: LoginPage(),
        ),
        BlocProvider(
          create: (context) => getIt<RegisterBloc>(),
          child: const SignupPage(),
        ),
        const Center(
          child: Text('Account'),
        ),
      ],
    );
  }

  LandingPageState copyWith({
    int? selectedIndex,
    List<Widget>? views,
  }) {
    return LandingPageState(
      selectedIndex: selectedIndex ?? this.selectedIndex,
      views: views ?? this.views,
    );
  }

  @override
  List<Object?> get props => [selectedIndex, views];
}
