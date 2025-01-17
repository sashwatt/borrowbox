// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:tech_rental/features/auth/presentation/view_model/signup/register_bloc.dart';
// import '../view_model/login/login_bloc.dart';
// import '../view_model/login/login_event.dart';
// import '../view_model/login/login_state.dart';

// class LoginPage extends StatelessWidget {
//   const LoginPage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     final TextEditingController usernameController = TextEditingController();
//     final TextEditingController passwordController = TextEditingController();

//     return Scaffold(
//       backgroundColor: const Color.fromRGBO(19, 34, 87, 100),
//       body: BlocProvider(
//         create: (context) => LoginBloc(),
//         child: Center(
//           child: SingleChildScrollView(
//             padding: const EdgeInsets.all(16.0),
//             child: BlocBuilder<LoginBloc, LoginState>(
//               builder: (context, state) {
//                 return Form(
//                   child: Column(
//                     mainAxisSize: MainAxisSize.min,
//                     children: [
//                       Image.asset(
//                         'assets/images/bbicon.png',
//                         width: 150,
//                         height: 150,
//                       ),
//                       const SizedBox(height: 20),

//                       // App Title
//                       const Text(
//                         'BorrowBox Login',
//                         style: TextStyle(
//                           fontSize: 32,
//                           fontWeight: FontWeight.bold,
//                           color: Colors.white,
//                         ),
//                       ),
//                       const SizedBox(height: 40),

//                       // Username Field
//                       TextFormField(
//                         controller: usernameController,
//                         keyboardType: TextInputType.emailAddress,
//                         decoration: const InputDecoration(
//                           labelText: 'Username',
//                           border: OutlineInputBorder(),
//                           prefixIcon: Icon(Icons.person),
//                           filled: true,
//                           fillColor: Colors.white,
//                         ),
//                       ),
//                       const SizedBox(height: 16),

//                       // Password Field
//                       TextFormField(
//                         controller: passwordController,
//                         obscureText: !state.isPasswordVisible,
//                         decoration: InputDecoration(
//                           labelText: 'Password',
//                           border: const OutlineInputBorder(),
//                           prefixIcon: const Icon(Icons.lock),
//                           filled: true,
//                           fillColor: Colors.white,
//                           suffixIcon: IconButton(
//                             icon: Icon(
//                               state.isPasswordVisible
//                                   ? Icons.visibility
//                                   : Icons.visibility_off,
//                             ),
//                             onPressed: () {
//                               context
//                                   .read<LoginBloc>()
//                                   .add(TogglePasswordVisibility());
//                             },
//                           ),
//                         ),
//                       ),
//                       const SizedBox(height: 24),

//                       // Error Message
//                       if (state.errorMessage != null)
//                         Padding(
//                           padding: const EdgeInsets.only(bottom: 16),
//                           child: Text(
//                             state.errorMessage!,
//                             style: const TextStyle(color: Colors.red),
//                           ),
//                         ),

//                       // Login Button
//                       ElevatedButton(
//                         onPressed: state.isLoading
//                             ? null
//                             : () {
//                                 context.read<LoginBloc>().add(
//                                       LoginSubmitted(
//                                         username: usernameController.text,
//                                         password: passwordController.text,
//                                       ),
//                                     );
//                               },
//                         style: ElevatedButton.styleFrom(
//                           minimumSize: const Size(double.infinity, 50),
//                           backgroundColor: const Color(0xFFF9B401),
//                           shape: RoundedRectangleBorder(
//                             borderRadius: BorderRadius.circular(8.0),
//                           ),
//                         ),
//                         child: state.isLoading
//                             ? const CircularProgressIndicator(
//                                 color: Colors.white,
//                               )
//                             : const Text(
//                                 'Login',
//                                 style: TextStyle(
//                                     fontSize: 18, color: Colors.white),
//                               ),
//                       ),

//                       // Signup Navigation
//                       Row(
//                         mainAxisAlignment: MainAxisAlignment.center,
//                         children: [
//                           const Text(
//                             "Don't have an account?",
//                             style: TextStyle(color: Colors.grey, fontSize: 16),
//                           ),
//                           TextButton(
//                             onPressed: () {
//                               Navigator.pushNamed(context, '/signup');
//                             },
//                             child: const Text(
//                               'Sign up',
//                               style: TextStyle(
//                                   color: Color(0xFFF9B401), fontSize: 16),
//                             ),
//                           ),
//                         ],
//                       ),
//                     ],
//                   ),
//                 );
//               },
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tech_rental/core/common/snackbar/my_snackbar.dart'; // Assuming the Snackbar class is there
import 'package:tech_rental/features/auth/presentation/view/signup_page.dart';
import 'package:tech_rental/features/auth/presentation/view_model/login/login_bloc.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});

  final _formKey = GlobalKey<FormState>();
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(19, 34, 87, 100),
      body: BlocProvider(
        create: (context) => LoginBloc(),
        child: BlocListener<LoginBloc, LoginState>(
          listener: (context, state) {
            if (state.navigateToSignup) {
              // Navigate to the signup page
              Navigator.pushNamed(context, '/signup');
            }
            if (state.navigateToHome) {
              // Navigate to Home page after successful login
              showMySnackBar(context: context, message: "Login successful!");
            }
            if (state.errorMessage != null) {
              // Show error message as a Snackbar
              showMySnackBar(
                context: context,
                message: state.errorMessage!,
                color: Colors.red,
              );
            }
          },
          child: Center(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(16.0),
              child: BlocBuilder<LoginBloc, LoginState>(
                builder: (context, state) {
                  return Form(
                    key: _formKey,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Image.asset(
                          'assets/images/bbicon.png',
                          width: 150,
                          height: 150,
                        ),
                        const SizedBox(height: 20),
                        const Text(
                          'BorrowBox Login',
                          style: TextStyle(
                            fontSize: 32,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                        const SizedBox(height: 40),
                        TextFormField(
                          controller: usernameController,
                          keyboardType: TextInputType.emailAddress,
                          decoration: const InputDecoration(
                            labelText: 'Username',
                            border: OutlineInputBorder(),
                            prefixIcon: Icon(Icons.person),
                            filled: true,
                            fillColor: Colors.white,
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter username';
                            }
                            return null;
                          },
                        ),
                        const SizedBox(height: 16),
                        TextFormField(
                          controller: passwordController,
                          obscureText: !state.isPasswordVisible,
                          decoration: InputDecoration(
                            labelText: 'Password',
                            border: const OutlineInputBorder(),
                            prefixIcon: const Icon(Icons.lock),
                            filled: true,
                            fillColor: Colors.white,
                            suffixIcon: IconButton(
                              icon: Icon(
                                state.isPasswordVisible
                                    ? Icons.visibility
                                    : Icons.visibility_off,
                              ),
                              onPressed: () {
                                context
                                    .read<LoginBloc>()
                                    .add(TogglePasswordVisibility());
                              },
                            ),
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter password';
                            }
                            return null;
                          },
                        ),
                        const SizedBox(height: 24),
                        ElevatedButton(
                          onPressed: state.isLoading
                              ? null
                              : () {
                                  if (_formKey.currentState?.validate() ??
                                      false) {
                                    context.read<LoginBloc>().add(
                                          LoginSubmitted(
                                            username: usernameController.text,
                                            password: passwordController.text,
                                            context: context,
                                          ),
                                        );
                                  }
                                },
                          style: ElevatedButton.styleFrom(
                            minimumSize: const Size(double.infinity, 50),
                            backgroundColor: const Color(0xFFF9B401),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                          ),
                          child: state.isLoading
                              ? const CircularProgressIndicator(
                                  color: Colors.white,
                                )
                              : const Text(
                                  'Login',
                                  style: TextStyle(
                                      fontSize: 18, color: Colors.white),
                                ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text(
                              "Don't have an account?",
                              style:
                                  TextStyle(color: Colors.grey, fontSize: 16),
                            ),
                            TextButton(
                              onPressed: () {
                                context.read<LoginBloc>().add(
                                      NavigateToSignup(
                                        destination: const SignupPage(),
                                        context: context,
                                      ),
                                    );
                              },
                              child: const Text(
                                'Sign up',
                                style: TextStyle(
                                    color: Color(0xFFF9B401), fontSize: 16),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}
