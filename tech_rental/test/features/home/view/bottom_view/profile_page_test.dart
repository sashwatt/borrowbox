// import 'package:dio/dio.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_test/flutter_test.dart';
// import 'package:mocktail/mocktail.dart';
// import 'package:shared_preferences/shared_preferences.dart';
// import 'package:tech_rental/features/auth/data/data_source/auth_remote_datasource/auth_remote_datasource.dart';
// import 'package:tech_rental/features/auth/domain/entity/auth_entity.dart';
// import 'package:tech_rental/features/home/view/bottom_view/profile_page.dart';

// // Mock class for AuthRemoteDataSource
// class MockAuthRemoteDataSource extends Mock implements AuthRemoteDataSource {}

// void main() {
//   late MockAuthRemoteDataSource mockAuthDataSource;

//   setUp(() {
//     mockAuthDataSource = MockAuthRemoteDataSource();
//   });

//   // Fake User Data
//   const fakeUser = AuthEntity(
//     username: "John Doe",
//     email: "johndoe@example.com",
//     image: "https://via.placeholder.com/150", // Fake image URL
//     password: "password123", // Add the required password parameter
//   );

//   // Test 1: Ensure ProfilePage loads and displays user data
//   testWidgets("ProfilePage displays user data correctly",
//       (WidgetTester tester) async {
//     // Mock the getCurrentUser call
//     when(() => mockAuthDataSource.getCurrentUser())
//         .thenAnswer((_) async => fakeUser);

//     await tester.pumpWidget(
//       const MaterialApp(
//         home: ProfilePage(),
//       ),
//     );

//     await tester.pump(); // Wait for FutureBuilder to complete

//     // Verify username and email are displayed
//     expect(find.text("John Doe"), findsOneWidget);
//     expect(find.text("johndoe@example.com"), findsOneWidget);
//   });

//   // Test 2: Simulate an error while fetching user data
//   testWidgets("ProfilePage shows error message on API failure",
//       (WidgetTester tester) async {
//     // Mock API failure
//     when(() => mockAuthDataSource.getCurrentUser()).thenThrow(DioException(
//       requestOptions: RequestOptions(path: ''),
//       response: Response(
//         requestOptions: RequestOptions(path: ''),
//         statusCode: 500,
//       ),
//       type: DioExceptionType.badResponse,
//     ));

//     await tester.pumpWidget(
//       const MaterialApp(
//         home: ProfilePage(),
//       ),
//     );

//     await tester.pump(); // Wait for FutureBuilder to complete

//     // Check if error message is displayed
//     expect(find.textContaining("Error"), findsOneWidget);
//   });

//   // Test 3: Toggle dark mode and verify state changes
//   testWidgets("ProfilePage toggles theme correctly",
//       (WidgetTester tester) async {
//     SharedPreferences.setMockInitialValues({});

//     await tester.pumpWidget(
//       const MaterialApp(
//         home: ProfilePage(),
//       ),
//     );

//     await tester.pump();

//     // Find the theme toggle button
//     final themeToggle = find.byIcon(Icons.dark_mode);
//     expect(themeToggle, findsOneWidget);

//     // Tap the toggle button
//     await tester.tap(themeToggle);
//     await tester.pump();

//     // Ensure theme toggled
//     expect(find.byIcon(Icons.light_mode), findsOneWidget);
//   });
// }
