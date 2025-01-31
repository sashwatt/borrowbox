import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tech_rental/app/di/di.dart';
import 'package:tech_rental/features/auth/presentation/view/login_page.dart';
import 'package:tech_rental/features/auth/presentation/view_model/login/login_bloc.dart';
import 'package:tech_rental/features/auth/presentation/view_model/signup/register_bloc.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  @override
  _SignupPageState createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();

  File? _image;
  final picker = ImagePicker();

  Future<void> _pickImage(ImageSource source) async {
    final pickedFile = await picker.pickImage(source: source);
    if (pickedFile != null) {
      setState(() {
        _image = File(pickedFile.path);
      });
    }
  }

  void _showImagePicker() {
    showModalBottomSheet(
      context: context,
      builder: (context) => Container(
        padding: const EdgeInsets.all(16),
        height: 160,
        child: Column(
          children: [
            const Text(
              "Choose an option",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton.icon(
                  onPressed: () {
                    Navigator.pop(context);
                    _pickImage(ImageSource.camera);
                  },
                  icon: const Icon(Icons.camera),
                  label: const Text("Camera"),
                ),
                ElevatedButton.icon(
                  onPressed: () {
                    Navigator.pop(context);
                    _pickImage(ImageSource.gallery);
                  },
                  icon: const Icon(Icons.photo_library),
                  label: const Text("Gallery"),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(19, 34, 87, 100),
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                // Image Picker Field
                GestureDetector(
                  onTap: _showImagePicker,
                  child: CircleAvatar(
                    radius: 50,
                    backgroundColor: Colors.white.withOpacity(0.1),
                    backgroundImage: _image != null ? FileImage(_image!) : null,
                    child: _image == null
                        ? const Icon(Icons.camera_alt,
                            size: 40, color: Colors.white70)
                        : null,
                  ),
                ),
                const SizedBox(height: 10),
                const Text(
                  "Tap to upload a profile picture",
                  style: TextStyle(color: Colors.white70),
                ),
                const SizedBox(height: 30),

                const Text(
                  'BorrowBox Signup',
                  style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 30),

                // Username Field
                TextFormField(
                  controller: _usernameController,
                  decoration: InputDecoration(
                    labelText: 'Username',
                    labelStyle: const TextStyle(color: Colors.white70),
                    border: const OutlineInputBorder(),
                    prefixIcon: const Icon(Icons.person, color: Colors.white70),
                    filled: true,
                    fillColor: Colors.white.withOpacity(0.1),
                  ),
                  style: const TextStyle(color: Colors.white),
                  validator: (value) =>
                      value!.isEmpty ? 'Enter your username' : null,
                ),
                const SizedBox(height: 16),

                // Email Field
                TextFormField(
                  controller: _emailController,
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    prefixIcon: const Icon(Icons.email, color: Colors.white70),
                    labelText: 'Email',
                    labelStyle: const TextStyle(color: Colors.white70),
                    border: const OutlineInputBorder(),
                    filled: true,
                    fillColor: Colors.white.withOpacity(0.1),
                  ),
                  style: const TextStyle(color: Colors.white),
                  validator: (value) =>
                      value!.isEmpty ? 'Enter your email' : null,
                ),
                const SizedBox(height: 16),

                // Password Field
                TextFormField(
                  controller: _passwordController,
                  obscureText: true,
                  decoration: InputDecoration(
                    prefixIcon: const Icon(Icons.lock, color: Colors.white70),
                    labelText: 'Password',
                    labelStyle: const TextStyle(color: Colors.white70),
                    border: const OutlineInputBorder(),
                    filled: true,
                    fillColor: Colors.white.withOpacity(0.1),
                  ),
                  style: const TextStyle(color: Colors.white),
                  validator: (value) =>
                      value!.isEmpty ? 'Enter your password' : null,
                ),
                const SizedBox(height: 16),

                // Confirm Password Field
                TextFormField(
                  controller: _confirmPasswordController,
                  obscureText: true,
                  decoration: InputDecoration(
                    prefixIcon: const Icon(Icons.lock, color: Colors.white70),
                    labelText: 'Confirm Password',
                    labelStyle: const TextStyle(color: Colors.white70),
                    border: const OutlineInputBorder(),
                    filled: true,
                    fillColor: Colors.white.withOpacity(0.1),
                  ),
                  style: const TextStyle(color: Colors.white),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Confirm your password';
                    } else if (value != _passwordController.text) {
                      return 'Passwords do not match';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 24),

                // Signup Button
                ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate() && _image != null) {
                      context.read<RegisterBloc>().add(
                            Registercustomer(
                              context: context,
                              email: _emailController.text,
                              username: _usernameController.text,
                              password: _passwordController.text,
                            ),
                          );
                    } else if (_image == null) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text("Please select a profile picture"),
                          backgroundColor: Colors.red,
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
                  child: const Text(
                    'Sign Up',
                    style: TextStyle(
                        fontSize: 18,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                  ),
                ),

                // Login Navigation
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "Already have an account?",
                      style: TextStyle(color: Colors.white70, fontSize: 16),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => BlocProvider<LoginBloc>(
                              create: (_) => getIt<LoginBloc>(),
                              child: const LoginPage(),
                            ),
                          ),
                        );
                      },
                      child: const Text(
                        'Sign In',
                        style:
                            TextStyle(color: Color(0xFFF9B401), fontSize: 16),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:tech_rental/app/di/di.dart';
// import 'package:tech_rental/features/auth/presentation/view/login_page.dart';
// import 'package:tech_rental/features/auth/presentation/view_model/login/login_bloc.dart';
// import 'package:tech_rental/features/auth/presentation/view_model/signup/register_bloc.dart';

// class SignupPage extends StatelessWidget {
//   final _formKey = GlobalKey<FormState>();
//   final TextEditingController _usernameController = TextEditingController();
//   final TextEditingController _emailController = TextEditingController();
//   final TextEditingController _passwordController = TextEditingController();

//   SignupPage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: const Color.fromRGBO(19, 34, 87, 100),
//       body: Center(
//         child: SingleChildScrollView(
//           padding: const EdgeInsets.all(16.0),
//           child: Form(
//             key: _formKey,
//             child: Column(
//               mainAxisSize: MainAxisSize.min,
//               children: [
//                 Image.asset(
//                   'assets/images/bbicon.png',
//                   width: 150,
//                   height: 150,
//                 ),
//                 const Text(
//                   'BorrowBox Signup',
//                   style: TextStyle(
//                     fontSize: 32,
//                     fontWeight: FontWeight.bold,
//                     color: Colors.white,
//                   ),
//                 ),
//                 const SizedBox(height: 40),

//                 // Username Field
//                 TextFormField(
//                   controller: _usernameController,
//                   decoration: InputDecoration(
//                     labelText: 'Username',
//                     labelStyle: const TextStyle(color: Colors.white70),
//                     border: const OutlineInputBorder(),
//                     prefixIcon: const Icon(Icons.person, color: Colors.white70),
//                     filled: true,
//                     fillColor: Colors.white.withOpacity(0.1),
//                   ),
//                   style: const TextStyle(color: Colors.white),
//                   validator: (value) =>
//                       value!.isEmpty ? 'Enter your username' : null,
//                 ),
//                 const SizedBox(height: 16),

//                 // Email Field
//                 TextFormField(
//                   controller: _emailController,
//                   keyboardType: TextInputType.emailAddress,
//                   decoration: InputDecoration(
//                     prefixIcon: const Icon(Icons.email, color: Colors.white70),
//                     labelText: 'Email',
//                     labelStyle: const TextStyle(color: Colors.white70),
//                     border: const OutlineInputBorder(),
//                     filled: true,
//                     fillColor: Colors.white.withOpacity(0.1),
//                   ),
//                   style: const TextStyle(color: Colors.white),
//                   validator: (value) =>
//                       value!.isEmpty ? 'Enter your email' : null,
//                 ),
//                 const SizedBox(height: 16),

//                 // Password Field
//                 TextFormField(
//                   controller: _passwordController,
//                   obscureText: true,
//                   decoration: InputDecoration(
//                     prefixIcon: const Icon(Icons.lock, color: Colors.white70),
//                     labelText: 'Password',
//                     labelStyle: const TextStyle(color: Colors.white70),
//                     border: const OutlineInputBorder(),
//                     filled: true,
//                     fillColor: Colors.white.withOpacity(0.1),
//                   ),
//                   style: const TextStyle(color: Colors.white),
//                   validator: (value) =>
//                       value!.isEmpty ? 'Enter your password' : null,
//                 ),
//                 const SizedBox(height: 24),

//                 // Signup Button
//                 ElevatedButton(
//                   onPressed: () {
//                     if (_formKey.currentState!.validate()) {
//                       context.read<RegisterBloc>().add(
//                             Registercustomer(
//                               context: context,
//                               email: _emailController.text,
//                               username: _usernameController.text,
//                               password: _passwordController.text,
//                             ),
//                           );
//                     }
//                   },
//                   style: ElevatedButton.styleFrom(
//                     minimumSize: const Size(double.infinity, 50),
//                     backgroundColor: const Color(0xFFF9B401),
//                     shape: RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(8.0),
//                     ),
//                   ),
//                   child: const Text(
//                     'Sign Up',
//                     style: TextStyle(
//                         fontSize: 18,
//                         color: Colors.white,
//                         fontWeight: FontWeight.bold),
//                   ),
//                 ),

//                 // Login Navigation
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     const Text(
//                       "Already have an account?",
//                       style: TextStyle(color: Colors.white70, fontSize: 16),
//                     ),
//                     TextButton(
//                       onPressed: () {
//                         Navigator.push(
//                           context,
//                           MaterialPageRoute(
//                             builder: (context) {
//                               return BlocProvider<LoginBloc>(
//                                 create: (_) => getIt<LoginBloc>(),
//                                 child: const LoginPage(),
//                               );
//                             },
//                           ),
//                         );
//                       },
//                       child: const Text(
//                         'Sign In',
//                         style:
//                             TextStyle(color: Color(0xFFF9B401), fontSize: 16),
//                       ),
//                     ),
//                   ],
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }

// import 'dart:io';

// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:image_picker/image_picker.dart';
// import '../view_model/signup/register_bloc.dart';

// class RegisterView extends StatefulWidget {
//   const RegisterView({super.key});

//   @override
//   State<RegisterView> createState() => _RegisterViewState();
// }

// class _RegisterViewState extends State<RegisterView> {
//   final _key = GlobalKey<FormState>();
//   final _emailController = TextEditingController();
//   final _usernameController = TextEditingController();
//   final _passwordController = TextEditingController();
//   final _confirmpasswordController = TextEditingController();

//   File? _img;

//   Future<void> checkCameraPermission() async {
//     if (await Permission.camera.request().isRestricted ||
//         await Permission.camera.request().isDenied) {
//       await Permission.camera.request();
//     }
//   }

//   Future _browseImage(ImageSource imageSource) async {
//     try {
//       final image = await ImagePicker().pickImage(source: imageSource);
//       if (image != null) {
//         setState(() {
//           _img = File(image.path);
//         });
//       }
//     } catch (e) {
//       debugPrint(e.toString());
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         leading: IconButton(
//           icon: const Icon(Icons.arrow_back),
//           onPressed: () {
//             Navigator.pushReplacementNamed(context, '/');
//           },
//         ),
//         backgroundColor: Colors.transparent,
//         elevation: 0,
//         iconTheme: const IconThemeData(color: Colors.black),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.symmetric(horizontal: 16.0),
//         child: SingleChildScrollView(
//           child: Form(
//             key: _key,
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 const SizedBox(height: 30), // Reduced space slightly
//                 Center(
//                   child: InkWell(
//                     onTap: () {
//                       showModalBottomSheet(
//                         backgroundColor: Colors.grey[300],
//                         context: context,
//                         isScrollControlled: true,
//                         shape: const RoundedRectangleBorder(
//                           borderRadius: BorderRadius.vertical(
//                             top: Radius.circular(20),
//                           ),
//                         ),
//                         builder: (context) => Padding(
//                           padding: const EdgeInsets.all(20),
//                           child: Row(
//                             mainAxisAlignment: MainAxisAlignment.spaceAround,
//                             children: [
//                               ElevatedButton.icon(
//                                 onPressed: () {
//                                   checkCameraPermission();
//                                   _browseImage(ImageSource.camera);
//                                   Navigator.pop(context);
//                                 },
//                                 icon: const Icon(Icons.camera),
//                                 label: const Text('Camera'),
//                                 style: ElevatedButton.styleFrom(
//                                   backgroundColor: const Color(0xFFA8CD00),
//                                 ),
//                               ),
//                               ElevatedButton.icon(
//                                 onPressed: () {
//                                   _browseImage(ImageSource.gallery);
//                                   Navigator.pop(context);
//                                 },
//                                 icon: const Icon(Icons.image),
//                                 label: const Text('Gallery'),
//                                 style: ElevatedButton.styleFrom(
//                                   backgroundColor: const Color(0xFFA8CD00),
//                                 ),
//                               ),
//                             ],
//                           ),
//                         ),
//                       );
//                     },
//                     child: CircleAvatar(
//                       radius: 50,
//                       backgroundColor: Colors.grey[200],
//                       child: _img != null
//                           ? ClipOval(
//                               child: Image.file(
//                                 _img!,
//                                 width: 100,
//                                 height: 100,
//                                 fit: BoxFit.cover,
//                               ),
//                             )
//                           : const Icon(
//                               Icons.camera_alt,
//                               size: 40,
//                               color: Colors.grey,
//                             ),
//                     ),
//                   ),
//                 ),
//                 const SizedBox(height: 8),
//                 const Center(
//                   child: Text(
//                     'Tap to upload a profile picture',
//                     style: TextStyle(color: Colors.grey),
//                   ),
//                 ),
//                 const SizedBox(height: 15),
//                 const Text(
//                   'Sign Up',
//                   style: TextStyle(
//                     fontSize: 24,
//                     fontWeight: FontWeight.bold,
//                   ),
//                 ),
//                 const SizedBox(height: 15),
//                 TextFormField(
//                   controller: _usernameController,
//                   decoration: const InputDecoration(
//                     labelText: 'Username',
//                     border: OutlineInputBorder(),
//                     prefixIcon: Icon(Icons.person),
//                   ),
//                   validator: (value) {
//                     if (value == null || value.isEmpty) {
//                       return 'Username is required';
//                     }
//                     return null;
//                   },
//                 ),
//                 const SizedBox(height: 15), // Reduced space slightly
//                 TextFormField(
//                   controller: _emailController,
//                   decoration: const InputDecoration(
//                     labelText: 'Email Address',
//                     border: OutlineInputBorder(),
//                     prefixIcon: Icon(Icons.email),
//                   ),
//                   validator: (value) {
//                     if (value == null || value.isEmpty) {
//                       return 'Email Address is required';
//                     }
//                     return null;
//                   },
//                 ),
//                 const SizedBox(height: 15), // Reduced space slightly
//                 TextFormField(
//                   controller: _passwordController,
//                   decoration: const InputDecoration(
//                     labelText: 'Password',
//                     border: OutlineInputBorder(),
//                     prefixIcon: Icon(Icons.lock),
//                   ),
//                   obscureText: true,
//                   validator: (value) {
//                     if (value == null || value.isEmpty) {
//                       return 'Password is required';
//                     }
//                     return null;
//                   },
//                 ),
//                 const SizedBox(height: 15), // Reduced space slightly
//                 TextFormField(
//                   controller: _confirmpasswordController,
//                   decoration: const InputDecoration(
//                     labelText: 'Confirm Password',
//                     border: OutlineInputBorder(),
//                     prefixIcon: Icon(Icons.lock),
//                   ),
//                   obscureText: true,
//                   validator: (value) {
//                     if (value == null || value.isEmpty) {
//                       return 'Confirm Password is required';
//                     }
//                     if (value != _passwordController.text) {
//                       return 'Passwords do not match';
//                     }
//                     return null;
//                   },
//                 ),
//                 const SizedBox(height: 15), // Reduced space slightly
//                 SizedBox(
//                   width: double.infinity,
//                   child: ElevatedButton(
//                     style: ElevatedButton.styleFrom(
//                       backgroundColor: const Color(0xFFA8CD00),
//                     ),
//                     onPressed: () {
//                       if (_img == null) {
//                         ScaffoldMessenger.of(context).showSnackBar(
//                           const SnackBar(
//                             content: Text('Please upload an image.'),
//                             backgroundColor: Colors.red, // Red Snackbar
//                           ),
//                         );
//                       } else if (_key.currentState!.validate()) {
//                         context.read<RegisterBloc>().add(
//                               Registercustomer(
//                                 context: context,
//                                 email: _emailController.text,
//                                 username: _usernameController.text,
//                                 password: _passwordController.text,
//                                 image: _img,
//                               ),
//                             );
//                       }
//                     },
//                     child: const Text('Sign Up'),
//                   ),
//                 ),
//                 const SizedBox(height: 15), // Reduced space slightly
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     const Text('Already Have An Account?'),
//                     TextButton(
//                       onPressed: () {
//                         Navigator.push(
//                           context,
//                           MaterialPageRoute(
//                             builder: (context) {
//                               return BlocProvider<LoginBloc>(
//                                 create: (_) => getIt<LoginBloc>(),
//                                 child: LoginView(),
//                               );
//                             },
//                           ),
//                         );
//                       },
//                       child: const Text('Login'),
//                     ),
//                   ],
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
