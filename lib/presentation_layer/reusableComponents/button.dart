import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CustomButton extends StatelessWidget {
  CustomButton({Key? key, required this.onPressed, required this.inputText})
      : super(key: key);
  String? inputText = '';
  Function() onPressed;

  @override
  Widget build(BuildContext context) {
    Size size= MediaQuery.of(context).size;
    return Container(
      width: size.width*0.5,
      height: size.height*0.07,
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: <Color>[Color(0xfff2a7ad), Color(0xffe72b37)],
          begin: FractionalOffset.centerLeft,
          end: FractionalOffset.centerRight,
        ),
        borderRadius: BorderRadius.circular(30.0),
      ),
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30.0),
          ),
          backgroundColor: const Color(0xfff75871).withOpacity(0.4),
        ),
        child: Text(
          inputText!,
          style: const TextStyle(color: Colors.white, fontSize: 20.0),
        ),
      ),
    );
  }
}
