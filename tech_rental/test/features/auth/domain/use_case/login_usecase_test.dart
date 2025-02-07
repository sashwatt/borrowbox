import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:tech_rental/features/auth/domain/use_case/login_usecase.dart';

import 'repository.mock.dart';

void main() {
  late MockAuthRepository mockAuthRepository;
  late LoginUseCase loginUseCase;

  setUp(() {
    mockAuthRepository = MockAuthRepository();
    loginUseCase = LoginUseCase(mockAuthRepository);
  });

  group('LoginUseCase', () {
    const tUsername = 'testUser';
    const tPassword = 'password123';
    const tParams = LoginParams(username: tUsername, password: tPassword);

    test('should return a token when the login is successful', () async {
      // Arrange
      const tToken = 'someToken';
      when(() => mockAuthRepository.loginUser(tUsername, tPassword))
          .thenAnswer((_) async => const Right(tToken));

      // Act
      final result = await loginUseCase(tParams);

      // Assert
      expect(result, const Right(tToken));
      verify(() => mockAuthRepository.loginUser(tUsername, tPassword))
          .called(1);
      verifyNoMoreInteractions(mockAuthRepository);
    });
  });
}
