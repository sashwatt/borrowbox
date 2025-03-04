// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter_test/flutter_test.dart';
// import 'package:tech_rental/features/home/view/bottom_view/cart.dart';
// import 'package:tech_rental/features/home/view/bottom_view/dashboard.dart';
// import 'package:tech_rental/features/home/view_model/home/home_cubit.dart';

// void main() {
//   // UI Test for Dashboard Navigation

//   testWidgets('Dashboard renders categories and hot deals correctly',
//       (WidgetTester tester) async {
//     await tester.pumpWidget(MaterialApp(
//       home: BlocProvider<HomeCubit>(
//         create: (_) => HomeCubit(),
//         child: const Dashboard(),
//       ),
//     ));

//     // Verify Categories section
//     expect(find.text('Gadgets'),
//         findsOneWidget); // Check if Gadgets text is visible
//     expect(find.byType(CategoryItem),
//         findsNWidgets(4)); // Verify that there are 4 category items

//     // Verify Hot Deals section
//     expect(find.text('Hot deals'),
//         findsOneWidget); // Check if Hot deals text is visible
//     expect(find.byType(HotDealCard),
//         findsNWidgets(4)); // Verify that there are 4 hot deal cards
//   });

//   // UI Test for HotDealCard SnackBar
//   testWidgets('HotDealCard shows snack bar on tap',
//       (WidgetTester tester) async {
//     await tester.pumpWidget(MaterialApp(
//       home: BlocProvider<HomeCubit>(
//         create: (_) => HomeCubit(),
//         child: const Dashboard(),
//       ),
//     ));

//     // Tap on the first HotDealCard
//     await tester.tap(find.byType(HotDealCard).first);
//     await tester.pump();

//     // Verify the snack bar appears
//     expect(find.byType(SnackBar), findsOneWidget);
//     expect(find.text('Added to Cart Successfully'), findsOneWidget);
//   });

//   // Widget Test for CategoryItem
//   testWidgets('CategoryItem displays the correct label and icon',
//       (WidgetTester tester) async {
//     await tester.pumpWidget(
//       const MaterialApp(
//         home: CategoryItem(
//           icon: Icons.videogame_asset_rounded,
//           label: 'PlayStation',
//         ),
//       ),
//     );

//     // Verify the icon and label are displayed correctly
//     expect(find.byIcon(Icons.videogame_asset_rounded), findsOneWidget);
//     expect(find.text('PlayStation'), findsOneWidget);
//   });

//   // Widget Test for HotDealCard
//   testWidgets('HotDealCard displays correct details',
//       (WidgetTester tester) async {
//     await tester.pumpWidget(
//       const MaterialApp(
//         home: HotDealCard(
//           imagePath: 'assets/images/ps5.png',
//           category: 'PlayStation',
//           name: 'PS5',
//           price: 'NPR 4000',
//         ),
//       ),
//     );

//     // Verify the details are displayed correctly
//     expect(find.text('PlayStation'), findsOneWidget);
//     expect(find.text('PS5'), findsOneWidget);
//     expect(find.text('NPR 4000'), findsOneWidget);
//     expect(find.byType(Image), findsOneWidget); // Verify image is displayed
//   });

//   // Widget Test for BottomNavItem
//   testWidgets('BottomNavItem displays correct icon and selection',
//       (WidgetTester tester) async {
//     await tester.pumpWidget(
//       MaterialApp(
//         home: BottomNavItem(
//           icon: Icons.laptop,
//           isSelected: true,
//           onTap: () {},
//         ),
//       ),
//     );

//     // Verify the icon is displayed correctly and selected state is true
//     expect(find.byIcon(Icons.laptop), findsOneWidget);
//     expect(
//       tester.widget<Icon>(find.byIcon(Icons.laptop)).color,
//       equals(Colors
//           .yellow[700]), // Check if the icon color is yellow (selected state)
//     );
//   });

//   // Additional Test 2: Test if the "Proceed to Checkout" button works
//   testWidgets('Proceed to Checkout button displays correctly',
//       (WidgetTester tester) async {
//     await tester.pumpWidget(MaterialApp(
//       home: BlocProvider<HomeCubit>(
//         create: (_) => HomeCubit(),
//         child: const CartPage(), // Navigate to CartPage directly for the test
//       ),
//     ));

//     // Verify that the "Proceed to Checkout" button is displayed
//     expect(find.text('Proceed to Checkout'), findsOneWidget);

//     // Simulate a tap on the button
//     await tester.tap(find.text('Proceed to Checkout'));
//     await tester.pump();

//     // Add expectations for what should happen after the tap
//     // You can mock navigation or any other expected behavior if needed
//     // For now, just check if the button tap causes no errors
//   });
// }

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:tech_rental/features/home/view/bottom_view/cart.dart';
import 'package:tech_rental/features/home/view/bottom_view/dashboard.dart';
import 'package:tech_rental/features/home/view_model/home/home_cubit.dart';

void main() {
  // UI Test for Dashboard Rendering
  testWidgets('Dashboard renders categories and hot deals correctly',
      (WidgetTester tester) async {
    await tester.pumpWidget(const MaterialApp(
      home: DashboardHomePage(), // Directly providing the home widget here
    ));

    // Verify Categories section
    expect(find.text('Gadgets'),
        findsOneWidget); // Check if Gadgets text is visible
    expect(find.byType(CategoryItem),
        findsNWidgets(5)); // 4 category items + 'All' category

    // Verify Hot Deals section
    expect(find.text('Hot deals'),
        findsOneWidget); // Check if Hot deals text is visible
    expect(find.byType(HotDealCard),
        findsNWidgets(4)); // Verify there are 4 hot deal cards
  });

  // UI Test for HotDealCard SnackBar
  testWidgets('HotDealCard shows snack bar on tap',
      (WidgetTester tester) async {
    await tester.pumpWidget(const MaterialApp(
      home: DashboardHomePage(),
    ));

    // Tap on the first HotDealCard
    await tester.tap(find.byType(HotDealCard).first);
    await tester.pump();

    // Verify the snack bar appears
    expect(find.byType(SnackBar), findsOneWidget);
    expect(find.text('Added to Cart Successfully'), findsOneWidget);
  });

  // UI Test for CategoryItem Filter Functionality
  testWidgets('CategoryItem updates the displayed gadgets correctly',
      (WidgetTester tester) async {
    await tester.pumpWidget(const MaterialApp(
      home: DashboardHomePage(),
    ));

    // Verify all gadgets are visible initially
    expect(find.text('PS5'), findsOneWidget);
    expect(find.text('MacBook Air M2'), findsOneWidget);
    expect(find.text('Iphone 14 Pro'), findsOneWidget);

    // Tap the 'PlayStation' category to filter
    await tester.tap(find.text('PlayStation'));
    await tester.pump();

    // Verify that only PlayStation gadgets are shown
    expect(find.text('PS5'), findsOneWidget);
    expect(find.text('MacBook Air M2'), findsNothing);
    expect(find.text('Iphone 14 Pro'), findsNothing);

    // Tap 'All' category to reset filter
    await tester.tap(find.text('All'));
    await tester.pump();

    // Verify all gadgets are shown again
    expect(find.text('PS5'), findsOneWidget);
    expect(find.text('MacBook Air M2'), findsOneWidget);
    expect(find.text('Iphone 14 Pro'), findsOneWidget);
  });

  // UI Test for Search Bar Functionality
  testWidgets('Search bar filters gadgets correctly',
      (WidgetTester tester) async {
    await tester.pumpWidget(const MaterialApp(
      home: DashboardHomePage(),
    ));

    // Initially, all gadgets should be visible
    expect(find.text('PS5'), findsOneWidget);
    expect(find.text('MacBook Air M2'), findsOneWidget);
    expect(find.text('Iphone 14 Pro'), findsOneWidget);

    // Enter 'PS5' in the search bar to filter gadgets
    await tester.enterText(find.byType(TextField), 'PS5');
    await tester.pump();

    // Verify only PS5 is visible after search
    expect(find.text('PS5'), findsOneWidget);
    expect(find.text('MacBook Air M2'), findsNothing);
    expect(find.text('Iphone 14 Pro'), findsNothing);
  });

  // Widget Test for CategoryItem Displaying Icon and Label

  // Widget Test for HotDealCard Displaying Correct Details
  testWidgets('HotDealCard displays correct details',
      (WidgetTester tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: HotDealCard(
          imagePath: 'assets/images/ps5.png',
          category: 'PlayStation',
          name: 'PS5',
          price: 'NPR 4000',
        ),
      ),
    );

    // Verify the details are displayed correctly
    expect(find.text('PlayStation'), findsOneWidget);
    expect(find.text('PS5'), findsOneWidget);
    expect(find.text('NPR 4000'), findsOneWidget);
    expect(find.byType(Image), findsOneWidget); // Verify image is displayed
  });

  // Widget Test for BottomNavItem Selection State
  testWidgets('BottomNavItem displays correct icon and selection state',
      (WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: BottomNavItem(
          icon: Icons.laptop,
          isSelected: true,
          onTap: () {},
        ),
      ),
    );

    // Verify the icon is displayed correctly and selected state is true
    expect(find.byIcon(Icons.laptop), findsOneWidget);
    expect(
      tester.widget<Icon>(find.byIcon(Icons.laptop)).color,
      equals(Colors
          .yellow[700]), // Check if the icon color is yellow (selected state)
    );
  });

  // Widget Test for CartPage Button
  testWidgets('Proceed to Checkout button works correctly in CartPage',
      (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(
      home: BlocProvider<HomeCubit>(
        create: (_) => HomeCubit(),
        child: const CartPage(), // Navigate to CartPage directly for the test
      ),
    ));

    // Verify that the "Proceed to Checkout" button is displayed
    expect(find.text('Proceed to Checkout'), findsOneWidget);

    // Simulate a tap on the button
    await tester.tap(find.text('Proceed to Checkout'));
    await tester.pump();

    // You can add additional expectations for the expected behavior after tapping
    // For example, if it navigates to another page, you can test that too
  });
}
