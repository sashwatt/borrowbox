import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:tech_rental/features/auth/domain/use_case/upload_image_usecase.dart';

import 'repository.mock.dart';

void main() {
  late MockAuthRepository mockAuthRepository;
  late UploadImageUsecase uploadImageUsecase;

  // Test data
  var tFile = File('path/to/file');
  var tParams = UploadImageParams(file: tFile);
  const tImageUrl = 'https://example.com/uploaded_image.jpg';

  setUp(() {
    mockAuthRepository = MockAuthRepository();
    uploadImageUsecase = UploadImageUsecase(mockAuthRepository);
  });

  group('UploadImageUsecase', () {
    test(
        'should call repository to upload image and return image URL on success',
        () async {
      // Arrange
      when(() => mockAuthRepository.uploadProfilePicture(tFile)).thenAnswer(
          (_) async => const Right(tImageUrl)); // Simulating success

      // Act
      final result = await uploadImageUsecase(tParams);

      // Assert
      expect(
          result,
          const Right(
              tImageUrl)); // Expecting a successful result with the image URL
      verify(() => mockAuthRepository.uploadProfilePicture(tFile))
          .called(1); // Verify repository call
      verifyNoMoreInteractions(
          mockAuthRepository); // Ensure no other interactions
    });
  });
}
