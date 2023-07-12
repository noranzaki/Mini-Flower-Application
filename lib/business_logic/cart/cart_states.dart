abstract class CartStates {}
class CartInitial extends CartStates{}
class AddToCart extends CartStates{}
class CartLoading extends CartStates{}
class CartSuccess extends CartStates{}
class CartFailure extends CartStates{}


class IncreaseQuantity extends CartStates{}
class DecreaseQuantity extends CartStates{}