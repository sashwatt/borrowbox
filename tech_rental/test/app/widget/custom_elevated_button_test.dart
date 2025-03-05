import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:tech_rental/app/widget/custom_elevated_button.dart';

void main() {
  testWidgets('CustomElevatedButton renders and responds to tap',
      (WidgetTester tester) async {
    // Define the callback to be tested
    bool buttonPressed = false;
    void onPressedCallback() {
      buttonPressed = true;
    }

    // Build the widget tree with the CustomElevatedButton
    await tester.pumpWidget(MaterialApp(
      home: Scaffold(
        body: CustomElevatedButton(
          onPressed: onPressedCallback,
          text: 'Click Me',
        ),
      ),
    ));

    // Verify the button is rendered with the correct text
    expect(find.text('Click Me'), findsOneWidget);
    expect(find.byType(ElevatedButton), findsOneWidget);

    // Simulate a tap on the button
    await tester.tap(find.byType(ElevatedButton));
    await tester.pump();

    // Verify the onPressed callback was triggered
    expect(buttonPressed, isTrue);
  });
}
