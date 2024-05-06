import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:foodapp/dtos/requests/user/login_request.dart';
import 'package:foodapp/enums/popup_type.dart';
import 'package:foodapp/pages/app_routes.dart';
import 'package:foodapp/services/user_service.dart';
import 'package:foodapp/utils/app_colors.dart';
import 'package:foodapp/utils/utility.dart';
import 'package:foodapp/utils/validations.dart';
import 'package:foodapp/widgets/uibutton.dart';
import 'package:get_it/get_it.dart';
import 'dart:convert' as convert;
import 'package:http/http.dart' as http;
import 'package:go_router/go_router.dart';
import 'package:google_sign_in/google_sign_in.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

List<String> scopes = <String>[
  'email',
  'https://www.googleapis.com/auth/contacts.readonly',
];

class _LoginState extends State<Login> {
  final emailOrPhoneNumberController = TextEditingController();
  final passwordController = TextEditingController();
  bool rememberPassword = false;
  late UserService userService;

  @override
  void initState() {
    //33445566, pass: 123456789
    super.initState();
    //inject service
    userService = GetIt.instance<UserService>();
    // Retrieve credentials
    userService.getCredentials().then((credentials) {
      //promise
      emailOrPhoneNumberController.text = credentials['phoneNumber'] ?? '';
      passwordController.text = credentials['password'] ?? '';
    });
    //fake
    // Set default values if controllers are still empty
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    print('screenWidth = ${screenWidth}, screenHeight = ${screenHeight}');
    return Scaffold(
      body: SingleChildScrollView(  // Wrapping with SingleChildScrollView
        child: Stack(
          children: [
            Image(
              image: AssetImage('assets/background.png'),
              fit: BoxFit.cover,
              width: screenWidth,
              height: screenHeight,
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 30),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(height: screenHeight * 0.2), // Adjusted space
                  const Text(
                    'Login',
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.white, fontSize: 50),
                  ),
                  SizedBox(height: 20),
                  loginTextField('Enter phone number or email', emailOrPhoneNumberController, false),
                  SizedBox(height: 20),
                  loginTextField('Enter your password', passwordController, true),
                  rememberPasswordRow(),
                  loginButton('Login'),
                  registerRow(),
                  socialLoginButtons(),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget loginTextField(String hint, TextEditingController controller, bool isObscure) {
    return Container(
      height: 54,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.7),
        borderRadius: BorderRadius.circular(22),
        border: Border.all(color: AppColors.primaryColor, width: 1),
      ),
      child: TextField(
        controller: controller,
        obscureText: isObscure,
        decoration: InputDecoration(
          hintText: hint,
          border: InputBorder.none,
          contentPadding: EdgeInsets.symmetric(horizontal: 15),
        ),
        keyboardType: isObscure ? TextInputType.text : TextInputType.emailAddress,
        style: TextStyle(color: Colors.black),
      ),
    );
  }
  Widget registerRow() {
    return GestureDetector(
      onTap: () {
        print('Register');
        context.go('/${AppRoutes.register}');
      },
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Do not have an account?',
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              ' Register',
              style: TextStyle(
                color: AppColors.primaryColor,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
  Widget rememberPasswordRow() {
    return InkWell(
      onTap: () {
        setState(() {
          rememberPassword = !rememberPassword;
        });
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Container(
            padding: EdgeInsets.only(left: 10, top: 10, right: 5, bottom: 10),
            child: Icon(
              rememberPassword ? Icons.check_box : Icons.check_box_outline_blank,
              color: Colors.white,
            ),
          ),
          SizedBox(width: 5),
          Text(
            'Remember password',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
  Widget socialLoginButtons() {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          socialButton("Google", Icons.account_circle, Colors.red, () {
            print('Google');
          }),
          SizedBox(width: 10),
          socialButton("Facebook", Icons.facebook, Colors.blueAccent, () {
            print('Facebook');
          }),
        ],
      ),
    );
  }

  Widget socialButton(String text, IconData icon, Color color, VoidCallback onTap) {
    return Expanded(
      child: InkWell(
        onTap: onTap,
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 12),
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(5),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 1,
                blurRadius: 2,
                offset: Offset(0, 1),
              ),
            ],
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(icon, color: Colors.white),
              SizedBox(width: 6),
              Text(text, style: TextStyle(color: Colors.white)),
            ],
          ),
        ),
      ),
    );
  }
  Widget loginButton(String text) {
    return SizedBox(
      width: double.infinity,
      child: CustomButton(
        text: 'Login',
        textColor: Colors.white,
        borderColor: Colors.white,
        backgroundColor: AppColors.primaryColor,
        onTap: () async {
          print('Login');
          String input = emailOrPhoneNumberController.text;
          String password = passwordController.text;

          if (Validations.isValidEmail(input)) {
            await userService.login(
                LoginRequest(email: input, password: password));
          } else if (Validations.isValidPhoneNumber(input)) {
            await userService.login(
                LoginRequest(phoneNumber: input, password: password));
          } else {
            Utility.alert(
              context: context,
              message: 'Invalid phone number or email',
              popupType: PopupType.failure,
              onOkPressed: () {
                print('OK button pressed');
                // Perform any other actions here
              },
            );
          }
          if (rememberPassword == true) {
            await userService.saveCredentials(
                phoneNumber: emailOrPhoneNumberController.text,
                password: passwordController.text);
          }
          context.go('/${AppRoutes.appTab}');
          ;
        },
      ),
    );
  }

}
