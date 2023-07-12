import 'package:flutter/material.dart';
// ignore: must_be_immutable
class FlowerPrice extends StatelessWidget {
   FlowerPrice( {Key? key,required this.price}) : super(key: key);
  double? price;
  @override
  Widget build(BuildContext context) {
    Size size=MediaQuery.of(context).size;
    return Row(
      children: [
         Text(
          "\$",
          style: TextStyle(
            color: const Color(0xFF880E4F),
            fontSize: size.height*0.025,
          ),
        ),
        Text(
         "$price",
          style:  TextStyle(
              fontWeight: FontWeight.w600,
            fontSize: size.height*0.024,),
        ),
         Text("/D",
            style: TextStyle(
              color: Colors.grey.shade400,
              fontSize: size.height*0.026,)),
      ],
    );
  }
}
