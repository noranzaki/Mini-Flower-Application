import 'package:flutter/material.dart';
// ignore: must_be_immutable
class CustomTextFieldWidget extends StatelessWidget {
  CustomTextFieldWidget({
    Key? key,
    required this.controller,
    this.type = TextInputType.text,
    this.hintText,
    this.label,
    this.prefix,
    this.floatingLabelStyle,
    this.labelStyle,
    this.suffix,
    this.suffixPressed,
    this.visibleText = true,
    this.isPassword = false,
  }) : super(key: key);
  TextEditingController controller;
  TextInputType type;
  String? hintText;
  String? label;
  IconData? prefix;
  IconData? suffix;
  TextStyle? floatingLabelStyle;
  TextStyle? labelStyle;
  FormFieldValidator? validator;
  bool isPassword;
  Function()? suffixPressed;
  FontWeight? weightOfFont;
  double? hintFontSize;
  String? prefixText;
  bool visibleText;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      height: size.height * 0.076,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(27.0),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              offset: const Offset(0, 4),
              color: Colors.grey.withOpacity(0.3),
              blurRadius: 15,
            )
          ]),
      child: TextFormField(

        cursorColor: Colors.pinkAccent,
        validator: validator,
        obscureText: (hintText == "Password" ||
                label == "Password" ||
                label == "Confirm Password")
            ? visibleText
            : !visibleText,
        controller: controller,
        keyboardType: type,
        decoration: InputDecoration(
          contentPadding: EdgeInsets.symmetric(vertical:size.height*0.035),
          floatingLabelStyle:
              MaterialStateTextStyle.resolveWith((Set<MaterialState> states) {
            final Color color = states.contains(MaterialState.focused)
                ? Colors.pinkAccent
                : Colors.grey.shade600;
            return TextStyle(
              color: color,
              fontSize: 22,
              height: 3
            );

          }),

          hintText: hintText,
          suffixIcon: isPassword
              ? IconButton(
                  onPressed: suffixPressed,
                  icon: Icon(
                    visibleText ? Icons.visibility : Icons.visibility_off,
                    color: Colors.grey,
                  ))
              : Icon(suffix),
          hintStyle: TextStyle(
            fontSize: 20,
            color: Colors.grey.shade600,
            fontWeight: weightOfFont,
          ),
          labelText: label,
          labelStyle: TextStyle(
            fontSize: 20,
            color: Colors.grey.shade600,
            fontWeight: weightOfFont,
          ),
          prefixIcon: Icon(prefix),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30.0),
            borderSide: BorderSide.none,
          ),
        ),
      ),
    );
  }
}
