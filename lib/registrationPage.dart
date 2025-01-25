import 'package:e_commerce/product_page.dart';
import 'package:flutter/material.dart';
import 'package:e_commerce/login_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class RegistrationPage extends StatefulWidget {
  static const String id = 'registration_page';

  RegistrationPageState createState() => RegistrationPageState();
}

class RegistrationPageState extends State<RegistrationPage> {
  TextEditingController? fullNameController = TextEditingController();
  TextEditingController? emailController = TextEditingController();
  TextEditingController? passwordController = TextEditingController();
  TextEditingController? confirmPassController = TextEditingController();
  final _auth = FirebaseAuth.instance;
  String? fullName;
  String? email;
  String? password;
  String? confirmPass;

  bool isShowPassword = true;
  bool isShowConfirmPass = true;
  bool isSpinner = false;
  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      inAsyncCall: isSpinner,
      progressIndicator: CircularProgressIndicator(
        valueColor: AlwaysStoppedAnimation<Color>(
          Color(0xff67802F),
        ),
      ),
      opacity: 0.5,
      child: Scaffold(
        backgroundColor: Color(0xffEFEFEF),
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: Color(0xffEFEFEF),
          title: InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: Icon(
              Icons.arrow_back,
            ),
          ),
        ),
        body: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 20,
                vertical: 10,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    width: 80,
                    height: 80,
                    decoration: BoxDecoration(
                      border: Border.all(
                        width: 2,
                        color: Color(0xff67802F),
                      ),
                      shape: BoxShape.circle,
                      gradient: LinearGradient(
                        colors: [
                          Color(0xffD7E9D0),
                          Color(0xffEFEFEF),
                        ],
                        begin: Alignment.centerLeft,
                        end: Alignment.centerRight,
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Color(0xffD7E9D0),
                          spreadRadius: 3,
                          blurRadius: 30,
                        ),
                      ],
                    ),
                    child: Image(
                      image: AssetImage(
                        'images/logInPic.jpg',
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    'Create Account',
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    height: 50,
                    child: TextField(
                      onChanged: (name) {
                        fullName = name;
                      },
                      controller: fullNameController,
                      cursorColor: Color(0xff67802F),
                      decoration: InputDecoration(
                        hintText: 'Enter Full Name',
                        hintStyle: TextStyle(
                          color: Colors.grey,
                          fontSize: 15,
                        ),
                        filled: true,
                        fillColor: Colors.white,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(
                            color: Color(0xff67802F),
                            width: 2,
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(
                            color: Color(0xff67802F),
                            width: 2,
                          ),
                        ),
                        prefixIcon: Icon(
                          Icons.person,
                          color: Color(0xff67802F),
                        ),
                        contentPadding: EdgeInsets.only(top: 5),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Container(
                    height: 50,
                    child: TextField(
                      onChanged: (newEmail) {
                        email = newEmail;
                      },
                      cursorColor: Color(0xff67802F),
                      controller: emailController,
                      decoration: InputDecoration(
                        hintText: 'Enter your email',
                        hintStyle: TextStyle(color: Colors.grey),
                        fillColor: Colors.white,
                        filled: true,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide:
                              BorderSide(color: Color(0xff67802F), width: 2),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(
                            color: Color(0xff67802F),
                            width: 2,
                          ),
                        ),
                        contentPadding: EdgeInsets.only(
                          left: 5,
                        ),
                        prefixIcon: Icon(
                          Icons.mail,
                          size: 20,
                          color: Color(0xff67802F),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  TextField(
                    onChanged: (newPass) {
                      password = newPass;
                    },
                    controller: passwordController,
                    cursorColor: Color(0xff67802F),
                    obscureText: isShowPassword,
                    decoration: InputDecoration(
                      hintText: 'Enter your password',
                      hintStyle: TextStyle(color: Colors.grey),
                      fillColor: Colors.white,
                      filled: true,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(
                          color: Color(0xff67802F),
                          width: 2,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(
                          color: Color(0xff67802F),
                          width: 2,
                        ),
                      ),
                      contentPadding: EdgeInsets.only(
                        left: 5,
                      ),
                      prefixIcon: Icon(
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
                    height: 15,
                  ),
                  Container(
                    height: 50,
                    child: TextField(
                      onChanged: (newConfPass) {
                        confirmPass = newConfPass;
                      },
                      controller: confirmPassController,
                      obscureText: isShowConfirmPass,
                      cursorColor: const Color(0xff67802F),
                      decoration: InputDecoration(
                        hintText: 'Confirm Password',
                        hintStyle: const TextStyle(
                          color: Colors.grey,
                        ),
                        filled: true,
                        fillColor: Colors.white,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: const BorderSide(
                            color: Color(0xff67802F),
                            width: 2,
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: const BorderSide(
                            color: Color(0xff67802F),
                            width: 2,
                          ),
                        ),
                        prefixIcon: const Icon(
                          Icons.lock,
                          size: 20,
                          color: Color(0xff67802F),
                        ),
                        suffixIcon: InkWell(
                            onTap: () {
                              setState(() {
                                isShowConfirmPass = !isShowConfirmPass;
                              });
                            },
                            child: isShowConfirmPass
                                ? const Icon(
                                    Icons.visibility_off,
                                    size: 20,
                                    color: Color(0xff67802F),
                                  )
                                : const Icon(
                                    Icons.visibility,
                                    size: 20,
                                    color: Color(0xff67802F),
                                  )),
                        contentPadding: const EdgeInsets.only(top: 5),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  Align(
                    alignment: Alignment.centerRight,
                    child: MaterialButton(
                      height: 45,
                      onPressed: () async {
                        fullNameController?.clear();
                        emailController?.clear();
                        passwordController?.clear();
                        confirmPassController?.clear();
                        setState(() {
                          isSpinner = true;
                        });
                        try {
                          final newUser =
                              await _auth.createUserWithEmailAndPassword(
                            email: email ?? '',
                            password: password ?? '',
                          );
                          if (password == confirmPass) {
                            Navigator.pushNamed(
                              context,
                              ProductPage.id,
                              arguments: fullName,
                            );
                          } else {
                            throw Exception(
                                'Password and ConfirmPassword is not equal');
                          }
                        } catch (e) {
                          print(e);
                        }
                        setState(() {
                          isSpinner = false;
                        });
                      },
                      color: Color(0xff67802F),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25),
                      ),
                      child: const Row(
                        mainAxisSize: MainAxisSize.min,
                        //the above line means that take that much space as much required
                        children: [
                          Text(
                            'SIGN UP',
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
                  SizedBox(
                    height: 175,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Aleady have an account?',
                        style: TextStyle(fontWeight: FontWeight.w500),
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.pushNamed(context, LoginPage.id);
                        },
                        child: Text(
                          ' Sign in',
                          style: TextStyle(
                            color: Color(0xff67802F),
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
