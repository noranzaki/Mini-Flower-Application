import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mini_flower_application/business_logic/cart/cart_bloc.dart';
import 'package:mini_flower_application/presentation_layer/screens/cart.dart';

import '../../business_logic/cart/cart_states.dart';
import '../../data_layer/flowers.dart';
import '../widgets/flower_price.dart';
// ignore: must_be_immutable
class FlowerDetails extends StatelessWidget {
  int index;
  FlowerDetails({Key? key, required this.index}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return BlocProvider(
      create: (BuildContext context) => CartCubit()..getCartItems(),
      child: BlocBuilder<CartCubit, CartStates>(
          builder: (BuildContext context, state) {
        CartCubit cartCubit = CartCubit.get(context);
        return Scaffold(
            backgroundColor: Colors.white,
            appBar: AppBar(
              backgroundColor: Colors.white,
              elevation: 0.0,
              leading: IconButton(
                icon: Icon(Icons.arrow_back_ios,
                    color: Colors.redAccent, size: size.height * 0.04),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
              actions: [
                IconButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const CartScreen()));
                    },
                    icon: const Icon(Icons.shopping_cart,color: Colors.pink,))
              ],
            ),
            body: Column(children: [
              Container(
            color: Colors.grey.shade50,
            child: Padding(
              padding: EdgeInsets.only(
                  top: size.height * 0.06, bottom: size.height * 0.02),
              child: Image.asset(
                "${flower[index].image}",
                width: size.width,
                height: size.height * 0.35,
              ),
            ),
              ),
              SizedBox(height: size.height * 0.05),
              Center(
            child: Container(
              decoration: BoxDecoration(
                  color: Colors.grey.shade100,
                  borderRadius: BorderRadius.circular(30.0)),
              width: size.width * 0.34,
              height: size.height * 0.07,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  CircleAvatar(
                      backgroundColor: Colors.white,
                      child: IconButton(
                        onPressed: () {
                          if (cartCubit.quantity > 0) {
                            cartCubit.decreaseQuantity();
                          }
                        },
                        icon: const Icon(
                          Icons.remove,
                          color: Colors.grey,
                        ),
                        alignment: Alignment.center,
                      )),
                  Text(
                    '${cartCubit.quantity}',
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 15.0),
                  ),
                  CircleAvatar(
                      backgroundColor: Colors.white,
                      child: IconButton(
                        onPressed: () {
                          cartCubit.increaseQuantity();
                        },
                        icon: const Icon(
                          Icons.add,
                          color: Colors.pink,
                        ),
                      )),
                ],
              ),
            ),
              ),
              SizedBox(
            height: size.height * 0.03,
              ),
              Padding(
            padding: const EdgeInsets.symmetric(horizontal: 18.0),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "${flower[index].title}",
                      style: const TextStyle(
                          fontSize: 20.0, fontWeight: FontWeight.bold),
                    ),
                    FlowerPrice(price: flower[index].price!),

                  ],
                ),
                SizedBox(
                  height: size.height * 0.02,
                ),
                Text(
                  "${flower[index].description}",
                  style: const TextStyle(
                      color: Colors.grey, fontSize: 14, height: 1.5),
                ),
              ],
            ),
              ),
              SizedBox(
            height: size.height * 0.03,
              ),
              SizedBox(
            width: size.width * 0.5,
            height: size.height * 0.07,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(32.0)),
                backgroundColor: Colors.pink,
              ),
              onPressed: () {
                cartCubit.addToCart(flower[index], cartCubit.quantity);
                cartCubit.quantity=0;

              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: const [
                  Text('Add To Cart'),
                  Icon(Icons.shopping_cart),
                ],
              ),
            ),
              ),
            ]));
      }),
    );
  }
}
