import 'package:flutter/material.dart';
// import 'package:login_api/homepage.dart';
import 'package:login_api/loginapi.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      home: LoginApi(),
    );
  }
}

// class MyHomePage extends StatefulWidget {
//   const MyHomePage({super.key});

//   @override
//   State<MyHomePage> createState() => _MyHomePageState();
// }

// class _MyHomePageState extends State<MyHomePage> {
//   final _formKey = GlobalKey<FormState>();
//   final TextEditingController name = TextEditingController();
//   final TextEditingController password = TextEditingController();
//   bool _isObscured = true;
//   bool isLoading = false;

//   Future<void> fetchData(String name, String password) async {
//     if (!_formKey.currentState!.validate()) {
//       print("Validation failed!");
//       return;
//     }
//     setState(() {
//       isLoading = true;
//     });
//     print("Attempting login with username: $name");
//     try {
//       final response = await http.post(
//         Uri.parse('https://dummyjson.com/auth/login'),
//         headers: {'Content-Type': 'application/json'},
//         body: jsonEncode({"username": name, "password": password}),
//       );

//       print("Response Status: ${response.statusCode}");
//       print("Response Body: ${response.body}");
//       if (response.statusCode == 200) {
//         final data = jsonDecode(response.body);

//         if (mounted) {
//           Navigator.pushReplacement(
//             context,
//             MaterialPageRoute(builder: (context) => const HomeScreen()),
//           );
//         }

//         print('Login Successful! Token: ${data["token"]}');
//       } else {
//         print('Login Failed: ${jsonDecode(response.body)["message"]}');
//       }
//     } catch (e) {
//       print('Error: $e');
//     } finally {
//       setState(() {
//         isLoading = false;
//       });
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: <Widget>[
//           const Padding(
//             padding: EdgeInsets.only(top: 10.0),
//             child: Center(
//               child: Text(
//                 'Logo',
//                 style: TextStyle(
//                     color: Colors.black,
//                     fontSize: 30,
//                     fontWeight: FontWeight.bold),
//               ),
//             ),
//           ),
//           const Padding(
//               padding: EdgeInsets.only(left: 8.0),
//               child: Text(
//                 'Login',
//                 style: TextStyle(
//                     color: Colors.black,
//                     fontSize: 24,
//                     fontWeight: FontWeight.bold),
//               )),
//           const Padding(
//             padding: EdgeInsets.only(left: 8.0),
//             child: Text(
//               'Welcome !',
//               style: TextStyle(color: Colors.black, fontSize: 14),
//             ),
//           ),
//           Padding(
//               padding: const EdgeInsets.all(10.0),
//               child: Form(
//                   key: _formKey,
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       const Text(
//                         'User Name',
//                         style: TextStyle(color: Colors.black, fontSize: 14),
//                       ),
//                       TextFormField(
//                         controller: name,
//                         validator: (value) {
//                           if (value == null || value.isEmpty) {
//                             return 'Please enter your email';
//                           }
//                           // if (!RegExp(
//                           //         r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$')
//                           //     .hasMatch(value)) {
//                           //   return 'Enter a valid email';
//                           // }
//                           return null;
//                         },
//                         decoration: InputDecoration(
//                             hintText: 'Enter User Name',
//                             focusedBorder: OutlineInputBorder(
//                                 borderRadius: BorderRadius.circular(8),
//                                 borderSide: const BorderSide(
//                                     color: Colors.black, width: 2.0)),
//                             border: OutlineInputBorder(
//                                 borderRadius: BorderRadius.circular(8))),
//                       ),
//                       const SizedBox(
//                         height: 10,
//                       ),
//                       const Text(
//                         'Password',
//                         style: TextStyle(color: Colors.black, fontSize: 14),
//                       ),
//                       TextFormField(
//                         controller: password,
//                         validator: (value) {
//                           if (value == null || value.isEmpty) {
//                             return 'Please enter your password';
//                           }
//                           if (value.length < 6) {
//                             return 'Password must be at least 6 characters';
//                           }
//                           return null;
//                         },
//                         obscureText: _isObscured,
//                         decoration: InputDecoration(
//                             suffixIcon: IconButton(
//                                 onPressed: () {
//                                   setState(() {
//                                     _isObscured = !_isObscured;
//                                   });
//                                 },
//                                 icon: Icon(_isObscured
//                                     ? Icons.visibility_off
//                                     : Icons.visibility)),
//                             hintText: 'Enter Password',
//                             focusedBorder: OutlineInputBorder(
//                                 borderRadius: BorderRadius.circular(8),
//                                 borderSide: const BorderSide(
//                                     color: Colors.black, width: 2.0)),
//                             border: OutlineInputBorder(
//                                 borderRadius: BorderRadius.circular(8))),
//                       )
//                     ],
//                   ))),
//           const Padding(
//             padding: EdgeInsets.only(right: 10.0),
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.end,
//               children: [
//                 Text(
//                   'Forget Password?',
//                   style: TextStyle(
//                       color: Colors.blue,
//                       decoration: TextDecoration.underline,
//                       decorationColor: Colors.blue),
//                 )
//               ],
//             ),
//           ),
//           const SizedBox(
//             height: 10,
//           ),
//           SizedBox(
//             width: double.infinity,
//             child: Padding(
//               padding: const EdgeInsets.all(8.0),
//               child: ElevatedButton(
//                 onPressed: isLoading
//                     ? null
//                     : () {
//                         fetchData(name.text, password.text);
//                       },
//                 style: ElevatedButton.styleFrom(
//                     backgroundColor: Colors.yellow,
//                     shape: RoundedRectangleBorder(
//                         borderRadius: BorderRadius.circular(8))),
//                 child: isLoading
//                     ? const CircularProgressIndicator(color: Colors.white)
//                     : const Text(
//                         'Login',
//                         style: TextStyle(color: Colors.black, fontSize: 18),
//                       ),
//               ),
//             ),
//           ),
//           const Row(
//             mainAxisAlignment: MainAxisAlignment.end,
//             children: [
//               Text(
//                 'Do you want to sign in?',
//                 style: TextStyle(color: Colors.black),
//               ),
//               SizedBox(
//                 width: 10,
//               ),
//               Padding(
//                 padding: EdgeInsets.only(right: 8.0),
//                 child: Text(
//                   'Sign Up',
//                   style: TextStyle(
//                       color: Colors.blue,
//                       decoration: TextDecoration.underline,
//                       decorationColor: Colors.blue),
//                 ),
//               )
//             ],
//           )
//         ],
//       ),
//     );
//   }
// }

// class HomeScreen extends StatelessWidget {
//   const HomeScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: const Text('Home')),
//       body: const Center(
//         child: Text(
//           'Welcome to the Home Screen!',
//           style: TextStyle(fontSize: 20),
//         ),
//       ),
//     );
//   }
// }
