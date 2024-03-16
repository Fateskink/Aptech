import 'package:flutter/material.dart';
import 'package:foodapp/dtos/responses/api_response.dart';
import 'package:foodapp/services/token_service.dart';
import 'package:foodapp/services/user_service.dart';
import 'package:foodapp/utils/app_colors.dart';
import 'package:foodapp/widgets/uibutton.dart';
import 'package:get_it/get_it.dart';


class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final phoneNumberController = TextEditingController();
  final passwordController = TextEditingController();
  bool rememberPassword = true;
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    //inject service
    final userService = GetIt.instance<UserService>();
    final tokenService = GetIt.instance<TokenService>();
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
                  Text('Login',
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
                  InkWell(
                    onTap: () {
                      setState(() {
                        rememberPassword = !rememberPassword;
                      });
                    },
                    child: Row(
                      mainAxisAlignment:MainAxisAlignment.end,
                      children: [
                        Container(
                          padding: EdgeInsets.only(left: 10, top: 10, right: 5, bottom: 10),
                          child: Icon(
                            rememberPassword == true ? Icons.check_box : Icons.check_box_outline_blank, // Use the appropriate icon
                            color: Colors.white, // Set the cocheck_box_outline_blanklor of the icon
                          ),
                        ),
                        SizedBox(width: 5), // Add some spacing between the icon and text
                        Text(
                          'Remember password',
                          style: TextStyle(
                            fontSize: 16, // Set the font size
                            fontWeight: FontWeight.bold,
                            color: Colors.white, // Set the text color
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    width: double.infinity,
                    child: CustomButton(
                      text: 'Login',
                      textColor: Colors.white,
                      borderColor: Colors.white,
                      backgroundColor: AppColors.primaryColor,
                      onTap: () async {
                        print('Login');
                        String phoneNumber = phoneNumberController.text;
                        String password = passwordController.text;
                        ApiResponse response = await userService.login(username: phoneNumber, password: password);
                        Map<String, dynamic> data = response.data;
                        String token = data['token'];
                        String refreshToken = data['refresh_token'];
                        //save to local
                        tokenService.saveTokens(token: token, refreshToken: refreshToken);
                      },
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      print('Register');
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
