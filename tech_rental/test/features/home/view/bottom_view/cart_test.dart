import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:tech_rental/features/home/view/bottom_view/cart.dart';

void main() {
  // 1. Test: Verify that CartPage renders cart items correctly
  testWidgets('CartPage displays cart items correctly',
      (WidgetTester tester) async {
    await tester.pumpWidget(const MaterialApp(
      home: CartPage(),
    ));

    // Verify if all cart items are displayed correctly
    expect(find.text('PS5'), findsOneWidget);
    expect(find.text('Sony Camera Pro'), findsOneWidget);
    expect(find.text('Samsung Tv'), findsOneWidget);

    // Check that the cart items display their descriptions
    expect(find.text('PS5 with dual controllers'), findsOneWidget);
    expect(find.text('camera pro'), findsOneWidget);
    expect(find.text('4k Tv'), findsOneWidget);

    // Verify that the status text is shown in green (Added to Cart)
    expect(find.text('Added to Cart'),
        findsNWidgets(3)); // All items should have this status
  });

  // 2. Test: Verify that tapping on the "Proceed to Checkout" button works
  testWidgets('Proceed to Checkout button tap', (WidgetTester tester) async {
    await tester.pumpWidget(const MaterialApp(
      home: CartPage(),
    ));

    // Check if the Proceed to Checkout button is rendered
    expect(find.text('Proceed to Checkout'), findsOneWidget);

    // Simulate a tap on the button
    await tester.tap(find.text('Proceed to Checkout'));
    await tester.pump();

    // Add expectations for what should happen after the tap (e.g., navigation)
    // Since we don't have actual navigation in this test, we just check for no errors
    // You can add a mock or navigation handler to verify this step further
  });

  // 3. Test: Verify that cart item image, name, and description are displayed
  testWidgets('Cart items display correct images, names, and descriptions',
      (WidgetTester tester) async {
    await tester.pumpWidget(const MaterialApp(
      home: CartPage(),
    ));

    // Verify the image of the PS5 item
    expect(find.byType(Image),
        findsNWidgets(3)); // We should have 3 images for 3 items
    expect(
        find.byWidgetPredicate((widget) =>
            widget is Image &&
            widget.image == const AssetImage('assets/images/ps5.png')),
        findsOneWidget); // Check for PS5 image
    expect(
        find.byWidgetPredicate((widget) =>
            widget is Image &&
            widget.image == const AssetImage('assets/images/camera.png')),
        findsOneWidget); // Check for Camera image
    expect(
        find.byWidgetPredicate((widget) =>
            widget is Image &&
            widget.image == const AssetImage('assets/images/tv.png')),
        findsOneWidget); // Check for TV image

    // Verify the names and descriptions of the items
    expect(find.text('PS5'), findsOneWidget);
    expect(find.text('Sony Camera Pro'), findsOneWidget);
    expect(find.text('Samsung Tv'), findsOneWidget);

    expect(find.text('PS5 with dual controllers'), findsOneWidget);
    expect(find.text('camera pro'), findsOneWidget);
    expect(find.text('4k Tv'), findsOneWidget);
  });
}
