import 'dart:io';

import 'package:tech_rental/features/auth/domain/entity/auth_entity.dart';
import 'package:tech_rental/features/auth/domain/entity/product_entity.dart';

abstract interface class IAuthDataSource {
  Future<String> loginUser(String username, String password);

  Future<void> registerUser(AuthEntity user);

  Future<AuthEntity> getCurrentUser();
  // Future<List<ProductEntity>> getProducts();

  Future<String> uploadProfilePicture(File file);
}
