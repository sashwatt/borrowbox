class ApiEndpoints {
  ApiEndpoints._();

  static const Duration connectionTimeout = Duration(seconds: 1000);
  static const Duration receiveTimeout = Duration(seconds: 1000);
  static const String baseUrl = "http://10.0.2.2:5000/api/v1/";
  // static const String baseUrl = "http://192.168.18.4:5000/api/v1/";
  // For iPhone
  //static const String baseUrl = "http://localhost:3000/api/v1/";

  // ====================== Auth Routes ======================
  static const String login = "auth/login";
  static const String register = "auth/register";
  static const String getCustomer = "auth/getCustomer";
  static const String getProducts = "products";
  static const String imageUrl = "http://10.0.2.2:5000/uploads/";
  static const String uploadImage = "auth/uploadImage";
}
