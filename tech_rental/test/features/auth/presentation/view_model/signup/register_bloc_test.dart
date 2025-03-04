import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:tech_rental/features/auth/domain/use_case/register_user_usecase.dart';
import 'package:tech_rental/features/auth/domain/use_case/upload_image_usecase.dart';
import 'package:tech_rental/features/auth/presentation/view_model/signup/register_bloc.dart';

class MockRegisterUseCase extends Mock implements RegisterUseCase {}

class MockBuildContext extends Mock implements BuildContext {}

class MockUploadImageUsecase extends Mock implements UploadImageUsecase {}

void main() {
  late RegisterBloc registerBloc;
  late MockRegisterUseCase mockRegisterUseCase;

  setUp(() {
    mockRegisterUseCase = MockRegisterUseCase();
    registerBloc = RegisterBloc(
      registerUseCase: mockRegisterUseCase,
      uploadImageUsecase: MockUploadImageUsecase(),
    );
  });

  // Test 1: Test successful signup logic and state changes
  test('RegisterBloc emits success state on successful signup', () async {
    when(() => mockRegisterUseCase.call(any()))
        .thenAnswer((_) async => const Right(true));

    final expected = [
      RegisterState.initial().copyWith(isLoading: true),
      RegisterState.initial().copyWith(isLoading: false, isSuccess: true),
    ];

    expectLater(registerBloc.stream, emitsInOrder(expected));

    registerBloc.add(RegisterCustomer(
        username: 'user',
        password: 'password',
        email: 'test@example.com',
        context: MockBuildContext()));
  });

  // Test 2: Test signup failure (invalid data)
//   test('RegisterBloc emits failure state on signup failure', () async {
//     when(() => mockRegisterUseCase.call(any())).thenAnswer(
//         (_) async => Left(RegisterFailure(message: 'Signup failed')));

//     final expected = [
//       RegisterState.initial().copyWith(isLoading: true),
//       RegisterState.initial().copyWith(isLoading: false, isSuccess: false),
//     ];

//     expectLater(registerBloc.stream, emitsInOrder(expected));

//     registerBloc.add(RegisterCustomer(
//         username: 'user',
//         password: 'password',
//         email: 'test@example.com',
//         context: MockBuildContext()));
//   });

//   // Test 3: Test if NavigateLoginScreenEvent navigates to login page
//   test('NavigateLoginScreenEvent navigates to LoginPage', () async {
//     final event = NavigateLoginScreenEvent(context: MockBuildContext());

//     registerBloc.add(event);

//     expect(find.byType(LoginPage), findsOneWidget);
//   });
}
