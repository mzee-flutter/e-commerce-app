import 'package:e_commerce/product_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';
import 'package:e_commerce/login_page.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class OTPScreen extends StatefulWidget {
  static const String id = 'OTP_screen';
  State<OTPScreen> createState() => OTPScreenState();
}

class OTPScreenState extends State<OTPScreen> {
  final auth = FirebaseAuth.instance;
  var OTPcode;
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
      child: Scaffold(
        backgroundColor: Color(0xffEFEFEF),
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: Color(0xffEFEFEF),
          title: InkWell(
            onTap: () {
              Navigator.pushNamed(context, LoginPage.id);
            },
            child: Icon(
              Icons.arrow_back,
            ),
          ),
          actions: [
            Container(
              margin: EdgeInsets.only(
                right: 20,
              ),
              height: 20,
              width: 20,
              decoration: BoxDecoration(
                color: Colors.black,
                shape: BoxShape.circle,
              ),
              child: Icon(
                Icons.question_mark,
                color: Colors.white,
                size: 15,
              ),
            ),
          ],
        ),
        body: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 60,
          ),
          child: Center(
            child: Column(
              children: [
                Text(
                  'Verify your',
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  'Phone number',
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text('Enter your OTP Code here'),
                SizedBox(
                  height: 30,
                ),
                Pinput(
                  length: 6,
                  onChanged: (value) {
                    OTPcode = value;
                  },
                  defaultPinTheme: PinTheme(
                    height: 45,
                    width: 45,
                    textStyle: TextStyle(
                      color: Colors.white,
                      fontSize: 17,
                      fontWeight: FontWeight.w500,
                    ),
                    decoration: BoxDecoration(
                      color: Color(0xff67802F),
                      shape: BoxShape.circle,
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(),
                  child: MaterialButton(
                    height: 45,
                    onPressed: () async {
                      setState(() {
                        isSpinner = true;
                      });
                      try {
                        PhoneAuthCredential credential =
                            PhoneAuthProvider.credential(
                          verificationId: LoginPage.verify,
                          smsCode: OTPcode,
                        );
                        await auth.signInWithCredential(credential);
                        Navigator.pushNamed(context, ProductPage.id);
                      } catch (e) {
                        print('wrong otp entered');
                        throw e;
                      }
                      setState(() {
                        isSpinner = false;
                      });
                    },
                    color: const Color(0xff67802F),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: const Text(
                      'Verify and Login',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 17,
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Don\'t receive OTP?'),
                    SizedBox(
                      width: 5,
                    ),
                    Text(
                      'Resend ',
                      style: TextStyle(
                        color: Color(0xff67802F),
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
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
