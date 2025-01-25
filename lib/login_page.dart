import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:e_commerce/registrationPage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:e_commerce/product_page.dart';
import 'package:e_commerce/OTP_screen.dart';

class LoginPage extends StatefulWidget {
  static const String id = 'wellcome_screen';
  static String verify = '';

  const LoginPage({super.key});
  @override
  LoginPageState createState() => LoginPageState();
}

class LoginPageState extends State<LoginPage> {
  final _auth = FirebaseAuth.instance;
  TextEditingController? numberController = TextEditingController();
  TextEditingController? emailController = TextEditingController();
  TextEditingController? passwordController = TextEditingController();
  bool isShowPassword = true;
  bool isSpinner = false;
  String? number;
  String? email;
  String? password;

  // bool isEmail(String input) {
  //   String emailPattern = r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$';
  //   RegExp regExp = RegExp(emailPattern);
  //   return regExp.hasMatch(input);
  // }
  //
  // bool isPhoneNumber(String input) {
  //   String passwordPattern = (r'^[0-9]{10,15}$');
  //   RegExp regExp = RegExp(passwordPattern);
  //   return regExp.hasMatch(input);
  // }

  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      inAsyncCall: isSpinner,
      progressIndicator: const CircularProgressIndicator(
        //simple color property is also progressIndicator but it is static.
        //but the valueColor is animated property of the progressIndicator.
        valueColor: AlwaysStoppedAnimation<Color>(Color(0xff67802F)),
      ),
      child: Scaffold(
        backgroundColor: const Color(0xffEFEFEF),
        appBar: AppBar(
          backgroundColor: const Color(0xffEFEFEF),
          title: const Text(
            'Skip',
            style: TextStyle(
              color: Color(0xff67802F),
              fontSize: 18,
            ),
          ),
        ),
        body: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.only(
                  left: 20, right: 20, top: 50, bottom: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Container(
                    width: 80,
                    height: 80,
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: const Color(0xff67802F),
                        width: 2,
                      ),
                      shape: BoxShape.circle,
                      gradient: const LinearGradient(
                        colors: [
                          Color(0xffD7E9D0),
                          Color(0xffEFEFEF),
                        ],
                        begin: Alignment.centerLeft,
                        end: Alignment.centerRight,
                      ),
                      boxShadow: const [
                        BoxShadow(
                          color: Color(0xffD7E9D0),
                          spreadRadius: 3,
                          blurRadius: 30,
                        ),
                      ],
                    ),
                    child: const Image(
                      image: AssetImage(
                        'images/logInPic.jpg',
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const Text(
                    'Login',
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const Text(
                    'Please sign in to continue.',
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Container(
                    height: 50,
                    child: TextField(
                      onChanged: (newNumber) {
                        number = newNumber;
                      },
                      cursorColor: const Color(0xff67802F),
                      keyboardType: TextInputType.phone,
                      controller: numberController,
                      decoration: InputDecoration(
                        hintText: 'Enter your Phone number',
                        hintStyle: const TextStyle(color: Colors.grey),
                        fillColor: Colors.white,
                        filled: true,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: const BorderSide(
                              color: Color(0xff67802F), width: 2),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: const BorderSide(
                            color: Color(0xff67802F),
                            width: 2,
                          ),
                        ),
                        contentPadding: const EdgeInsets.only(
                          left: 5,
                        ),
                        prefixIcon: const Icon(
                          Icons.mail,
                          size: 20,
                          color: Color(0xff67802F),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Container(
                    height: 50,
                    child: TextField(
                      onChanged: (newEmail) {
                        email = newEmail;
                      },
                      cursorColor: const Color(0xff67802F),
                      keyboardType: TextInputType.emailAddress,
                      controller: emailController,
                      decoration: InputDecoration(
                        hintText: 'Enter your Email',
                        hintStyle: const TextStyle(color: Colors.grey),
                        fillColor: Colors.white,
                        filled: true,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: const BorderSide(
                              color: Color(0xff67802F), width: 2),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: const BorderSide(
                            color: Color(0xff67802F),
                            width: 2,
                          ),
                        ),
                        contentPadding: const EdgeInsets.only(
                          left: 5,
                        ),
                        prefixIcon: const Icon(
                          Icons.mail,
                          size: 20,
                          color: Color(0xff67802F),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextField(
                    onChanged: (newPass) {
                      password = newPass;
                    },
                    controller: passwordController,
                    cursorColor: const Color(0xff67802F),
                    obscureText: isShowPassword,
                    decoration: InputDecoration(
                      hintText: 'Enter your password',
                      hintStyle: const TextStyle(color: Colors.grey),
                      fillColor: Colors.white,
                      filled: true,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: const BorderSide(
                            color: Color(0xff67802F), width: 2),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: const BorderSide(
                          color: Color(0xff67802F),
                          width: 2,
                        ),
                      ),
                      contentPadding: const EdgeInsets.only(
                        left: 5,
                      ),
                      prefixIcon: const Icon(
                        Icons.lock,
                        size: 20,
                        color: Color(0xff67802F),
                      ),
                      suffixIcon: InkWell(
                        onTap: () {
                          setState(() {
                            isShowPassword = !isShowPassword;
                          });
                        },
                        child: isShowPassword
                            ? const Icon(
                                Icons.visibility_off,
                                color: Color(
                                  0xff67802F,
                                ),
                                size: 20,
                              )
                            : const Icon(
                                Icons.visibility,
                                color: Color(0xff67802F),
                                size: 20,
                              ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Align(
                    alignment: Alignment.centerRight,
                    child: MaterialButton(
                      height: 45,
                      onPressed: () async {
                        numberController?.clear();
                        emailController?.clear();
                        passwordController?.clear();
                        setState(() {
                          isSpinner = true;
                        });

                        try {
                          try {
                            final newUser =
                                await _auth.signInWithEmailAndPassword(
                              email: email ?? '',
                              password: password ?? '',
                            );
                            if (newUser != null) {
                              Navigator.pushNamed(context, ProductPage.id);
                            }
                          } on FirebaseAuthException catch (e) {
                            // Handle specific errors
                            if (e.code == 'user-not-found') {
                              if (kDebugMode) {
                                print('No user found for that email.');
                              }
                            } else if (e.code == 'wrong-password') {
                              if (kDebugMode) {
                                print('Wrong password provided.');
                              }
                            } else {
                              if (kDebugMode) {
                                print('Login failed: ${e.message}');
                              }
                            }
                          }

                          await FirebaseAuth.instance.verifyPhoneNumber(
                            phoneNumber: number,
                            verificationCompleted:
                                (PhoneAuthCredential credential) {},
                            verificationFailed: (FirebaseAuthException e) {
                              print('Verification failed: ${e.message}');
                            },
                            codeSent:
                                (String verificationID, int? resendToken) {
                              LoginPage.verify = verificationID;
                              Navigator.pushNamed(context, OTPScreen.id);
                            },
                            codeAutoRetrievalTimeout:
                                (String verificationID) {},
                          );
                        } catch (e) {
                          if (kDebugMode) {
                            print('An error occurred: $e');
                          }
                        } finally {
                          setState(() {
                            isSpinner = false;
                          });
                        }
                      },
                      color: const Color(0xff67802F),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25),
                      ),
                      child: const Row(
                        mainAxisSize: MainAxisSize.min,
                        //the above line means that take that much space as much required
                        children: [
                          Text(
                            'LOGIN',
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w600),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Icon(
                            Icons.arrow_forward,
                            size: 20,
                            color: Colors.white,
                            weight: 2.0,
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 170,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        'Don\'t have an account?',
                        style: TextStyle(fontWeight: FontWeight.w500),
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.push(
                            (context),
                            MaterialPageRoute(
                              builder: (BuildContext context) =>
                                  RegistrationPage(),
                            ),
                          );
                        },
                        child: const Text(
                          ' Sign up',
                          style: TextStyle(
                            color: Color(0xff67802F),
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
