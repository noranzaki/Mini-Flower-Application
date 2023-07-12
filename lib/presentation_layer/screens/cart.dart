import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mini_flower_application/business_logic/cart/cart_bloc.dart';
import 'package:mini_flower_application/business_logic/cart/cart_states.dart';
import '../reusableComponents/button.dart';
import '../widgets/flower_price.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return BlocBuilder<CartCubit, CartStates>(builder: (context, states) {
      return Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.pink,
            leading: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const Icon(Icons.arrow_back)),
            title: const Text('Cart'),
          ),
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 10.0),
              child: Column(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                      height: size.height*0.762,
                     child: ListView.separated(
                          physics: const AlwaysScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: CartCubit.cartItems.length,
                          itemBuilder: (
                            context,
                            index,
                          ) {
                            return ListTile(
                              leading: Image.asset("${CartCubit.cartItems[index].image}",fit: BoxFit.contain,width: size.width*0.15,),
                                title:  Text("${CartCubit.cartItems[index].title}",style: TextStyle(fontSize: size.width*0.042),),
                              trailing:  SizedBox(
                                width: size.width*0.43,
                                  child: FlowerPrice(price: CartCubit.cartItems[index].price)),
                            );
                          }, separatorBuilder: (BuildContext context, int index) => const Divider(thickness: 0.5,) ),
                  ),
                 CustomButton( inputText: "Total Price", onPressed: () {  },)
                ],
              ),
            ),
          ));
    });
  }
}
