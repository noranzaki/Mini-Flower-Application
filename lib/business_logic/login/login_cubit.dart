
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mini_flower_application/business_logic/login/login_states.dart';

class LoginCubit extends Cubit<LoginState>{
  LoginCubit():super(LoginInitial());
  static LoginCubit get(context)=>BlocProvider.of(context);
  bool visiblePassword=false;
  void changePasswordVisibility( ){
    visiblePassword = !visiblePassword;
    emit(PasswordVisibilityState());
  }

}