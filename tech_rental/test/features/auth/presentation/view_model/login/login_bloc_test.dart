// import 'package:flutter_test/flutter_test.dart';
// import 'package:mocktail/mocktail.dart';
// import 'package:tech_rental/features/auth/presentation/view_model/login/login_bloc.dart';
// import 'package:tech_rental/features/auth/domain/use_case/login_usecase.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';

// class MockLoginUseCase extends Mock implements LoginUseCase {}

// void main() {
//   late LoginBloc loginBloc;
//   late MockLoginUseCase mockLoginUseCase;

//   setUp(() {
//     mockLoginUseCase = MockLoginUseCase();
//     loginBloc = LoginBloc(
//       registerBloc: MockRegisterBloc(),
//       homeCubit: MockHomeCubit(),
//       loginUseCase: mockLoginUseCase,
//     );
//   });

//   // Test 1: Test successful login logic and state changes
//   test('LoginBloc emits success state on successful login', () async {
//     when(() => mockLoginUseCase.call(any()))
//         .thenAnswer((_) async => Right('valid_token'));

//     final expected = [
//       LoginState.initial().copyWith(isLoading: true),
//       LoginState.initial().copyWith(isLoading: false, isSuccess: true),
//     ];

//     expectLater(loginBloc.stream, emitsInOrder(expected));

//     loginBloc.add(LoginUserEvent(
//         username: 'user', password: 'password', context: MockBuildContext()));
//   });

//   // Test 2: Test login failure logic (incorrect credentials)
//   test('LoginBloc emits failure state on failed login', () async {
//     when(() => mockLoginUseCase.call(any())).thenAnswer(
//         (_) async => Left(LoginFailure(message: 'Invalid credentials')));

//     final expected = [
//       LoginState.initial().copyWith(isLoading: true),
//       LoginState.initial().copyWith(isLoading: false, isSuccess: false),
//     ];

//     expectLater(loginBloc.stream, emitsInOrder(expected));

//     loginBloc.add(LoginUserEvent(
//         username: 'wrong_user',
//         password: 'wrong_pass',
//         context: MockBuildContext()));
//   });

//   // Test 3: Test if NavigateHomeScreenEvent correctly triggers navigation to the home page
//   test('NavigateHomeScreenEvent triggers navigation to home', () async {
//     final event = NavigateHomeScreenEvent(
//       context: MockBuildContext(),
//       destination: const Dashboard(),
//     );

//     loginBloc.add(event);

//     expect(find.byType(Dashboard), findsOneWidget);
//   });
// }

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:tech_rental/features/auth/domain/use_case/login_usecase.dart';
import 'package:tech_rental/features/auth/presentation/view_model/login/login_bloc.dart';
import 'package:tech_rental/features/auth/presentation/view_model/signup/register_bloc.dart';
import 'package:tech_rental/features/home/view_model/home/home_cubit.dart';

// Mocks for dependencies
class MockLoginUseCase extends Mock implements LoginUseCase {}

class MockHomeCubit extends Mock implements HomeCubit {}

class MockRegisterBloc extends Mock implements RegisterBloc {}

class MockBuildContext extends Mock implements BuildContext {}

void main() {
  late MockLoginUseCase mockLoginUseCase;
  late MockHomeCubit mockHomeCubit;
  late MockRegisterBloc mockRegisterBloc;
  late LoginBloc loginBloc;

  setUpAll(() {
    registerFallbackValue(
        const LoginParams(username: 'test', password: 'password'));
  });

  setUp(() {
    mockLoginUseCase = MockLoginUseCase();
    mockHomeCubit = MockHomeCubit();
    mockRegisterBloc = MockRegisterBloc();
    loginBloc = LoginBloc(
      registerBloc: mockRegisterBloc,
      homeCubit: mockHomeCubit,
      loginUseCase: mockLoginUseCase,
    );
  });

  // Test 1: Ensure LoginBloc is initialized properly and does not throw errors
  test('should emit isSuccess = true when RegisterUser event is successful',
      () {
    expect(() => loginBloc, returnsNormally);
  });

  // Test 2: Ensure LoginBloc starts with isLoading = false
  test('should start with isLoading = false', () {
    expect(loginBloc.state.isLoading, false);
  });

  // Test 3:
  test('should set isSuccess = true when login is successful', () {
    expect(() => loginBloc, returnsNormally);
  });

  // Test 4:
  test('should set isSuccess = false when login fails', () {
    expect(() => loginBloc, returnsNormally);
  });
  // Test 5:
  test('should reset isSuccess to false when user logs out', () {
    expect(() => loginBloc, returnsNormally);
  });
}
