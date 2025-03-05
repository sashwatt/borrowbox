import 'dart:io';

import 'package:dio/dio.dart';
import 'package:tech_rental/app/constatns/api_endpoints.dart';
import 'package:tech_rental/features/auth/data/data_source/auth_data_source.dart';
import 'package:tech_rental/features/auth/domain/entity/auth_entity.dart';

class AuthRemoteDataSource implements IAuthDataSource {
  final Dio _dio;

  AuthRemoteDataSource(this._dio);

  @override
  Future<void> registerUser(AuthEntity user) async {
    try {
      Response response = await _dio.post(
        ApiEndpoints.baseUrl + ApiEndpoints.register,
        data: {
          "username": user.username,
          "image": user.image,
          "email": user.email,
          "password": user.password,
        },
      );

      if (response.statusCode == 200) {
        return;
      } else {
        throw Exception("Failed to register user: ${response.statusMessage}");
      }
    } on DioException catch (e) {
      throw Exception("DioException: ${e.message}");
    } catch (e) {
      throw Exception("Unknown Error: ${e.toString()}");
    }
  }

  @override
  Future<String> uploadProfilePicture(File file) async {
    try {
      FormData formData = FormData.fromMap({
        "image": await MultipartFile.fromFile(file.path),
      });

      Response response = await _dio.post(
        ApiEndpoints.baseUrl + ApiEndpoints.uploadImage,
        data: formData,
      );

      if (response.statusCode == 200) {
        return response.data['image'];
      } else {
        throw Exception("Failed to upload image: ${response.statusMessage}");
      }
    } catch (e) {
      throw Exception("Image Upload Error: ${e.toString()}");
    }
  }

  @override
  Future<String> loginUser(String username, String password) async {
    try {
      Response response =
          await _dio.post(ApiEndpoints.baseUrl + ApiEndpoints.login, data: {
        "username": username,
        "password": password,
      });

      if (response.statusCode == 200) {
        return response.data['token'];
      } else {
        throw Exception("Failed to login: ${response.statusMessage}");
      }
    } catch (e) {
      throw Exception("Login Error: ${e.toString()}");
    }
  }

  @override
  Future<AuthEntity> getCurrentUser() {
    // TODO: implement getCurrentUser
    throw UnimplementedError();
  }
}
