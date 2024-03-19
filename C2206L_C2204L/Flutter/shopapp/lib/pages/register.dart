import 'package:flutter/material.dart';
import 'package:foodapp/dtos/requests/user/register_request.dart';
import 'package:foodapp/dtos/responses/api_response.dart';
import 'package:foodapp/services/auth_service.dart';
import 'package:foodapp/services/token_service.dart';
import 'package:foodapp/services/user_service.dart';
import 'package:foodapp/utils/app_colors.dart';
import 'package:foodapp/widgets/uibutton.dart';
import 'package:get_it/get_it.dart';
import 'dart:convert' as convert;
import 'package:http/http.dart' as http;
import 'package:go_router/go_router.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final phoneNumberController = TextEditingController();
  final passwordController = TextEditingController();
  final retypedPasswordController = TextEditingController();
  bool rememberPassword = false;

  late UserService userService;
  late TokenService tokenService;
  late AuthService authService;

  @override
  void initState() {
    //33445566, pass: 123456789
    super.initState();
    //inject service
    userService = GetIt.instance<UserService>();
    tokenService = GetIt.instance<TokenService>();
    authService = GetIt.instance<AuthService>();
    // Retrieve credentials
    authService.getCredentials().then((credentials) { //promise
      phoneNumberController.text = credentials['phoneNumber'] ?? '';
      passwordController.text = credentials['password'] ?? '';
    });
  }
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
        body: Container(
          child: Stack(
            children: [
              Image(
                image: AssetImage('assets/background.png'),
                fit: BoxFit.cover,
                width: screenWidth,
                height: screenHeight,
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 30),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(child: Container(),),
                    Text('Register',
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.white, fontSize: 50),
                    ),
                    Expanded(child: Container(),),
                    Container(
                      height: 54,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.7),
                        borderRadius: BorderRadius.circular(22), // Border radius
                        border: Border.all(
                          color: AppColors.primaryColor, // Border color
                          width: 1, // Border width
                        ),
                      ),
                      child: TextField(
                        controller: phoneNumberController, // Pass your TextEditingController here
                        decoration: InputDecoration(
                          hintText: 'Enter phone number', // Placeholder text
                          border: InputBorder.none, // Remove default TextField border
                          contentPadding: EdgeInsets.symmetric(horizontal: 15), // Padding
                        ),
                        keyboardType: TextInputType.phone, // Set keyboard type to phone
                        style: TextStyle(color: Colors.black), // Text color
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      height: 54,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.7),
                        borderRadius: BorderRadius.circular(22), // Border radius
                        border: Border.all(
                          color: AppColors.primaryColor, // Border color
                          width: 1, // Border width
                        ),
                      ),
                      child: TextField(
                        controller: passwordController, // Pass your TextEditingController here
                        obscureText: true,
                        decoration: InputDecoration(
                          hintText: 'Enter your password', // Placeholder text
                          border: InputBorder.none, // Remove default TextField border
                          contentPadding: EdgeInsets.symmetric(horizontal: 15), // Padding
                        ),
                        keyboardType: TextInputType.phone, // Set keyboard type to phone
                        style: TextStyle(color: Colors.black), // Text color
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      height: 54,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.7),
                        borderRadius: BorderRadius.circular(22), // Border radius
                        border: Border.all(
                          color: AppColors.primaryColor, // Border color
                          width: 1, // Border width
                        ),
                      ),
                      child: TextField(
                        controller: retypedPasswordController, // Pass your TextEditingController here
                        obscureText: true,
                        decoration: InputDecoration(
                          hintText: 'Retype your password', // Placeholder text
                          border: InputBorder.none, // Remove default TextField border
                          contentPadding: EdgeInsets.symmetric(horizontal: 15), // Padding
                        ),
                        keyboardType: TextInputType.phone, // Set keyboard type to phone
                        style: TextStyle(color: Colors.black), // Text color
                      ),
                    ),
                    Container(
                      width: double.infinity,
                      child: CustomButton(
                        text: 'Register',
                        textColor: Colors.white,
                        borderColor: Colors.white,
                        backgroundColor: AppColors.primaryColor,
                        onTap: () async {
                          print('Register');
                          ApiResponse response = await userService.register(
                              RegisterRequest(
                                  phoneNumber: phoneNumberController.text,
                                  password: passwordController.text,
                                  retypePassword: retypedPasswordController.text,
                                  dateOfBirth: '2000-01-01'
                              )
                          );
                          Map<String, dynamic> data = response.data;
                          String token = data['token'];
                          String refreshToken = data['refresh_token'];
                          //save to local
                          await tokenService.saveTokens(token: token, refreshToken: refreshToken);
                          if(rememberPassword == true) {
                            await authService.saveCredentials(
                                phoneNumber: phoneNumberController.text,
                                password: passwordController.text);
                          }
                        },
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        print('Register');
                        context.go('/register');
                      },
                      child: Container(
                        padding: EdgeInsets.symmetric(vertical: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Do not have an account ?',
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
                    ),
                    Expanded(child: Container(),),
                    Expanded(child: Container(),),
                  ],
                ),
              )
            ],
          ),
        )
    );
  }
}
