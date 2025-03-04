import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:tech_rental/app/widget/custom_text_formfield.dart';

void main() {
  testWidgets('CustomTextFormField renders, allows input, and validates',
      (WidgetTester tester) async {
    // Define a TextEditingController to control the text field's value
    final controller = TextEditingController();

    // Build the widget tree with the CustomTextFormField
    await tester.pumpWidget(MaterialApp(
      home: Scaffold(
        body: CustomTextFormField(
          onPressed:
              () {}, // You can leave the onPressed empty or test it as needed
          text: 'Email',
          controller: controller,
        ),
      ),
    ));

    // Verify the TextFormField is rendered with the correct label text
    expect(find.byType(TextFormField), findsOneWidget);
    expect(find.text('Email'), findsOneWidget);

    // Simulate entering text in the TextFormField
    await tester.enterText(find.byType(TextFormField), 'test@example.com');
    await tester.pump(); // Rebuild the widget after input

    // Verify that the TextFormField now contains the entered text
    expect(controller.text, 'test@example.com');

    // Simulate submitting the form (or triggering validation)
    final formKey = GlobalKey<FormState>();
    final form = Form(
      key: formKey,
      child: CustomTextFormField(
        onPressed: () {}, // Still leave the onPressed empty for now
        text: 'Email',
        controller: controller,
      ),
    );
    await tester.pumpWidget(MaterialApp(home: Scaffold(body: form)));

    // Trigger form validation (normally this would happen with form submission)
    formKey.currentState!.validate();

    // Verify no validation error since we've entered text
    expect(formKey.currentState!.validate(), isTrue);

    // Clear the controller to test validation on an empty field
    controller.clear();
    await tester.pump(); // Rebuild after clearing the text

    // Revalidate the form
    formKey.currentState!.validate();

    // Verify validation error is shown because the field is empty
    expect(formKey.currentState!.validate(), isFalse);
  });
}
