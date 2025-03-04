import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:tech_rental/features/auth/presentation/view/signup_page.dart';

void main() {
  testWidgets('Image Picker dialog opens when avatar is tapped',
      (WidgetTester tester) async {
    // Build the SignupPage widget
    await tester.pumpWidget(const MaterialApp(home: SignupPage()));

    // Find the profile picture area (GestureDetector for avatar)
    final avatar = find.byType(GestureDetector).first;

    // Tap the profile picture area to open the image picker
    await tester.tap(avatar);
    await tester.pump(); // Rebuild after the tap

    // Check if the bottom sheet appears with options
    expect(find.text('Choose an option'), findsOneWidget);
    expect(find.text('Camera'), findsOneWidget);
    expect(find.text('Gallery'), findsOneWidget);
  });

  testWidgets('SignupPage displays error when passwords do not match',
      (WidgetTester tester) async {
    // Build the SignupPage widget
    await tester.pumpWidget(const MaterialApp(home: SignupPage()));

    // Find the form fields
    final usernameField = find.byType(TextFormField).at(0);
    final emailField = find.byType(TextFormField).at(1);
    final passwordField = find.byType(TextFormField).at(2);
    final confirmPasswordField = find.byType(TextFormField).at(3);
    final signUpButton = find.byType(ElevatedButton);

    // Enter valid data but different passwords in confirm password field
    await tester.enterText(usernameField, 'Test User');
    await tester.enterText(emailField, 'test@example.com');
    await tester.enterText(passwordField, 'Password123');
    await tester.enterText(confirmPasswordField, 'Password124'); // Mismatch

    // Tap the sign-up button
    await tester.tap(signUpButton);
    await tester.pump(); // Rebuild after the tap

    // Check if the correct error message is displayed for password mismatch
    expect(find.text('Passwords do not match'), findsOneWidget);
  });
}
