// import 'package:flutter_test/flutter_test.dart';
// import 'package:mocktail/mocktail.dart';
// import 'package:tech_rental/features/home/view_model/home/home_cubit.dart';
// import 'package:tech_rental/features/home/view_model/home/home_state.dart';

// void main() {
//   late HomeCubit homeCubit;

//   setUp(() {
//     homeCubit = HomeCubit();
//   });

//   // Test 1: Test the gadget list fetching logic
//   test('HomeCubit emits gadgets list after fetching', () async {
//     // Assume that we have some method for fetching the list of gadgets
//     final expected = [
//       HomeState.initial().copyWith(isLoading: true),
//       HomeState.initial()
//           .copyWith(isLoading: false, gadgets: ['Gadget 1', 'Gadget 2']),
//     ];

//     expectLater(homeCubit.stream, emitsInOrder(expected));

//     homeCubit.fetchGadgets(); // Simulate fetching gadgets
//   });

//   // Test 2: Test if the Cubit correctly emits error states when fetching gadgets fails
//   test('HomeCubit emits error state when fetching gadgets fails', () async {
//     when(() => homeCubit.fetchGadgets())
//         .thenThrow(Exception('Failed to fetch gadgets'));

//     final expected = [
//       HomeState.initial().copyWith(isLoading: true),
//       HomeState.initial()
//           .copyWith(isLoading: false, error: 'Failed to fetch gadgets'),
//     ];

//     expectLater(homeCubit.stream, emitsInOrder(expected));

//     homeCubit.fetchGadgets(); // Simulate fetching gadgets
//   });

//   // Test 3: Test if the AddToCartEvent correctly updates the cart
//   test('HomeCubit updates cart correctly on AddToCartEvent', () async {
//     homeCubit.addToCart('Gadget 1');

//     final expected = [
//       HomeState.initial().copyWith(cart: ['Gadget 1']),
//     ];

//     expectLater(homeCubit.stream, emitsInOrder(expected));

//     homeCubit.addToCart('Gadget 1');
//   });
// }
