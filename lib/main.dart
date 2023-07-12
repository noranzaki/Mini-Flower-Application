import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mini_flower_application/business_logic/cart/cart_bloc.dart';
import 'package:mini_flower_application/presentation_layer/screens/signup_screen.dart';


void main() {

  runApp(const MyApp());

}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(

      create: (BuildContext context) =>CartCubit(),
      child: MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(

           primaryColor: const Color(0xfff03458).withOpacity(0.9),
           colorScheme: ColorScheme.fromSwatch(accentColor:const Color(0xffe52932)),

          elevatedButtonTheme: ElevatedButtonThemeData(
            style: ButtonStyle(
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30.0),
                ),
              ),
            )
          ),
          //focusColor: Colors.pink,

        ),
        home: const SignUpScreen(),
      ),
    );
  }
}

