import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mini_flower_application/business_logic/login/login_cubit.dart';
import 'package:mini_flower_application/presentation_layer/screens/signup_screen.dart';
import '../../business_logic/login/login_states.dart';
import '../reusableComponents/button.dart';
import '../reusableComponents/clipped_container.dart';
import '../reusableComponents/text_field.dart';
import 'flowers_screen.dart';

class LoginScreen extends StatelessWidget {
   LoginScreen({Key? key}) : super(key: key);

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double headerHeight = size.height * 0.3;
    return BlocProvider(
      create: (BuildContext context) => LoginCubit(),
      child: BlocBuilder<LoginCubit,LoginState>(
       builder: (context,state){
         LoginCubit loginCubit = LoginCubit.get(context);
       return Scaffold(
          body: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: headerHeight,
                  child: HeaderWidget(headerHeight),
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 18.0),
                  child: Text(
                    "Hello",
                    style: TextStyle(
                      fontSize: 85.0,
                      fontWeight: FontWeight.w500,
                      color: Color(0xffbab7ba),
                    ),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 18.0),
                  child: Text(
                    " Sign in to your account",
                    style: TextStyle(fontSize: 22.0, color: Color(0xffbab7ba)),
                  ),
                ),
                SizedBox(
                  height: size.height * 0.03,
                ),
                Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 35.0),
                    child: CustomTextFieldWidget(
                      type: TextInputType.text,
                      controller: emailController,
                      hintText: 'Email',

                    )),
                SizedBox(
                  height: size.height * 0.03,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 35.0),
                  child: CustomTextFieldWidget(
                    type: TextInputType.text,
                    controller: passwordController,
                    hintText: "Password",
                    isPassword: true,
                    visibleText: loginCubit.visiblePassword,
                    suffixPressed: () {
                      loginCubit.changePasswordVisibility();
                    },


                  ),
                ),
                SizedBox(
                  height: size.height * 0.03,
                ),
                Center(
                  child: CustomButton(
                      inputText: 'Sign in',
                      onPressed: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const FlowersPage()))),
                ),
                const SizedBox(
                  height: 20.0,
                ),
                SizedBox(
                  height: size.height * 0.0000001,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    const Text(
                      "Don't have an account? ",
                      style: TextStyle(
                          color: Colors.grey,
                          fontWeight: FontWeight.bold,
                          fontSize: 15.0),
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const SignUpScreen()));
                      },
                      child: Text(
                        "Create ",
                        style: TextStyle(
                            color: Colors.redAccent.shade700,
                            fontWeight: FontWeight.bold,
                            fontSize: 15.0),
                      ),
                    )
                  ],
                ),
              ],
            ),
          )
       );}
      ),
    );
  }
}
