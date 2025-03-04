// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter_test/flutter_test.dart';
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
// }

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:tech_rental/features/home/view/bottom_view/cart.dart';
import 'package:tech_rental/features/home/view/bottom_view/dashboard.dart';
import 'package:tech_rental/features/home/view_model/home/home_cubit.dart';

void main() {
  // UI Test for Dashboard Navigation

  testWidgets('Dashboard renders categories and hot deals correctly',
      (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(
      home: BlocProvider<HomeCubit>(
        create: (_) => HomeCubit(),
        child: const Dashboard(),
      ),
    ));

    // Verify Categories section
    expect(find.text('Gadgets'),
        findsOneWidget); // Check if Gadgets text is visible
    expect(find.byType(CategoryItem),
        findsNWidgets(4)); // Verify that there are 4 category items

    // Verify Hot Deals section
    expect(find.text('Hot deals'),
        findsOneWidget); // Check if Hot deals text is visible
    expect(find.byType(HotDealCard),
        findsNWidgets(4)); // Verify that there are 4 hot deal cards
  });

  // UI Test for HotDealCard SnackBar
  testWidgets('HotDealCard shows snack bar on tap',
      (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(
      home: BlocProvider<HomeCubit>(
        create: (_) => HomeCubit(),
        child: const Dashboard(),
      ),
    ));

    // Tap on the first HotDealCard
    await tester.tap(find.byType(HotDealCard).first);
    await tester.pump();

    // Verify the snack bar appears
    expect(find.byType(SnackBar), findsOneWidget);
    expect(find.text('Added to Cart Successfully'), findsOneWidget);
  });

  // Widget Test for CategoryItem
  testWidgets('CategoryItem displays the correct label and icon',
      (WidgetTester tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: CategoryItem(
          icon: Icons.videogame_asset_rounded,
          label: 'PlayStation',
        ),
      ),
    );

    // Verify the icon and label are displayed correctly
    expect(find.byIcon(Icons.videogame_asset_rounded), findsOneWidget);
    expect(find.text('PlayStation'), findsOneWidget);
  });

  // Widget Test for HotDealCard
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

  // Widget Test for BottomNavItem
  testWidgets('BottomNavItem displays correct icon and selection',
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

  // Additional Test 2: Test if the "Proceed to Checkout" button works
  testWidgets('Proceed to Checkout button displays correctly',
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

    // Add expectations for what should happen after the tap
    // You can mock navigation or any other expected behavior if needed
    // For now, just check if the button tap causes no errors
  });
}
