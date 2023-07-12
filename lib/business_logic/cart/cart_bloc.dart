import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mini_flower_application/business_logic/cart/cart_states.dart';

import '../../data_layer/flowers.dart';

class CartCubit extends Cubit<CartStates>{
  CartCubit():super(CartInitial());
  static CartCubit get(context) => BlocProvider.of(context);
 static List<Flower> cartItems = [];
  int quantity = 0;

  void increaseQuantity(){
   quantity++;
   emit(IncreaseQuantity());
  }
  void decreaseQuantity(){
    quantity--;
    emit(DecreaseQuantity());
  }
  void addToCart(Flower item, int quantity){
    for (int i = 0; i < quantity; i++) {
      cartItems.add(item);
    }
    emit(CartSuccess());
  }
  List getCartItems(){
    emit(CartLoading());
    return cartItems;

  }


}