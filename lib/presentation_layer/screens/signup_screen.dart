// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:mini_flower_application/presentation_layer/screens/login_screen.dart';
import '../reusableComponents/button.dart';
import '../reusableComponents/clipped_container.dart';
import '../reusableComponents/text_field.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);
  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}
class _SignUpScreenState extends State<SignUpScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double headerHeight = size.height * 0.3;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: headerHeight,
              child: HeaderWidget(
                  headerHeight),
            ),
             SizedBox(
              height: size.height*0.015,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text(
                    "Hello",
                    style: TextStyle(
                        fontSize: 90.0,
                        fontWeight: FontWeight.w400,
                        color: Color(0xffbab7ba)),
                  ),
                  Text(
                    " Sign Up",
                    style: TextStyle(fontSize: 20.0, color: Color(0xffbab7ba)),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  CustomTextFieldWidget(
                      controller: emailController,
                      type: TextInputType.emailAddress,
                      label: "Email",

                      ),
                   SizedBox(
                    height: size.height*0.025,
                  ),
                  CustomTextFieldWidget(
                      controller: passwordController,
                      label: "Password",

                      ),
                   SizedBox(
                    height: size.height*0.025,
                  ),
                  CustomTextFieldWidget(
                      controller: confirmPasswordController,
                      label: "Confirm Password",
                      ),
                   SizedBox(
                    height: size.height*0.025,
                  ),
                  CustomTextFieldWidget(
                      controller: phoneController,
                      type: TextInputType.phone,
                      label: "Phone",
                      ),
                   SizedBox(
                    height: size.height*0.035,
                  ),
                  CustomButton(
                      inputText: "Sign Up",
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>  LoginScreen()));
                      }),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
